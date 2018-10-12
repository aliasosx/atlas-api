var express = require('express');
var bodyParser = require('body-parser');
var router = express.Router();
var authenticate = require('../common/Auth/authentication');

router.post('/', function (req, res) {
    authenticate.loginByEmail(req.body.user, function (result) {
        res.json(result);
    });
});
router.post('/token', function (req, res) {
    //console.log(req.body.token);
    authenticate.verifyToken(req.body.token, (result) => {
        res.json(result);
    });
});

module.exports = router;