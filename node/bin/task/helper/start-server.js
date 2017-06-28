const lubbers = require('../../../server');
const configuration = require('../../../config.json');

/**
 * Setup and start the Hapi server using the configuration file generated
 * by 'lubbers init' command.
 *
 * @returns {Null} Nothing.
 */
function startServer() {
    lubbers.setup(configuration);
    lubbers.server.start(() => {
        console.log(`Server running at: ${lubbers.server.info.uri}`);
    });
}

module.exports = startServer;
