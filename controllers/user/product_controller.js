'use strict';

var response = require('../../res');
var connection = require('../../connection');
var md5 = require('md5');
var ip = require('ip');
var config = require('../../config/secret')
var jwt = require('jsonwebtoken');
var mysql = require('mysql');
const multer = require('multer');
const crypto = require('crypto');
const fs = require('fs');


exports.product_recommended = async (req,res) => {
    await connection.query(`SELECT * FROM products WHERE stock>0 ORDER BY RAND()`,
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                response.ok(rows, res);
            };
        }
    )
}


exports.product_sembako = async (req,res) => {
    await connection.query(`SELECT * FROM products WHERE type=1 AND stock>0 ORDER BY RAND()`,
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                response.ok(rows, res);
            };
        }
    )
}


exports.product_daging = async (req,res) => {
    await connection.query(`SELECT * FROM products WHERE type=2 AND stock>0 ORDER BY RAND()`,
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                response.ok(rows, res);
            };
        }
    )
}


exports.product_buah = async (req,res) => {
    await connection.query(`SELECT * FROM products WHERE type=3 AND stock>0 ORDER BY RAND()`,
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                response.ok(rows, res);
            };
        }
    )
}


exports.product_id = async (req,res) => {
    let id_product = req.params.id_product
    await connection.query(`SELECT * FROM products WHERE id_product=?`,[id_product],
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                response.ok(rows, res);
            };
        }
    )
}



