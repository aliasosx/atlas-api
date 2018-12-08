var express = require('express');
var bodyParser = require('body-parser');
var router = express.Router();
var authenticate = require('../common/Auth/authentication');
/*
router.post('/', function (req, res) {
    authenticate.loginByEmail(req.body.user, function (result) {
        res.json(result);
    });
});
*/
router.post('/', function (req, res) {
    authenticate.loginByUsername(req.body.user, function (result) {
        res.json(result);
    });
});
router.post('/token', function (req, res) {
    //console.log(req.body.token);
    authenticate.verifyToken(req.body.token, (result) => {
        res.json(result);
    });
});
router.post('/decode', function (req, res) {
    authenticate.decodeToken(req.body.token, (result) => {
        res.json(result);
    });
});

module.exports = router;