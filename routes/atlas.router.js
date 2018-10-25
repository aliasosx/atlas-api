var express = require('express');
var router = express.Router();
var UserController = require('../controller/userController');
var CompanyController = require('../controller/companyController');
var customerController = require('../controller/customerController');
var foodController = require('../controller/foodController');
var MenuController = require('../controller/menuController');
var SaleController = require('../controller/saleController');

var tokenVerification = require('../common/Auth/tokenCheck');
var header_req = require('../common/header');
var AuthCheck = require('../common/authorizationCheck');
/* Menu module */
router.get('/menus', function (req, res) {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            menuController.getMenus(function (err, rows) {
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.get('/menus/usermenu', function (req, res) {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            let user_info = header_req.tokenVerification.decode(req.headers.authorization.replace("Bearer ", "")).payload.split("|");
            MenuController.getMenuByToken(user_info[0], function (err, rows) {
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
/* company module */
router.post('/company', function (req, res) {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            let user_info = header_req.tokenVerification.decode(req.headers.authorization.replace("Bearer ", "")).payload.split("|");
            CompanyController.getInfo(req.body.company, function (err, rows) {
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

/* Customer module */
router.post('/customer', function (req, res) {
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            customerController.getCustomer(req.body.customer, function (err, customer) {
                if (customer != null) {
                    res.json(customer);
                } else {
                    res.json({
                        status: "No Record"
                    });
                }
            });
        } else {
            res.json({
                status: 'fail'
            });
        }
    } else {
        res.json({
            status: "Unauthorized"
        });
    }

});

router.post('/customer/addnew', function (req, res) {
    if (AuthCheck.tokenCheck(req.headers)) {
        customerController.AddnewCustomer(req.body.customer, function (result) {
            res.json(result);
        });
    } else {
        res.json({
            status: 'fail'
        });
    }
});
router.post('/customer/updateCustomer', function (req, res) {
    if (AuthCheck.tokenCheck(req.headers)) {
        customerController.UpdateCustomerInfo(req.body.customer, function (result) {
            res.json(result);
        });
    } else {
        res.json({
            status: 'fail'
        });
    }
});

/* Food module */
router.get('/food', (req, res) => {
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            foodController.getFoods(function (err, foods) {
                if (!err) {
                    res.json(foods);
                } else {
                    res.json(err);
                }
            });
        } else {
            res.json({
                status: "Unauthorized"
            })
        }
    } else {
        res.json({
            status: "Unauthorized"
        })
    }
});

router.post('/food/addFood', (req, res) => {
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            foodController.addFoods(req.body.food, function (err, rows) {
                if (!err) {
                    res.json({
                        status: "Operation success"
                    })
                } else {
                    res.json({
                        status: err
                    })
                }
            });
        } else {
            res.json({
                status: "Unauthorized"
            })
        }
    } else {
        res.json({
            status: "Unauthorized"
        })
    }
});
router.post('/food/updatefood', (req, res) => {
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            foodController.updateFood(req.body.food, function (err, rows) {
                if (!err) {
                    res.json({
                        status: "Operation success"
                    });
                } else {
                    res.json({
                        status: err
                    })
                }
            });
        } else {
            res.json({
                status: "Unauthorized"
            })
        }
    } else {
        res.json({
            status: "Unauthorized"
        })
    }
});

module.exports = router;