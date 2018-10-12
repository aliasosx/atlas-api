var mysql = require('mysql');
var bcrypt = require('bcrypt');

const saltRounds = 10;

var conn = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "123",
    database: "atlas"
});

function QueryStr(sql, callback) {
    conn.getConnection(function (err, connection) {
        connection.query(sql, function (err, rows) {
            if (err) {
                callback(err);
            } else {
                callback(rows);
            }
            connection.release();
        });
    });
}

function CreateUser(user, callback) {
    bcrypt.hash(user.password, saltRounds, function (err, hash) {
        let sql = "insert into users (username,email,password) values ('" + user.username + "' , '" + user.email + "','" + hash + "')";
        conn.connect(function (err) {
            if (err) {
                callback(err);
            };
            conn.query(sql, function (err, result, field) {
                if (err) {
                    callback(err)
                } else {
                    callback({
                        message: "User added"
                    });
                }
            });
        });
    });
}

function getUsers(callback) {
    let sql = "select * from users";
    QueryStr(sql, function (result) {
        callback(result);
    });
}

function getUserById(id, callback) {
    let sql = "select * from users where id=" + id.id;
    QueryStr(sql, function (result) {
        callback(result);
    });
}

function addNew(user, callback) {
    bcrypt.hash(user.password, saltRounds, function (err, hash) {
        let sql = "insert into users (username,email,password) values ('" + user.username + "' , '" + user.email + "','" + hash + "')";
        QueryStr(sql, function (err, result) {
            callback(err, result);
        });
    });
}

module.exports = {
    CreateUser,
    getUsers,
    getUserById,
    addNew,

}