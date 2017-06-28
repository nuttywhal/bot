/**
 * @module handler/verify-token
 */

/**
 * Complete the challenge-response authentication for a new page subscription
 * when setting up a webhook for a Facebook app.
 *
 * @param {Request} request - Hapi request.
 * @param {Reply} reply - Hapi reply.
 * @returns {Null} Nothing.
 */
function verifyToken(request, reply) {
    // Load webhook verification token from configuration file.
    const configuration = require('../config.json');

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
