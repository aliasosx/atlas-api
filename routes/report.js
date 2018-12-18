var express = require('express');
var router = express.Router();
var reportController = require('../controller/reportController');
var tokenVerification = require('../common/Auth/tokenCheck');
var header_req = require('../common/header');
var AuthCheck = require('../common/authorizationCheck');

router.get('/reportByCats', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            reportController.getReportByCat((err, rows) => {
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
router.get('/reportRevBykitchen', (req, res) => {
    if (req.headers.authorization != null) {
        if (header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))) {
            reportController.getReportRevByKitchen((err, rows) => {
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