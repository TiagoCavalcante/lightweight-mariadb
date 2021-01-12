FROM alpine:latest

COPY ./run.sh /scripts/run.sh

RUN apk add --no-cache mariadb && \
    chmod -R 755 /scripts

ENV MYSQL_ROOT_PASSWORD docker
EXPOSE 3306

ENTRYPOINT ["/scripts/run.sh"]