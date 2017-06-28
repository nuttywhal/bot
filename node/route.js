const verifyToken = require('./handler/verify-token');

module.exports = [
    {
        handler: verifyToken,
        method: 'GET',
        path: '/webhook'
    }
];
