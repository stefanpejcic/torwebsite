[![tor-logo](https://user-images.githubusercontent.com/46316908/134797723-e3b5c0fc-c6d8-49a6-b685-f3d869edf141.png)](https://torproject.org/)

# What is TorWebsite?

A container to host website on Tor hidden service with .onion address. Tor is free software and an open network that helps you defend against traffic analysis, enabling anonymous communication. ".onion" is a special-use top level domain name designating a "hidden service" on the Dark Web, reachable via the Tor network/accessed via the Tor browser.

# How to use this image

### Usage

This image is included in [OpenPanel 1.2.9](https://openpanel.com/docs/changelog/1.2.9/) and newer. It's managed by the OpenPanel service and adding(importing) .onion domains is possible either [from the GUI](https://community.openpanel.org/d/158-beta-testers-wanted-for-tor-feature-in-openpanel-129-onion-domains) or [from the terminal](https://dev.openpanel.com/cli/domains.html#Add-onion-domain-to-user). Reverse-proxy is automatically created from users webserver and domain can be used for all OpenPanel services: redis, databases, wordpress, files, ets.

It can be run standalone without OpenPanel, by running the image once to generate the domain, and then add it manually to another service for reverse-proxy, then starting the image again.

build: `docker buildx build --platform linux/amd64,linux/arm64 -t openpanel/torwebsite:latest --push .`

### About

This is a fork or [3xploitGuy/torwebsite](https://github.com/3xploitGuy/torwebsite) that removes nginx and openrc, instead external nginx container is used for the proxy.

Image is build on both `linux/amd64` and `linux/arm64` platforms.

**Are any ports exposed?**</br>
No, tor is running inside container which connects to Network using Virtual Ethernet.

**How much time it takes for website to get live?**</br>
5-8 seconds with normal Internet Speed. If your connectivity is weak, try waiting for few mins till Tor picks some relay as introduction point and adds new entry in Distributed Hash Table (DHT). More info [here](https://tor.stackexchange.com/questions/672/how-do-onion-addresses-exactly-work/674#674).


## Disclaimer

TorWebsite is created to make hosting website on Tor easy and it's not responsible for any misuse or illegal purposes.
Feel free to discuss any issue or new feature at [OpenPanel Community forums](https://community.openpanel.org/).

## License

TorWebsite is under the terms of the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html).
