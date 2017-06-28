const lubbers = require('../../../server');

/**
 * Setup and start the Hapi server using the configuration file generated
 * by 'lubbers init' command.
 *
 * @returns {Null} Nothing.
 */
function startServer() {
    const configuration = require('../../../config.json');

    lubbers.setup(configuration);
    lubbers.server.start(() => {
        console.log(`Server running at: ${lubbers.server.info.uri}`);
    });
}

module.exports = startServer;
