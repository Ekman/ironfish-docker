FROM node:18

ENV USER="ironfish"
ENV HOME="/home/$USER"

EXPOSE 9033

ARG IRONFISH_VERSION="0.1.*"
RUN adduser --system --disabled-password --disabled-login --home "$HOME" "$USER" \
    && npm install --global "ironfish@$IRONFISH_VERSION" \
    && npm cache clean --force \
    && apt-get update \
    && apt-get install --no-install-recommends --yes tini gosu \
    && apt-get clean --yes

ADD docker-entrypoint.sh /

VOLUME [ "$HOME/.ironfish", "/tmp" ]

CMD [ "start" ]
ENTRYPOINT [ "tini", "--", "/docker-entrypoint.sh" ]