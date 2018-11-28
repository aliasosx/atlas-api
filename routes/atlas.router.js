var express = require('express');
var router = express.Router();
var multer = require('multer');

var UserController = require('../controller/userController');
var CompanyController = require('../controller/companyController');
var customerController = require('../controller/customerController');
var foodController = require('../controller/foodController');
var MenuController = require('../controller/menuController');
var SaleController = require('../controller/saleController');
var FoodTypeController = require('../controller/foodtypeController');
var CurrencyCodeController = require('../controller/currencyCodeController');
var DiscountController = require('../controller/discountController');
var QController = require('../controller/qController');
var KitchenController = require('../controller/kitchenController');
var OrderController = require('../controller/orderController');
var ordertrackingController = require('../controller/orderTrackingController');
var RoleController = require('../controller/roleController');

var storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images/uploads/foods')
    },
    filename: (req, file, cb) => {
        cb(null, file.originalname);
    }
});

var storage_user_photo = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images/uploads/users')
    },
    filename: (req, file, cb) => {
        cb(null, file.originalname);
    }
});

var upload = multer({
    storage: storage
});

var upload_user_photo = multer({
    storage: storage_user_photo
});

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

router.post('/menus/permit', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            let user_info = header_req.tokenVerification.decode(req.headers.authorization.replace("Bearer ", "")).payload.split("|");
            MenuController.menuByUser(user_info[0], req.body.user, function (err, rows) {
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
router.get('/customers/:id', function (req, res) {
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            customerController.getCustomer(req.params.id, function (err, customer) {
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

router.get('/customers', (req, res) => {
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            customerController.getCustomers(function (err, customer) {
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
router.put('/customer/updateCustomer', function (req, res) {
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
router.get('/foods', (req, res) => {
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

router.get('/food/:id', (req, res) => {
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            foodController.getFoodsById(req.params.id, function (err, foods) {
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
/* Add Food menu */
router.post('/food/addFood', (req, res) => {
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            console.log(req.body);
            if (req.body.food) {
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
                    status: "Data incorrect"
                })
            }
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

router.get('/foodtypes', function (req, res) {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            FoodTypeController.getFoodType(function (err, rows) {
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.get('/currcodes', function (req, res) {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            CurrencyCodeController.getCurrencyCode(function (err, rows) {
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.post('/food/remove', function (req, res) {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            foodController.removeFoodById(req.body.food, function (err, rows) {
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
/* foot Type */

router.post('/foodtype', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            FoodTypeController.createFoodType(req.body.foodtype, (err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json({
                        status: rows
                    });
                }

            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.put('/foodtype', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            console.log(req.body);
            FoodTypeController.updateFoodType(req.body.foodtype, (err, rows) => {
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
router.delete('/foodtype/:id', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            FoodTypeController.deleteFoodType(req.params.id, (err, rows) => {
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
router.get('/foodbycat/:id', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            foodController.getFoodByCate(req.params.id, (err, rows) => {
                console.log(req.params.id);
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

/* upload file */
router.post('/food/upload', upload.single('image'), (req, res, next) => {
    res.json({
        'message': 'File uploaded successfully'
    });
});

router.post('/users/upload', upload_user_photo.single('image'), (req, res, next) => {
    res.json({
        'status': 'success'
    });
});


/* Discount routing */
router.get('/discounts', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            DiscountController.getDiscounts((err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
router.delete('/discount/:id', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            DiscountController.deleteDiscount(req.params.id, (err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
router.post('/discount', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            DiscountController.createDiscount(req.body.discount, (err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
router.get('/foodnodiscounts', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            DiscountController.getFoodByDiscount((err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.get('/q', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            QController.getQtag((err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.get('/kitchens', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            KitchenController.getKitchen((err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.post('/order', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            OrderController.createOrder(req.body.order, (err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.put('/food', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            foodController.updateFood(req.body.food, (err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
router.put('/foodactive', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            foodController.activateFood(req.body.food, (err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});


// Tracking Order 

router.get('/ordertracking', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            ordertrackingController.getOrderTracks((err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});

router.put('/ordertracking', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            console.log(req.body.ordertrack)
            ordertrackingController.updateOrderTrackDone(req.body.ordertrack, (err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
// Roles 

router.get('/roles', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            console.log(req.body.ordertrack)
            RoleController.getRoles((err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json(rows);
                }
            });
        } else {
            res.json('Unauthorized');
        }
    } else {
        res.json('Unauthorized');
    }
});
module.exports = router;