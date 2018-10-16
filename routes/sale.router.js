var header_req = require('../common/header');
var salecontroller = require('../controller/saleController');

header_req.router.post('/createsale', function (req, res) {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            salecontroller.create_sale(req.body.sale, (err, rows) => {
                if (err) {
                    res.json({
                        status: err
                    });
                } else {
                    res.json({
                        status: "Operation success"
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

module.exports = header_req.router;