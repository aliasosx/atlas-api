const db = require('../common/DB/DBServices');

function getCustomer(id, callback) {
    if (id) {
        let sql = "select * from customers where id=" + id;
        db.CreateQueryStr(sql, function (err, rows) {
            callback(err, rows);
        });
    }
}

function AddnewCustomer(customer, callback) {
    if (customer) {
        let sql = "insert into customers (id_card_no,gender,fullname,dateofbirth,current_address,mobile, photo) values ('" + customer.id_card_no + "','" + customer.gender + "','" + customer.fullname + "','" + customer.dateofbirth + "','" + customer.current_address + "','" + customer.mobile + "','" + customer.photo + "')";
        db.CreateQueryStr(sql, function (err, rows) {
            console.log(err);
            if (err) {
                callback(err);
            } else {
                callback({
                    result: "Operation success"
                });
            }
        });
    }
}

function getCustomers(callback) {
    let sql = "select * from customers";
    db.CreateQueryStr(sql, (err, rows) => {
        callback(err, rows);
    });
}

function UpdateCustomerInfo(customer, callback) {
    if (customer) {
        let sql = "update customers set id_card_no='" + customer.id_card_no + "', gender='" + customer.gender + "', fullname='" + customer.fullname + "',DateofBirth='" + customer.DateofBirth + "',current_address='" + customer.current_address + "', mobile='" + customer.mobile + "' , photo='" + customer.photo + "', enabled= " + customer.enabled + " where id=" + customer.id;
        db.CreateQueryStr(sql, function (err, rows) {
            if (err) {
                callback(err);
            } else {
                callback({
                    result: "Operation success"
                });
            }
        });
    }
}


module.exports = {
    getCustomer,
    getCustomers,
    AddnewCustomer,
    UpdateCustomerInfo,
}