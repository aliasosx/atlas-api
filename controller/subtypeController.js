const db = require('../common/DB/DBServices');

function getSubtypes(callback) {

    let sql = "select * from food_subtypes";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}
function addnew(foodSubtype, callback) {
    let sql = "insert into food_subtypes (subtype_name) values ('" + foodSubtype.subtype_name + "')";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

module.exports = {
    getSubtypes,
    addnew,
}