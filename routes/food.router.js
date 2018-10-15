var header_req = require('../common/header');
var foodController = require('../controller/foodController');
var AuthCheck = require('../common/authorizationCheck');

header_req.router.get('/', (req, res) => {
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

header_req.router.post('/addFood', (req, res) => {
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
header_req.router.post('/updatefood', (req, res) => {
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


module.exports = header_req.router;