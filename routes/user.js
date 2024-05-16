"use strict";

const verifikasiUser = require("../middleware/verifikasi-user");

module.exports = function (app) {
  let api_user = require("../controllers/user");

  //LOGIN

  app.route(`/api/user/login`)
    .post(api_user.auth_controller.login);

  app.route('/api/user/check/:token')
    .get(api_user.auth_controller.check_user);


  //PRODUCT CONTROLLER

  //RECOMMENDED
  app.route('/api/user/products/recommended')
    .get(verifikasiUser, api_user.product_controller.product_recommended);

  app.route('/api/user/products/recommended/sembako')
    .get(verifikasiUser, api_user.product_controller.product_sembako);

  app.route('/api/user/products/recommended/daging')
    .get(verifikasiUser, api_user.product_controller.product_daging);

  app.route('/api/user/products/recommended/buah')
    .get(verifikasiUser, api_user.product_controller.product_buah);

    app.route('/api/user/product/:id_product')
    .get(verifikasiUser, api_user.product_controller.product_id);




};

