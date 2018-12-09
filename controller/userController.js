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
function getUserByUsername(user, callback) {
    let sql = "select * from users where username='" + user.user_name + "'";
    QueryStr(sql, function (result) {
        callback(result);
    });
}

function addNew(user, callback) {
    bcrypt.hash(user.password, saltRounds, function (err, hash) {
        let sql = "insert into users (username,email,password,gender,fullname,photo,dateofbirth,current_address,mobile,role_code) values ('" + user.username + "' , '" + user.email + "','" + hash + "', '" + user.gender + "', '" + user.fullname + "', '" + user.photo + "','" + user.dateofbirth + "','" + user.current_address + "','" + user.mobile + "','" + user.role_code + "')";
        QueryStr(sql, function (err, result) {
            callback(err, result);
        });
    });
}

function changeUserPasswordByEmpId(user, callback) {
    bcrypt.hash(user.password, saltRounds, function (err, hash) {
        //let sql = "insert into users (username,email,password,gender,fullname,photo,dateofbirth,current_address,mobile,role_code) values ('" + user.username + "' , '" + user.email + "','" + hash + "', '" + user.gender + "', '" + user.fullname + "', '" + user.photo + "','" + user.dateofbirth + "','" + user.current_address + "','" + user.mobile + "','" + user.role_code + "')";
        let sql = "update users set password='" + hash + "', first_login = 0 where emp_id='" + user.emp_id + "'";
        QueryStr(sql, function (err, result) {
            callback(err, result);
        });
    });
}

function deleteUser(id, callback) {
    let sql = "delete from users where id=" + id;
    QueryStr(sql, function (err, result) {
        callback(err, result);
    });
}
function auditUser(user, callback) {
    console.log(user);
    let sql = "insert into user_audits (emp_id,activities) values ('" + user.emp_id + "','" + user.activity + "')";
    QueryStr(sql, (err, result) => {
        callback(err, result);
    });
}

module.exports = {
    CreateUser,
    getUsers,
    getUserById,
    addNew,
    deleteUser,
    getUserByUsername,
    auditUser,
    changeUserPasswordByEmpId,

}