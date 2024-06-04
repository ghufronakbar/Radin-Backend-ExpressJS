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

// Konfigurasi multer untuk menyimpan file di folder 'images/menu'

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'images/product/');
    },
    filename: function (req, file, cb) {
        // Mendapatkan ekstensi file
        const ext = file.originalname.split('.').pop();
        // Membuat string acak sepanjang 6 karakter
        const randomString = crypto.randomBytes(3).toString('hex');
        // Menggabungkan nama file asli dengan string acak dan ekstensi
        const newFilename = file.originalname.replace(`.${ext}`, `_${randomString}.${ext}`);
        cb(null, newFilename);
    }
});

const upload = multer({ storage: storage }).single('picture');




//ALL products
exports.products = function (req, res) {
    connection.query(`SELECT * FROM products`,
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                rows.forEach(row => {
                    let item = {
                      id_product: row.id_product,
                      product_name: row.product_name,
                      type: row.type,
                      information: row.information,
                      picture: process.env.BASE_URL + `/images/menu/` + row.picture,
                      price: row.price,
                      stock: row.stock
                    };
                    results.push(item);
                  });
                  return res.status(200).json({ status: 200, values: results });
            };
        }
    )
};

//product ID
exports.productId = function (req, res) {
    let id_product = req.params.id_product
    connection.query(`SELECT * FROM products WHERE id_product=?`, [id_product],
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                rows.forEach(row => {
                    let item = {
                      id_product: row.id_product,
                      product_name: row.product_name,
                      type: row.type,
                      information: row.information,
                      picture: process.env.BASE_URL + `/images/menu/` + row.picture,
                      price: row.price,
                      stock: row.stock
                    };
                    results.push(item);
                  });
                  return res.status(200).json({ status: 200, values: results });
            };
        }
    )
};

//product ADD
exports.productAdd = function (req, res) {
    upload(req, res, function (err) {
        if (err instanceof multer.MulterError) {
            console.log(err);
            return res.status(500).json({ success: false, message: 'Failed to upload image.' });
        } else if (err) {
            console.log(err);
            return res.status(500).json({ success: false, message: 'An unexpected error occurred.' });
        }

        let product_name = req.body.product_name;
        let type = req.body.type;
        let information = req.body.information;
        let price = req.body.price;
        let picture = req.file ? req.file.filename : null;
        let stock = 0;

        connection.query(`INSERT INTO products(product_name, type, information, price, picture, stock)
                        VALUES(?,?,?,?,?,?)`, [product_name, type, information, price, picture, stock],
            function (error, rows, fields) {
                if (error) {
                    console.log(error);
                    return res.status(500).json({ success: false, message: 'An error occurred while adding menu.' });
                } else {
                    return res.status(200).json({ success: true, message: 'product added successfully.' });
                }
            }
        );
    });
};

//product EDIT
exports.productEdit = function (req, res) {
    upload(req, res, function (err) {
        if (err instanceof multer.MulterError) {
            // Jika terjadi kesalahan dari multer
            console.log(err);
            return res.status(500).json({ success: false, message: 'Failed to upload image.' });
        } else if (err) {
            // Jika terjadi kesalahan lain
            console.log(err);
            return res.status(500).json({ success: false, message: 'An unexpected error occurred.' });
        }

        // Jika tidak terjadi kesalahan, lanjutkan dengan menyimpan data menu
        let product_name = req.body.product_name;
        let type = req.body.type;
        let information = req.body.information;
        let price = req.body.price;
        let id_product = req.params.id_product;

        let picture = req.file ? req.file.filename : null;

        if (!picture) {
            // Jika tidak ada gambar baru diunggah
            connection.query(`UPDATE products SET product_name=?, type=?, information=?, price=? WHERE id_product=?`,
                [product_name, type, information, price, id_product],
                function (error, rows, fields) {
                    if (error) {
                        console.log(error);
                        return res.status(500).json({ success: false, message: 'An error occurred while editing menu.' });
                    } else {
                        return res.status(200).json({ success: true, message: 'product edited successfully.' });
                    }
                }
            );
        } else {
            // Jika ada gambar baru diunggah, hapus gambar sebelumnya (jika ada)
            connection.query(`SELECT picture FROM products WHERE id_product=?`, [id_product], function (error, rows, fields) {
                if (error) {
                    console.log(error);
                    return res.status(500).json({ success: false, message: 'An error occurred while fetching previous picture.' });
                } else {
                    const previousPicture = rows[0].picture;
                    if (previousPicture) {
                        try {
                            // Hapus gambar sebelumnya dari direktori
                            fs.unlinkSync(`images/menu/${previousPicture}`);
                        } catch (err) {
                            // Tangani kesalahan jika file tidak ditemukan atau gagal dihapus
                            console.log('Failed to delete previous picture:', err);
                        }
                    }
                    // Update data product dengan gambar baru
                    connection.query(`UPDATE products SET product_name=?, type=?, information=?, price=?, picture=? WHERE id_product=?`,
                        [product_name, type, information, price, picture, id_product],
                        function (error, rows, fields) {
                            if (error) {
                                console.log(error);
                                return res.status(500).json({ success: false, message: 'An error occurred while editing menu.' });
                            } else {
                                return res.status(200).json({ success: true, message: 'product edited successfully.' });
                            }
                        }
                    );
                }
            });
        }
    });
};




//product SET STOCK
exports.productSetStock = function (req, res) {
    let stock = req.body.stock
    let id_product = req.params.id_product

        connection.query(`UPDATE products SET stock=? WHERE id_product=?`,
            [stock, id_product],
            function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res);
                };
            }
        )
    
};


//product DELETE
exports.productDelete = function (req, res) {
    let id_product = req.params.id_product;
    // Query untuk mengambil nama file gambar product sebelum menghapus record
    connection.query(`SELECT picture FROM products WHERE id_product=?`, [id_product], function (error, rows, fields) {
        if (error) {
            console.log(error);
            return res.status(500).json({ success: false, message: 'An error occurred while fetching previous picture.' });
        } else {
            const previousPicture = rows[0].picture;
            // Jalankan query hapus data
            connection.query(`DELETE FROM products WHERE id_product=?`, [id_product], function (error, rows, fields) {
                if (error) {
                    console.log(error);
                    return res.status(500).json({ success: false, message: 'An error occurred while deleting menu.' });
                } else {
                    // Jika penghapusan berhasil, cek apakah ada gambar yang terkait dengan product yang dihapus
                    if (previousPicture) {
                        try {
                            // Hapus gambar sebelumnya dari direktori
                            fs.unlinkSync(`images/menu/${previousPicture}`);
                        } catch (err) {
                            // Tangani kesalahan jika file tidak ditemukan atau gagal dihapus
                            console.log('Failed to delete previous picture:', err);
                        }
                    }
                    // Kirim respons bahwa product telah dihapus dengan sukses
                    return res.status(200).json({ success: true, message: 'product deleted successfully.' });
                }
            });
        }
    });
};
