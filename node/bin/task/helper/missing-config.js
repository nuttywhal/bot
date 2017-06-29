/**
 * @module bin/task/helper/missing-config
 */

const chalk = require('chalk');
const cliui = require('cliui')();

/**
 * Output an error message to the user explaining to them that there does
 * not exist a server configuration file.
 *
 * @returns {Null} Nothing.
 */
function outputError() {
    cliui.div({
        padding: [1, 0, 0, 2],
        text: `${chalk.red('Error:')} The server configuration file is missing.`
    });

    cliui.div({
        padding: [0, 0, 0, 2],
        text: `Run the ${chalk.yellow('lubbers init')} command to create one.`
    });

    console.log(cliui.toString(), '\n');
    process.exit(1);
}

module.exports = outputError;
