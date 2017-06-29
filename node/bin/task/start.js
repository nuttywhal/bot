/**
 * @module bin/task/start
 */

const fs = require('fs');
const missingConfig = require('./helper/missing-config');
const processManager = require('pm2');
const path = require('path');

/**
 * Start the server in production mode as a daemon process using
 * PM2, a production process manager.
 *
 * @returns {Null} Nothing.
 */
function start() {
    fs.stat('config.json', (error) => {
        if (error) {
            missingConfig();
        } else {
            processManager.connect(() => {
                processManager.start(
                    {
                        name: 'lubbers',
                        script: path.resolve(__dirname, 'helper', 'start-server-prod.js')
                    },
                    () => {
                        processManager.disconnect();
                        process.exit(0);
                    }
                );
            });
        }
    });
}

start.description = 'Start the server in production mode.';

module.exports = start;
