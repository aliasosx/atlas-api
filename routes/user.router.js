var express = require('express');
var router = express.Router();
var UserController = require('../controller/userController');
var tokenVerification = require('../common/Auth/tokenCheck');

router.get('/', function (req, res) {
    if (req.headers.authorization != null) {
        if (tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            UserController.getUsers((result) => {
                res.json(result);
            });
        } else {
            res.send('Unauthorized');
        }
    } else {
        res.send('Unauthorized');
    }

});
router.get('/:id', function (req, res) {
    if (req.headers.authorization != null) {
        if (tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            UserController.getUserById(req.params, (result) => {
                res.json(result);
            });
        } else {
            res.send('Unauthorized');
        }
    } else {
        res.send('Unauthorized');
    }
});

router.post('/add', function (req, res) {
    if (req.headers.authorization != null) {
        if (tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            UserController.addNew(req.body.user, function (err) {
                if (err.code) {
                    res.json(err);
                } else {
                    res.send({
                        status: "success"
                    });
                }
            });
        } else {
            res.send('Unauthorized');
        }
    } else {
        res.send('Unauthorized');
    }
});
router.delete('/delete/:id', (req, res) => {
    if (req.headers.authorization != null) {
        if (tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            UserController.deleteUser(req.params.id, function (err) {
                if (err.code) {
                    res.json(err);
                } else {
                    res.send({
                        status: "success"
                    });
                }
            });
        } else {
            res.send('Unauthorized');
        }
    } else {
        res.send('Unauthorized');
    }
});

module.exports = router;