var express = require('express');
var bodyParser = require('body-parser');
var router = express.Router();
var UserController = require('../controller/userController');

router.get('/', function (req, res) {
    let users;

    UserController.getUsers((result) => {
        res.json(result);
    });
});
router.get('/:id', function (req, res) {
    UserController.getUserById(req.params, (result) => {
        res.json(result);
    });
});

router.post('/add', function (req, res) {
    UserController.addNew(req.body.user, function (err) {
        if (err.code) {
            res.json(err);
        } else {
            res.send({
                status: "User add success "
            });
        }
    });

});

module.exports = router;