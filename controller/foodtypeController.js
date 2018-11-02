const db = require('../common/DB/DBServices');

function getFoodType(callback) {
    let sql = "select * from food_types";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}


module.exports = {
    getFoodType
}