'use strict';

const chalk = require('chalk');
const cliui = require('cliui')();

cliui.div({
    padding: [1, 0, 0, 2],
    text: `${chalk.red('Error:')} The server configuration file is missing.`
});

cliui.div({
    padding: [0, 0, 0, 2],
    text: `Run the ${chalk.yellow('lubbers init')} command to create one.`
});

console.log(cliui.toString());
process.exit(1);
