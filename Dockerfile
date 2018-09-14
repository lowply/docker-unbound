FROM alpine:latest
RUN apk update
RUN apk add unbound
CMD ["/usr/sbin/unbound", "-c", "/etc/unbound/unbound.conf", "-v", "-d"]
MAINTAINER Sho Mizutani <lowply@gmail.com>
