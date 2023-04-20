FROM node:18-slim

LABEL org.opencontainers.image.source="https://github.com/Ekman/ironfish-docker"
LABEL org.opencontainers.image.authors="Niklas Ekman <nikl.ekman@gmail.com>"

ENV USER="node"
ENV HOME="/home/$USER"

EXPOSE 9033

ARG IRONFISH_VERSION="1.*"
RUN npm install --global npm \
    && npm install --global "ironfish@$IRONFISH_VERSION" \
    && npm cache clean --force \
    && apt-get update \
    && apt-get install --no-install-recommends --yes tini gosu \
    && apt-get clean --yes

ADD docker-entrypoint.sh /

VOLUME [ "$HOME/.ironfish", "/tmp" ]

CMD [ "start" ]
ENTRYPOINT [ "tini", "--", "/docker-entrypoint.sh" ]