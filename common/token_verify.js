const jwt = require('jsonwebtoken');
const fs = require('fs');

var privateKey = fs.readFileSync('E:\\PROGRAMMING\\nodejs\\atlas\\common\\keys\\private.key', 'utf8');
var publicKey = fs.readFileSync('E:\\PROGRAMMING\\nodejs\\atlas\\common\\keys\\public.key', 'utf8');

module.exports = {
    sign: (payload) => {
        // Token signing options
        return jwt.sign(payload, privateKey);
    },
    verify: (token, $Options) => {
        try {
            return jwt.verify(token, publicKey);
        } catch (err) {
            return false;
        }
    },
    decode: (token) => {
        return jwt.decode(token, {
            complete: true
        });
    }
}