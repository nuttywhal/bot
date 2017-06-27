'use strict';

/**
 * @module server
 */

const Hapi = require('hapi');
const server = new Hapi.Server();

let serverConfigured = false;

function setup(configuration) {
    if (!serverConfigured) {
        serverConfigured = true;

        server.connection({
            host: configuration.server.hostname,
            port: configuration.server.port
        });
    }
}

module.exports.server = server;
module.exports.setup = setup;
