var express = require("express");
var bodyParser = require("body-parser");
var routes = require("../routes/routes.js");
var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

routes(app);

var rServer = app.listen(3000, function () {
    console.log("app running on port.", rServer.address().port);
});
