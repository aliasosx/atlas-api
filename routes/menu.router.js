var header_req = require('../common/header');
var menuController = require('../controller/menuController');

header_req.router.get('/', function(req,res){
    if(req.headers.authorization != null){
        if(header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))){
            menuController.getMenus(function(err,rows){
                    res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        } 
    } else {
        res.json('Unauthorized');
    } 
});
header_req.router.get('/usermenu', function(req, res) {
    if(req.headers.authorization != null){
        if(header_req.tokenVerification.verifyToken(req.headers.authorization.replace("Bearer ", ""))){
            let user_info = header_req.tokenVerification.decode(req.headers.authorization.replace("Bearer ", "")).payload.split("|");
            //console.log(user_info[0]);
            menuController.getMenuByToken(user_info[0], function(err, rows){
                res.json(rows);
            });
        } else {
            res.json('Unauthorized');
        } 
    } else {
        res.json('Unauthorized');
    } 
});

module.exports = header_req.router;