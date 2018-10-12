var mysql = require('mysql');
var conn = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "123",
    database: "atlas"
});

function CreateQueryStr(sql, callback) {
    conn.getConnection(function (err, connection) {
        connection.query(sql, function (err, rows) {
            if (err) {
                callback(err, rows);
            } else {
                callback(err, rows);
            }
            connection.release();
        });
    });
}

module.exports = {
    CreateQueryStr
}