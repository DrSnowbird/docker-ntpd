FROM alpine:latest

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"
RUN apk update \
    && apk add openntpd \
    && rm -rf /var/cache/apk/*

# copy ntpd config file
COPY ntpd.conf /etc/ntpd.conf

# ntp port
EXPOSE 123/udp

# start ntpd in the foreground
ENTRYPOINT [ "/usr/sbin/ntpd", "-v", "-d", "-s" ]
