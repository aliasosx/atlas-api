var header_req = require('../common/header');
var AuthCheck = require('../common/authorizationCheck');
var customerController = require('../controller/customerController');

header_req.router.post('/', function (req, res) {
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

header_req.router.post('/addnew', function (req, res) {
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
header_req.router.post('/updateCustomer', function (req, res) {
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

module.exports = header_req.router;