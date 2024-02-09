const express = require("express");
const app = express();
const cors = require('cors');

const corsOptions = {
    origin: process.env.CORS_ORIGIN || "*",
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
  }

app.use(cors(corsOptions));
app.use(express.json());

module.exports = app;