const receiveMessage = require('./handler/receive-message');
const verifyToken = require('./handler/verify-token');

module.exports = [
    {
        handler: verifyToken,
        method: 'GET',
        path: '/webhook'
    },
    {
        handler: receiveMessage,
        method: 'POST',
        path: '/webhook'
    }
];
