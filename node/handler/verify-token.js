'use strict';

/**
 * @module handler/verify-token
 */

const configuration = require('../config.json');

/**
 * Complete the challenge-response authentication for a new page subscription
 * when setting up a webhook for a Facebook app.
 * @returns {Null}
 */
function verifyToken(request, reply) {
    if (request.query['hub.mode'] === 'subscribe' &&
        request.query['hub.verify_token'] === configuration.facebook.verifyToken) {
        console.log('Validating webhook.');
        reply(request.query['hub.challenge']);
    } else {
        console.error('Failed validation. Make sure the validation tokens match.');
        reply().code(403);
    }
}

module.exports = verifyToken;
