# Iron Fish

[Iron Fish](https://ironfish.network/) is a new blockchain with a strong focus on privacy. Using this Docker image, you can run the Iron Fish CLI.

**Under development and not ready for production. Expect breaking changes.**

## Installation

The image can be found at:

```sh
docker pull ghcr.io/ekman/ironfish
```

### Ports

Open TCP port `9033` on your router and forward them to the hosting server/computer.

### Volumes

Mount all these volumes to your host.

| Directory inside container | Description |
| --- | --- |
| `/home/node/.ironfish` | Primary directory where the image stores data |

## Usage

E.g. to start an Iron Fish node, run:

```
docker run --rm --read-only -itv ./ironfish:/home/node/.ironfish ghcr.io/ekman/ironfish
```

## Versioning

This project complies with [Semantic Versioning](https://semver.org/).

## Changelog

For a complete list of changes, and how to migrate between major versions, see [releases page](https://github.com/Ekman/ironfish-docker/releases).
