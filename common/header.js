var express = require('express');
var bodyParser = require('body-parser');
var router = express.Router();
var authenticate = require('../common/Auth/authentication');
var tokenVerification = require('../common/Auth/tokenCheck');

module.exports = {
    express,
    bodyParser,
    router,
    authenticate,
    tokenVerification,
}