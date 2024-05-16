'use strict';

const response = require('../../res');
const connection = require('../../connection');
const md5 = require('md5');
const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const config = require('../../config/secret');
const ip = require('ip');
const verifikasi = require('../../middleware/verifikasi-user');

// LOGIN
exports.login = function (req, res) {
  const { email, password } = req.body;

  if (!email || !password) {    
    return res.json({ status: 400, message: "Email and password are required" });
  }

  const query = "SELECT email, id_user FROM users WHERE password=? AND email=?";
  const values = [md5(password), email];

  connection.query(query, values, function (error, rows) {
    if (error) {
      console.error(error);
      
      return res.status(500).json({ success: false, message: "Internal server error" });
    }

    if (rows.length === 1) {
      const id_user = rows[0].id_user;
      const token = jwt.sign({ id_user }, config.secret, { expiresIn: 1440 * 4 });
      const data = { id_user, token, ip_address: ip.address() };

      const insertQuery = "INSERT INTO akses_token SET ?";
      
      connection.query(insertQuery, data, function (insertError) {
        if (insertError) {
          console.error(insertError);
          return res.status(500).json({ success: false, message: "Internal server error" });
        }

        res.json({
          success: true,
          message: "Token JWT Generated!",
          token: token,
          currUser: id_user
        });
      });
    } else {
      return res.json({ status: 403, message: "Invalid Email or password" });
    }
  });
};

exports.check_user = function (req, res) {
  let token = req.params.token;
  verifikasi(token)(req, res, function () {
    var id_user = req.decoded.id_user;
    res.status(200).json({ status: 200, id_user: id_user });
  });
};


// exports.infoUserLogin = function (req, res) {
//   let token = req.params.token;
//   verifikasi(token)(req, res, function () {
//     var id_user = req.decoded.id_user
//     connection.query(`SELECT email,kk,nama_lengkap,tanggal_lahir,foto,hak_pilih FROM users WHERE id_user=?`, id_user,
//       function (error, rows, fields) {
//         if (error) {
//           console.log(error);
//         } else {
//           console.log(rows);
//           response.ok(rows, res)
//         }
//       });
//   })
// };

// exports.mob_update_profile = function (req, res) {
//   let token = req.params.token;
//   console.log(token);
//   verifikasi(token)(req, res, function () {
//     var id_user = req.decoded.id_user;
//     connection.query(
//       `SELECT foto, email FROM users 
//                           WHERE id_user=?`,
//       [id_user],
//       function (error, rows, fields) {
//         if (error) {
//           console.log(error);
//           res.status(500).send("Internal Server Error");
//         } else {
//           console.log("cek ", rows[0].foto);
//           const uploadDirectory = path.join(
//             __dirname,
//             "..",
//             "..",
//             "upload",
//             "warga"
//           );

//           // Menggunakan modul url untuk mengurai URL
//           const parsedUrl = url.parse(rows[0].foto);

//           // Menggunakan modul path untuk mendapatkan nama file dari path
//           const fileName = path.basename(parsedUrl.pathname);
//           console.log(fileName);
//           // storage engine
//           const storage = multer.diskStorage({
//             destination: "./upload/warga",
//             filename: (req, file, cb) => {
//               return cb(null, fileName);
//             },
//           });

//           const upload = multer({
//             storage: storage,
//             limits: {
//               fileSize: 10 * 1024 * 1024, // 10 MB (dalam bytes)
//             },
//           }).single("image");
//           upload(req, res, function (err) {
//             if (err instanceof multer.MulterError) {
//               // Jika terjadi kesalahan dari multer (misalnya melebihi batas ukuran file)
//               return res.json({
//                 success: 0,
//                 message: err.message,
//               });
//             } else if (err) {
//               // Jika terjadi kesalahan lainnya
//               return res.json({
//                 success: 0,
//                 message: "Terjadi kesalahan saat mengunggah gambar",
//               });
//             }
//             res.json({
//               success: 200,
//               image_url: `/profile/${req.file.filename}`,
//             });
//           });
//           //   response.ok(rows, res);
//         }
//       }
//     );
//   });
// };


// //Post password Users match
// exports.mobaccountpassword = function (req, res) {
//   let token = req.body.token;
//   let password = req.body.password;
//   verifikasi(token)(req, res, function () {
//     var id_user = req.decoded.id_user;
//     connection.query(
//       `SELECT password FROM users 
//                         WHERE id_user=?`,
//       [id_user],
//       function (error, rows, fields) {
//         if (error) {
//           console.log(error);
//           res.status(500).send("Internal Server Error");
//         } else {
//           var oldPassword = md5(password);
//           if (oldPassword == rows[0].password) {
//             res.status(200).json({ match: true });
//           } else {
//             res.status(200).json({ match: false });
//           }
//         }
//       }
//     );
//   });
// };

// //PUT PASSWORD
// exports.mobpasswordedit = function (req, res) {
//   let new_password = req.body.new_password;
//   let token = req.body.token;
//   verifikasi(token)(req, res, function () {
//     var id_user = req.decoded.id_user;
//     connection.query(
//       `UPDATE warga SET password=? WHERE id_user=?`,
//       [md5(new_password), id_user],
//       function (error, rows, fields) {
//         if (error) {
//           console.log(error);
//           res.status(500).send("Internal Server Error");
//         } else {
//           response.ok(rows, res);
//         }
//       }
//     );
//   });
// };