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
function getFoodBySubtype(food_id, callback) {
    let sql = "select * from foods, food_subtypes , food_subtype_tranx where food_subtype_tranx.food_id = foods.id and food_subtype_tranx.food_subtype_id = food_subtypes.id where foods.id =" + food_id;
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}
function getFoodSubtypeByFoodId(id, callback) {
    let sql = "select * from food_subtypes fs ,  price_masters pm where fs.id = pm.food_subtype_id and pm.food_id = " + id;
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}
module.exports = {
    getSubtypes,
    addnew,
    getFoodBySubtype,
    getFoodSubtypeByFoodId,
}