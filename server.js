const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const path = require('path');
const cors = require("cors");
require('dotenv').config()


//parse application json
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());

//routes
var routesAdmin = require("./routes/admin");
routesAdmin(app);


var routesUser = require("./routes/user");
routesUser(app);

app.use('/images/product', express.static(path.join(__dirname, 'images/product')));

app.listen(5000, () => {
  console.log(`Server started on port`);
});
