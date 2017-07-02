/**
 * @module lib/logger
 */

// Adds a filename to Winston's output.
// e.g., 'info: [lib/logger.js] Hello world!'

const winston = require('winston');

/**
 * Get the filename of the calling module and its parent directory.
 *
 * @param {Object} callingModule - A 'module' object.
 * @returns {String} A string in the form 'parent_dir/filename.js'.
 */
function getFilename(callingModule) {
    // Split filepath for both Windows and Unix delimiters.
    const parts = callingModule.filename.split(/[\/\\]/);
    return `${parts[parts.length - 2]}/${parts.pop()}`;
}

// Any modules that import this logger with require() needs to invoke the
// function with a module object, e.g.,
//
// const logger = require('lib/logger.js')(module);

module.exports = (callingModule) => {
    return new winston.Logger({
        transports: [
            new (winston.transports.Console)({
                label: getFilename(callingModule),
                timestamp: true
            })
        ]
    });
};
