require('dotenv').config();
const express = require("express");

const app = express();

//Database
const db = require("./db");
//create table
const models = require("./models");
models.init();

app.get("/", (req, res) => {
  res.send("Hello World!");
});

const port = process.env.PORT || 3000

app.listen(port, () => {
  console.log(`listening on port ${port}`);
});
