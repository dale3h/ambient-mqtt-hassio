ARG BUILD_FROM=hassioaddons/base:2.1.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

RUN apk update && apk add jq && apk add --no-cache nodejs=8.11.4-r0 nodejs-npm=8.11.4-r0

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

COPY run.sh /

RUN chmod a+x /run.sh

CMD /run.sh

