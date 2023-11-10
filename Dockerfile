FROM ruby:3.3-rc

RUN adduser -D -h /home/http_server -s /bin/bash -u 1001 app

RUN echo "app:x:1001:1001::/home/http_server:/bin/bash" >> /etc/passwd

WORKDIR /home/http_server

COPY --chown=app:app http_server.rb /home/http_server/

USER app

ENV WEB_PORT=8080

CMD [ "ruby", "/home/http_server/http_server.rb" ]