/**
 * @module handler/receive-message
 */

const callSendAPI = require('./send-api');

/**
 * Echo the received text message event to the console and back to the
 * user that sent the message. This function is a temporary function
 * that is used for testing.
 *
 * @param {Object} event - Webhook event.
 * @returns {Null} Nothing.
 */
function echoMessage(event) {
    console.log(
        'User %d to Page %d at %d with message: ',
        event.sender.id,
        event.recipient.id,
        event.timestamp
    );

    console.log(JSON.stringify(event.message));

    if (event.message.text) {
        const data = {
            message: {text: event.message.text},
            recipient: {id: event.recipient_id}
        };

        callSendAPI(data);
    }
}

/**
 * Complete the challenge-response authentication for a new page subscription
 * when setting up a webhook for a Facebook app.
 *
 * @param {Request} request - Hapi request.
 * @param {Reply} reply - Hapi reply.
 * @returns {Null} Nothing.
 */
function receiveMessage(request, reply) {
    const data = request.body;

    if (data.object === 'page') {
        data.entry.forEach((entry) => {
            entry.messaging.forEach((event) => {
                if (event.message) {
                    echoMessage(event);
                } else {
                    console.log('Webhook received unknown event: ', event);
                }
            });
        });
    }

    // If all went well, then we need to send back a 200 status code to
    // let Facebook know that the callback has been successfully received.
    // Otherwise, the request will time out.
    reply();
}

module.exports = receiveMessage;
