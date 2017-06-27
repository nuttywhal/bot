'use strict';

/**
 * @module bin/task/start
 */

const fs = require('fs');
const processManager = require('pm2');
const path = require('path');

/**
 * Start the server in production mode as a daemon process using
 * PM2, a production process manager.
 * @returns {Null}
 */
function start() {
    fs.stat('config.json', (error) => {
        if (!error) {
            processManager.connect(() => {
                processManager.start(
                    {
                        name: 'lubbers',
                        script: path.resolve(__dirname, 'helper', 'start-server.js')
                    },
                    () => {
                        processManager.disconnect();
                        process.exit(0);
                    }
                );
            });
        } else {
            require('./helper/missing-config.js');
        }
    });
}

start.description = 'Start the server in production mode.';

module.exports = start;
