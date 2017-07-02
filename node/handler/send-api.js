/**
 * @module handler/send-api
 */

const logger = require('../lib/logger')(module);
const request = require('request');

/**
 * Call the Send API. The message data goes into the body of the payload.
 * If the method call is successful, we will get a message identifier in
 * the response.
 *
 * @param {Object} data - Message data.
 * @returns {Null} Nothing.
 */
function callSendAPI(data) {
    // Load page access token from configuration file.
    const configuration = require('../config.json');

    request(
        {
            json: data,
            method: 'POST',
            qs: {access_token: configuration.facebook.accessToken},
            uri: 'https://graph.facebook.com/v2.6/me/messages'
        },
        (error, response, body) => {
            if (!error && response.statusCode === 200) {
                if (body.message_id) {
                    logger.info(
                        'Successfully sent message with id %s to recipient %s',
                        body.message_id,
                        body.recipient_id
                    );
                } else {
                    logger.info(
                        'Successfully called the Send API for recipient %s',
                        body.recipient_id
                    );
                }
            } else {
                logger.error(
                    'Failed calling Send API',
                    response.statusCode,
                    response.statusMessage,
                    body.error
                );
            }
        }
    );
}

module.exports = callSendAPI;
