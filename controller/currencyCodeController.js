const db = require('../common/DB/DBServices');

function getCurrencyCode(callback) {
    let sql = "select * from currency_code";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}


module.exports = {
    getCurrencyCode
}