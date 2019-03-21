FROM haproxy:1.6.3

MAINTAINER wwright <will@magesmith.com>

# disable interactive functions
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /etc/haproxy/errors
RUN touch /etc/haproxy/errors/400.http
RUN touch /etc/haproxy/errors/403.http
RUN touch /etc/haproxy/errors/408.http
RUN touch /etc/haproxy/errors/500.http
RUN touch /etc/haproxy/errors/502.http
RUN touch /etc/haproxy/errors/502.http
RUN touch /etc/haproxy/errors/503.http
RUN touch /etc/haproxy/errors/504.http

#
#   Inject config files at the end to optimize build cache
#
COPY etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY etc/ssl/private/haproxy.pem /etc/ssl/private/haproxy.pem

CMD ["haproxy","-V","-f","/etc/haproxy/haproxy.cfg"]