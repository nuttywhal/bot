## Installation

1. `git clone https://github.com/nuttywhal/lubbers.git`
2. `cd lubbers/node && npm install -g`

## Setup

1. Create a Facebook [App](https://developers.facebook.com/apps) and [Page](https://www.facebook.com/pages/create) or use existing ones. Go to the App Dashboard and under Product Settings click "Add Product" and select "Messenger".

2. Run `lubbers init` to create a server configuration file.
   - **Hostname** - e.g., `localhost`, `example.com`.
   - **Port Number** - e.g., `3000`, `80`.
   - **App Secret** - Can be found on your Facebook app dashboard.
   - **Verification Token** - Arbitrary token used to validate the webhook URL.
   - **Page Access Token** - Can be generated in the "Messenger" tab on the Facebook app.

3. Run `lubbers start` to start the server in production mode. This will start, daemonize, and monitor the server using [PM2](https://github.com/Unitech/pm2). Server logs can be streamed to `stdout` by running `pm2 logs`.

4. Setup a webhook for the Facebook app. For the webhook URL, use `https://example.com/webhook`, where `example.com` is the hostname that was provided in the server configuration wizard. All webhook events are received at the `/webhook` endpoint. Subscribe to the `messages` and `messaging_postback` page events on this webhook.

5. Lubbers is ready to chat! :speech_balloon:

**Note:** Facebook Messenger Platform requires that the webhook URL is a secure URL (`https://`) with an SSL certificate signed by a certificate authority (CA). To configure Lubbers to use an SSL certificate, you can modify `server.js` to [create an HTTPS connection](https://hapijs.com/api#serverconnectionoptions). Alternatively, you can setup [nginx](https://www.nginx.com/) as a reverse proxy server and configure an SSL certificate on there.

## CLI

Here are the commands available via the command line interface (CLI) using `lubbers <command>`:

- `dev` - Start the server in developer mode.
- `init` - Create a server configuration file.
- `start` - Start the server in production mode.
- `stop` - Stop the server in production mode.