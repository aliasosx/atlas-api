const db = require('../common/DB/DBServices');

function getFoodType(callback) {
    let sql = "select * from food_types";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function createFoodType(foodType, callback) {
    let sql = "insert into food_types (food_type, food_type_desc,food_type_desc_la) values ('" + foodType.food_type + "','" + foodType.food_type_desc + "', '" + foodType.food_type_desc_la + "')";
    db.CreateQueryStr(sql, (err, rows) => {
        callback(err, rows);
    });
}

function updateFoodType(foodType, callback) {
    let sql = "update food_types set food_type='" + oodType.food_type + "',food_type_desc = '" + foodType.food_type_desc + "', food_type_desc_la = '" + foodType.food_type_desc_la + "' where id=" + foodType.id;
    db.CreateQueryStr(sql, (err, rows) => {
        callback(err, rows);
    });
}

function deleteFoodType(id, callback) {
    let sql = "delete from food_types where id=" + id;
    db.CreateQueryStr(sql, (err, rows) => {
        callback(err, rows);
    });
}

module.exports = {
    getFoodType,
    createFoodType,
    updateFoodType,
    deleteFoodType,

}