/**
 * @module bin/task/init
 */

const chalk = require('chalk');
const fs = require('fs');
const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

/**
 * Read a value entered by the user from stdin. This function wraps
 * reader.question() in a promise.
 *
 * @param {String} prompt - See documentation for readline.
 * @returns {Promise.<String>} Value entered by the user.
 */
function question(prompt) {
    return new Promise((resolve, reject) => {
        reader.question(prompt, resolve, (error) => {
            if (error) {
                reject(error);
            } else {
                resolve();
            }
        });
    });
}

/**
 * Create a server configuration file by walking the user through a wizard.
 * This creates a configuration file called 'config.json'.
 *
 * @returns {Null} Nothing.
 */
async function init() {
    const config = {};

    config.server = {};
    config.facebook = {};

    console.log(`\n${chalk.yellow('Lubbers')} Server Configuration Wizard\n`);
    config.server.hostname = await question(`${chalk.cyan('Enter hostname: ')}`);
    config.server.port = await question(`${chalk.cyan('Enter port number: ')}`);

    console.log();
    config.facebook.appSecret = await question(`${chalk.cyan('Enter app secret: ')}`);
    config.facebook.verifyToken = await question(`${chalk.cyan('Enter verify token: ')}`);
    config.facebook.accessToken = await question(`${chalk.cyan('Enter page access token: ')}`);

    console.log();
    fs.writeFile('config.json', JSON.stringify(config, null, '\t'), () => {});
    reader.close();
}

init.description = 'Create a server configuration file.';

module.exports = init;
