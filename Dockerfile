FROM alpine:latest
LABEL maintainer="https://fedorafans.com <hossein.a97@gmail.com>"

# ---------------- #
#   Installation   #
# ---------------- #

# Install and setup all prerequisites
RUN apk add --no-cache haproxy                                               &&\
    curl -Lo /tmp/dataplaneapi_2.1.0_Linux_x86_64.tar.gz                       \
    https://github.com/haproxytech/dataplaneapi/releases/download/v2.1.0/dataplaneapi_2.1.0_Linux_x86_64.tar.gz &&\
    tar -xzvf /tmp/dataplaneapi_2.1.0_Linux_x86_64.tar.gz -C /usr/local/bin/  --strip-components=1 &&\
    chmod +x /usr/local/bin/dataplaneapi                                     &&\
    rm -rf /tmp/dataplaneapi_2.1.0_Linux_x86_64.tar.gz                       &&\
    rm -rf /var/cache/apk/*


# -------- #
#   Run!   #
# -------- #

CMD ["haproxy", "-W", "-db", "-f", "/etc/haproxy/haproxy.cfg"]
