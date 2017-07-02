/**
 * @module handler/verify-token
 */

const logger = require('../lib/logger')(module);

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

    // Reply to the challenge from Facebook Messenger Platform.
    if (request.query['hub.mode'] === 'subscribe' &&
        request.query['hub.verify_token'] === configuration.facebook.verifyToken) {
        logger.info('Validating webhook with the validation token.');
        reply(request.query['hub.challenge']);
    } else {
        logger.error('Failed validation. Make sure that the validation tokens match.');
        reply().code(403);
    }
}

module.exports = verifyToken;
