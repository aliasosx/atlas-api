const db = require('../common/DB/DBServices');

function getKitchen(callback) {
    let sql = "select * from kitchens";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

module.exports = {
    getKitchen,
}