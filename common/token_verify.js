const jwt = require('jsonwebtoken');
const fs = require('fs');

/*
windows 
var privateKey = fs.readFileSync('E:/PROGRAMMING/nodejs/atlas-api/common/keys/private.key', 'utf8');
var publicKey = fs.readFileSync('E:/PROGRAMMING/nodejs/atlas-api/common/keys/public.key', 'utf8');
*/

var privateKey = fs.readFileSync('/Users/loukpa/projects/web/nodejs/atlas-api/common/keys/private.key', 'utf8');
var publicKey = fs.readFileSync('/Users/loukpa/projects/web/nodejs/atlas-api/common/keys/public.key', 'utf8');


const secret = "loukpa";

module.exports = {
    sign: (payload) => {
        // Token signing options
        return jwt.sign(payload, privateKey, {
            algorithm: 'RS256'
        });
    },
    verify: (token) => {
        try {
            return jwt.verify(token, publicKey, {
                algorithm: 'RS256'
            });
        } catch (err) {
            console.log(err)
            return false;
        }
    },
    decode: (token) => {
        return jwt.decode(token, {
            complete: true
        });
    }
}