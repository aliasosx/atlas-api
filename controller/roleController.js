const db = require('../common/DB/DBServices');

function getRoles(callback) {
    let sql = "select * from roles where enabled=1";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}
module.exports = {
    getRoles,
}