'use strict';

/**
 * @module bin/task/stop
 */

const processManager = require('pm2');

/**
 * Stop the server daemon process.
 * @returns {Null}
 */
function stop() {
    processManager.connect(() => {
        processManager.delete('lubbers', () => {
            processManager.disconnect();
            process.exit(0);
        });
    });
}

stop.description = 'Stop the server in production mode.';

module.exports = stop;
