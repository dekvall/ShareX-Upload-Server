FROM node:alpine

WORKDIR /usr/src/app
COPY src .
COPY package.json .

RUN apk --no-cache add exiftool && \
    npm i

COPY ./src/server/views /var/lib/sharex-server/views
COPY ./src/server/uploads /var/lib/sharex-server/uploads

EXPOSE 80 443
CMD ["node", "index.js"]
