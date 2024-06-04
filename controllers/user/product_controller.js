"use strict";

const connection = require("../../connection");

exports.product_recommended = async (req, res) => {
  connection.query(
    `SELECT * FROM products WHERE stock>0 ORDER BY RAND() LIMIT 4`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        let results = [];
        rows.forEach(row => {
          let item = {
            id_product: row.id_product,
            product_name: row.product_name,
            type: row.type,
            information: row.information,
            picture: process.env.BASE_URL + `/images/product/` + row.picture,
            price: row.price,
            stock: row.stock
          };
          results.push(item);
        });
        return res.status(200).json({ status: 200, values: results });
      }
    }
  );
};

exports.product_sembako = async (req, res) => {
  connection.query(
    `SELECT * FROM products WHERE type=1 AND stock>0 ORDER BY RAND() LIMIT 4`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        let results = [];
        rows.forEach(row => {
          let item = {
            id_product: row.id_product,
            product_name: row.product_name,
            type: row.type,
            information: row.information,
            picture: process.env.BASE_URL + `/images/product/` + row.picture,
            price: row.price,
            stock: row.stock
          };
          results.push(item);
        });
        return res.status(200).json({ status: 200, values: results });
      }
    }
  );
};

exports.all_product_sembako = async (req, res) => {
  connection.query(
    `SELECT * FROM products WHERE type=1 AND stock>0`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        let results = [];
        rows.forEach(row => {
          let item = {
            id_product: row.id_product,
            product_name: row.product_name,
            type: row.type,
            information: row.information,
            picture: process.env.BASE_URL + `/images/product/` + row.picture,
            price: row.price,
            stock: row.stock
          };
          results.push(item);
        });
        return res.status(200).json({ status: 200, values: results });
      }
    }
  );
};

exports.product_daging = async (req, res) => {
  connection.query(
    `SELECT * FROM products WHERE type=2 AND stock>0 ORDER BY RAND() LIMIT 4`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        let results = [];
        rows.forEach(row => {
          let item = {
            id_product: row.id_product,
            product_name: row.product_name,
            type: row.type,
            information: row.information,
            picture: process.env.BASE_URL + `/images/product/` + row.picture,
            price: row.price,
            stock: row.stock
          };
          results.push(item);
        });
        return res.status(200).json({ status: 200, values: results });
      }
    }
  );
};
exports.all_product_daging = async (req, res) => {
  connection.query(
    `SELECT * FROM products WHERE type=2 AND stock>0`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        let results = [];
        rows.forEach(row => {
          let item = {
            id_product: row.id_product,
            product_name: row.product_name,
            type: row.type,
            information: row.information,
            picture: process.env.BASE_URL + `/images/product/` + row.picture,
            price: row.price,
            stock: row.stock
          };
          results.push(item);
        });
        return res.status(200).json({ status: 200, values: results });
      }
    }
  );
};

exports.product_buah = async (req, res) => {
  connection.query(
    `SELECT * FROM products WHERE type=3 AND stock>0 ORDER BY RAND() LIMIT 4`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        let results = [];
        rows.forEach(row => {
          let item = {
            id_product: row.id_product,
            product_name: row.product_name,
            type: row.type,
            information: row.information,
            picture: process.env.BASE_URL + `/images/product/` + row.picture,
            price: row.price,
            stock: row.stock
          };
          results.push(item);
        });
        return res.status(200).json({ status: 200, values: results });
      }
    }
  );
};
exports.all_product_buah = async (req, res) => {
  connection.query(
    `SELECT * FROM products WHERE type=3 AND stock>0`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        let results = [];
        rows.forEach(row => {
          let item = {
            id_product: row.id_product,
            product_name: row.product_name,
            type: row.type,
            information: row.information,
            picture: process.env.BASE_URL + `/images/product/` + row.picture,
            price: row.price,
            stock: row.stock
          };
          results.push(item);
        });
        return res.status(200).json({ status: 200, values: results });
      }
    }
  );
};

exports.product_id = async (req, res) => {
  let id_product = req.params.id_product;
  connection.query(
    `SELECT * FROM products WHERE id_product=?`,
    [id_product],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        let results = [];
        rows.forEach(row => {
          let item = {
            id_product: row.id_product,
            product_name: row.product_name,
            type: row.type,
            information: row.information,
            picture: process.env.BASE_URL + `/images/product/` + row.picture,
            price: row.price,
            stock: row.stock
          };
          results.push(item);
        });
        return res.status(200).json({ status: 200, values: results });
      }
    }
  );
};
