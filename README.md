# Docker container for [gtranslate](https://git.sr.ht/~yerinalexey/gtranslate)

![](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com/myanesp/docker-gtranslate)
![](https://badgen.net/github/stars/myanesp/docker-gtranslate?icon=github&label=stars)
![Github last-commit](https://img.shields.io/github/last-commit/myanesp/docker-granslate)
![Github license](https://badgen.net/github/license/myanesp/docker-gtranslate)

This is a simple Docker wrapper for the Google Translate scraper [gtranslate](https://git.sr.ht/~yerinalexey/gtranslate) by [yerinalexey](https://git.sr.ht/~yerinalexey/). gtranslate is a lightweight frontend for Google Translate without trackers, developed in Go.

## Installation

Download or copy the [docker-compose.yml](docker-compose.yml) file of this repository,
edit the ports if needed and run `docker compose up -d`. Then, you can access to the ip of the machine
you've deployed the container plus the port (i.e. `http://192.168.0.3:5000`) and start translating.

As in the source program, you can also use the API exposed by gtranslate.

```
$ curl 'http://192.168.0.3:5000/api?from=es&to=en&text=Hola'
Hello
```

## Use with Tor Proxy

gtranslate comes with support for deploying the server and route its traffic through the [Tor Network](https://en.wikipedia.org/wiki/Tor_(network)). As stated by yerinalexey on [gtranslate source code repo](https://git.sr.ht/~yerinalexey/gtranslate#using-tor), the usage of Tor has some advantages but also drawbacks:

```
Routing requests through Tor has its benefits:

- Google will have a hard time tracking gtranslate servers as they act like normal Tor users
- You probably won't get banned as requests are made from different IPs

Despite that, it has some drawbacks:

- Much slower response time
- Might get capcha or some other junk that will block requests
- If doing the wrong thing, you might get your server compromised (in terms of anonymity)
- This feature is not tested in development
```

If you want to use this Docker image of gtranslate with support for Tor, you will have to use the
[docker-compose-tor.yml](docker-compose-tor.yml) file. Download it, rename to `docker-compose.yml`, change
the port(s) if needed, and deploy with `docker compose up -d`. This time, when you execute a translation query, 
gtranslate will route your petition through the Tor network instead of your WAN connection.
