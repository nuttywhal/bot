/**
 * @module server
 */

const Hapi = require('hapi');
const routes = require('./route');
const server = new Hapi.Server();

let serverConfigured = false;

/**
 * Set up the server connection to the hostname specified in the
 * configuration file and register routes.
 *
 * @param {Object} configuration - Object containing configuration data.
 * @returns {Null} Nothing.
 */
function setup(configuration) {
    if (!serverConfigured) {
        serverConfigured = true;

        server.connection({
            host: configuration.server.hostname,
            port: configuration.server.port
        });

        server.route(routes);
    }
}

module.exports.server = server;
module.exports.setup = setup;
