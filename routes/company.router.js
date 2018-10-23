var header_req = require('../common/header');
var AuthCheck = require('../common/authorizationCheck');
var companyController = require('../controller/companyController');

header_req.router.post('/', function (req, res) {
    console.log(req.body);
    if (req.headers.authorization != null) {
        if (AuthCheck.tokenCheck(req.headers)) {
            companyController.getInfo(req.body.company, function (err, company) {
                if (company != null) {
                    res.json(company);
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

module.exports = header_req.router;