'use strict';

/**
 * @module bin/task/dev
 */

const fs = require('fs');

/**
 * Start the server in developer mode.
 * @returns {Null}
 */
function dev() {
    fs.stat('../../config.json', (error) => {
        if (!error) {
            require('./helper/start-server');
        } else {
            require('./helper/missing-config');
        }
    });
}

dev.description = 'Start the server in developer mode.';

module.exports = dev;
