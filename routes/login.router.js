var express = require('express');
var bodyParser = require('body-parser');
var router = express.Router();
var authenticate = require('../common/Auth/authentication');

router.post('/', function (req, res) {
    authenticate.loginByEmail(req.body.user, function (result) {
        res.json(result);
    });
});
module.exports = router;