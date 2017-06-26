# ![lubbers](https://user-images.githubusercontent.com/26120940/27524607-5dff917e-59eb-11e7-886a-e272d40492cd.png)

Lubbers (pronounced LOO-bers) is a Facebook [Messenger Platform](https://developers.facebook.com/docs/messenger-platform) chatbot that answers queries about music theory.

## Features

For the alpha version of the project, the primary focus is on answering queries about simple harmonic relationships, e.g., dyadic intervals, scales, and chords.

In the future, Lubbers may be extended to accept [MusicXML](http://www.musicxml.com/) as input to answer queries about more complex harmonic relationships, e.g., species counterpoint and homophonic part writing.

## Subsystems

- **node** - A Hapi.js web server that receives and processes callback events via an incoming [webhook](https://developers.facebook.com/docs/messenger-platform/webhook-reference), and sends messages to users using the [Send API](https://developers.facebook.com/docs/messenger-platform/send-api-reference).

- **prolog** - An expert system, written in SWI Prolog, to represent music theory knowledge. Harmonic relationships are encoded as facts and rules, and conclusions are derived to answer queries using SWI Prolog's built-in inference engine. This system is implemented as a RESTful web service so that it may be interfaced with the Hapi.js web server.

- **python** - Python modules that parse input queries using natural language processing (NLP).