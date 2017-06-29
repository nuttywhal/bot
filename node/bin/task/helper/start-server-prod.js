#!/usr/bin/env node

// This is a script that PM2 will execute when it starts up the Hapi web
// server as a system service.

require('./start-server')();
