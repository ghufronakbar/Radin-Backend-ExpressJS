"use strict";

var response = require("../../res");
var connection = require("../../connection");
var md5 = require("md5");
var ip = require("ip");
var config = require("../../config/secret");
var jwt = require("jsonwebtoken");
var mysql = require("mysql");
const multer = require("multer");
const crypto = require("crypto");
const fs = require("fs");

exports.cartUser = async (req, res) => {
  const id_user = req.decoded.id_user;
  const query = `
      SELECT 
          c.id_cart, 
          c.id_user, 
          i.id_cart_item, 
          i.id_product, 
          i.amount,
          p.product_name, 
          p.type, 
          p.information, 
          p.picture, 
          p.price, 
          p.stock 
      FROM 
          carts AS c 
      JOIN 
          cart_items AS i ON c.id_cart = i.id_cart 
      JOIN 
          products AS p ON i.id_product = p.id_product
      WHERE 
          c.id_user = ?
  `;

  connection.query(query, [id_user], function (error, rows, fields) {
      if (error) {
          console.log(error);
          res.status(500).json({ status: 500, message: "Internal Server Error" });
      } else {
          if (rows.length === 0) {
              res.status(204).json({ status: 204, message: "There's no item in cart" });
          } else {
              const result = {};

              rows.forEach(row => {
                  const { id_cart, id_user, ...item } = row;
                  item.picture = `${process.env.BASE_URL}/images/product/${row.picture}`; // Modify picture URL
                  item.checkoutable = item.stock; // Add checkoutable field based on status

                  if (!result[id_cart]) {
                      result[id_cart] = {
                          id_cart,
                          id_user,
                          checkoutable: true,
                          cart_item: []
                      };
                  }

                  // Add item to cart_item array
                  result[id_cart].cart_item.push(item);

                  // If any item is not checkoutable, set cart's checkoutable to false
                  if (!item.checkoutable) {
                      result[id_cart].checkoutable = false;
                  }
              });

              res.status(200).json({
                  status: 200,
                  values: Object.values(result)
              });
          }
      }
  });
};


exports.cartSetAmount = async (req, res) => {
  const amount = parseInt(req.body.amount);
  const id_cart_item = req.body.id_cart_item;

  const query_select_item = `SELECT i.*, p.* FROM cart_items AS i 
                            JOIN products AS p 
                            WHERE i.id_product = p.id_product
                            AND i.id_cart_item=?`;
  connection.query(
    query_select_item,
    [id_cart_item],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
        return res
          .status(500)
          .json({ status: 500, message: "Internal Server Error" });
      } else {
        if (rows.length === 0) {
          return res
            .status(404)
            .json({ status: 404, message: "Cart item not found" });
        }

        if (amount > 0) {
          if (rows[0].amount >= rows[0].stock) {
            return res.status(400).json({
              status: 400,
              message: "Stok produk tidak memenuhi pesananmu",
            });
          }
        }

        const current_amount = parseInt(rows[0].amount);
        const total_amount = amount + current_amount;

        if (total_amount < 1) {
          const query_delete_item = `DELETE FROM cart_items WHERE id_cart_item=?`;
          connection.query(
            query_delete_item,
            [id_cart_item],
            function (error, result) {
              if (error) {
                console.log(error);
                res
                  .status(500)
                  .json({ status: 500, message: "Internal Server Error" });
              } else {
                res.status(200).json({
                  status: 200,
                  message: "Item has been deleted",
                });
              }
            }
          );
        } else {
          const query_set_amount = `UPDATE cart_items SET amount=? WHERE id_cart_item=?`;
          connection.query(
            query_set_amount,
            [total_amount, id_cart_item],
            function (error, result) {
              if (error) {
                console.log(error);
                res
                  .status(500)
                  .json({ status: 500, message: "Internal Server Error" });
              } else {
                res.status(200).json({
                  status: 200,
                  message: "Amount has been set",
                });
              }
            }
          );
        }
      }
    }
  );
};

exports.cartDeleteItem = async (req, res) => {
  const id_cart_item = req.params.id_cart_item;
  const query_delete_item = `DELETE FROM cart_items WHERE id_cart_item=?`;
  connection.query(query_delete_item, [id_cart_item], function (error, result) {
    if (error) {
      console.log(error);
      res.status(500).json({ status: 500, message: "Internal Server Error" });
    } else {
      res.status(201).json({
        status: 201,
        message: "Item has been deleted",
      });
    }
  });
};

exports.addToCart = async (req, res) => {
  const id_user = req.decoded.id_user;
  const id_product = req.body.id_product;

  const qValidation = `SELECT i.id_cart_item, i.amount, p.stock 
                        FROM cart_items AS i
                        JOIN products AS p 
                        WHERE i.id_product = p.id_product 
                        AND p.id_product=? AND i.id_cart=?`;
  connection.query(
    qValidation,
    [id_product, id_user],
    function (error, rows, result) {
      if (error) {
        console.log(error);
        res.status(500).json({ status: 500, message: "Internal Server Error" });
      } else {
        const isProductExist = rows.length;
        // if(amount>0){
        // }
        if (isProductExist) {
          if (rows[0].amount >= rows[0].stock) {
            return res.status(400).json({
              status: 400,
              message: "Stok produk tidak memenuhi pesananmu",
            });
          }
          const id_cart_item = rows[0].id_cart_item;
          const amount = parseInt(rows[0].amount) + 1;
          const qIncrement = `UPDATE cart_items SET amount=? WHERE id_cart_item=?`;
          connection.query(
            qIncrement,
            [amount, id_cart_item],
            function (error, rows, result) {
              if (error) {
                console.log(error);
                res
                  .status(500)
                  .json({ status: 500, message: "Internal Server Error" });
              } else {
                res.status(200).json({
                  status: 200,
                  message: "Jumlah produk telah ditambahkan",
                });
              }
            }
          );
        } else {
          const add_query = `INSERT INTO cart_items(id_product,id_cart,amount) VALUES(?,?,?)`;
          connection.query(
            add_query,
            [id_product, id_user, 1],
            function (error, rows, result) {
              if (error) {
                console.log(error);
                res
                  .status(500)
                  .json({ status: 500, message: "Internal Server Error" });
              } else {
                res.status(200).json({
                  status: 200,
                  message: "Produk telah ditambahkan ke keranjang",
                });
              }
            }
          );
        }
      }
    }
  );
};
