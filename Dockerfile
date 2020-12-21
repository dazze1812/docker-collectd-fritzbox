FROM alpine:latest

LABEL maintainer="dazze1812.github@dazze.de"

RUN apk update
RUN apk add collectd collectd-python collectd-network py-pip libxml2-dev libxslt-dev gcc musl-dev python3-dev bash

RUN pip install fritzcollectd

ADD collectd.conf.tpl /etc/collectd/collectd.conf.tpl

ADD start /usr/bin/start

EXPOSE 25826

RUN pip install envtpl
RUN chmod +x /usr/bin/start

CMD start
