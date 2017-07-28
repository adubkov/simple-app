FROM alpine:latest

RUN apk add --no-cache \
      nodejs \
      && mkdir -p /opt/app

EXPOSE 8080

ENTRYPOINT ["node", "/opt/app/app.js"]
