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
router.post('/changePasswordUserByEmpId', (req, res) => {
    if (req.headers.authorization != null) {
        if (tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            UserController.changeUserPasswordByEmpId(req.body.user, function (err) {
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

router.post('/usersbyusername', (req, res) => {
    if (req.headers.authorization != null) {
        if (tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            UserController.getUserByUsername(req.body.user, function (result) {

                res.json(result);

            });
        } else {
            res.send('Unauthorized');
        }
    } else {
        res.send('Unauthorized');
    }
});
router.post('/audit', (req, res) => {
    /*
    if (req.headers.authorization != null) {
        if (tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            UserController.auditUser(req.body.user, function (result) {
                res.json(result);
            });
        } else {
            res.send('Unauthorized');
        }
    } else {
        res.send('Unauthorized');
    }
    */
    console.log('User audit processig ' + req.body.user);
    UserController.auditUser(req.body.user, (result) => {
        res.json(result);
    })
});
module.exports = router;