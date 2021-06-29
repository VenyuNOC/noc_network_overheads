FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

VOLUME ["/opt/rrd"]

RUN mkdir /app
RUN chmod 777 /app

RUN apt-get update && \
    apt-get -y install git golang librrd-dev

WORKDIR /app
RUN go get github.com/mannenen/grafana-rrd-server

EXPOSE 9000

CMD grafana-rrd-server -r /opt/rrd -s 60 -m 8