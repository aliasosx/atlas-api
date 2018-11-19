const db = require('../common/DB/DBServices');

function getQtag(callback){
    let sql = "select * from qtags where status='1'";
        db.CreateQueryStr(sql, function (err, rows) {
            callback(err, rows);
        });
}

module.exports = {
    getQtag,
}