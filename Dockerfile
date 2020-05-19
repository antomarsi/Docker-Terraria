FROM alpine:latest

ARG version="1402"

LABEL maintainer="Antonio Marco da Silva <antomarsi@hotmail.com>"

ADD "https://www.terraria.org/system/dedicated_servers/archives/000/000/036/original/terraria-server-${version}.zip" /tmp/terraria.zip

RUN apk update && \
    apk add unzip && \
    mkdir /terraria && \
    unzip /tmp/terraria.zip ${version}'/Linux/*' -d /tmp/terraria && \
    mv /tmp/terraria/${version}/Linux/* /terraria && \
    rm -rf /tmp/* /var/tmp/*

EXPOSE 7777

VOLUME ["/world", "/config"]

CMD ["/terraria/TerrariaServer.bin.x86_64", "-config", "/config/serverconfig.txt", '-world', "/world"]