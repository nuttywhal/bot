/**
 * @module bin/task/dev
 */

const fs = require('fs');
const missingConfig = require('./helper/missing-config');
const startServer = require('./helper/start-server');

/**
 * Start the server in developer mode.
 *
 * @returns {Null} Nothing.
 */
function dev() {
    fs.stat('config.json', (error) => {
        if (error) {
            missingConfig();
        } else {
            startServer();
        }
    });
}

dev.description = 'Start the server in developer mode.';

module.exports = dev;
