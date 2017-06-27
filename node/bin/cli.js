#!/usr/bin/env node

'use strict';

const chalk = require('chalk');
const cliui = require('cliui')();

const lubbersDev = require('./task/dev');
const lubbersInit = require('./task/init');
const lubbersStart = require('./task/start');
const lubbersStop = require('./task/stop');

const tasks = [
    lubbersDev,
    lubbersInit,
    lubbersStart,
    lubbersStop
];

const taskIndex = 2;
const task = process.argv[taskIndex];
const selectedTask = tasks.find((func) => func.name === task);

if (selectedTask) {
    selectedTask();
} else {
    cliui.div({
        padding: [1, 0, 0, 2],
        text: `${chalk.yellow('Lubbers')} Command Line Interface`
    });

    cliui.div({
        padding: [0, 0, 1, 2],
        text: `${chalk.green.bold('Usage:')} lubbers <command>`
    });

    for (const command of tasks) {
        cliui.div({
            padding: [0, 0, 0, 2],
            text: `${chalk.cyan(command.name)}\t${command.description}`
        });
    }

    console.log(cliui.toString());
    process.exit(0);
}
