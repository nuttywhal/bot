'use strict';

const lubbers = require('../../../server');
const configuration = require('../../../config.json');

lubbers.setup(configuration);
lubbers.server.start(() => {
    console.log(`Server running at: ${server.info.uri}`);
});
