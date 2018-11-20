var mysql = require('mysql');
var conn = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "123",
    database: "atlas"
});

function CreateQueryStr(sql, callback) {
    console.log(sql);
    if (sql.substring(0, 6).toUpperCase().startsWith("SELECT")) {
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
    } else {
        try {
            conn.getConnection((err, connection) => {

                if (!err) {
                    connection.query(sql, (err, rows) => {
                        if (err) {
                            //console.log(err);
                            callback(err, rows);
                        } else {
                            console.log('Query successful');
                            callback(err, rows);
                        }
                        connection.release();
                    });
                }
            });
        } catch (err) {
            console.log("exception: " + err);
        }



        /*
        conn.getConnection(function (err, connection) {
            connection.query(sql, function (err, rows) {
                if (err) {
                    callback(err, rows);
                } else {
                    connection.beginTransaction(function (err) {
                        if (err) {
                            connection.rollback(function (err) {
                                console.log(err);
                                callback(err);
                            });
                        }
                        connection.commit(function (err) {
                            if (err) {
                                console.log(err);
                                callback(err);
                            }
                            callback(err, rows);
                            connection.release();
                        });
                    });
                }
            });
        });
        */

    }
}

function createQueryWithTransaction(sql, callback) {
    console.log(sql);
    var sql_count = Object.keys(sql).length;
    console.log(sql_count);
    var start_array = 0;
    conn.getConnection(function (err, connection) {
        if (err) {
            callback(err);
        }
    });
}

module.exports = {
    CreateQueryStr,
    createQueryWithTransaction,
}