FROM alpine:latest
LABEL maintainer="https://fedorafans.com <hossein.a97@gmail.com>"

# ---------------- #
#   Installation   #
# ---------------- #

# Install and setup all prerequisites
RUN apk add --no-cache haproxy curl                                                                                                                                 &&\
    DATAPLANEAPI_VER=`curl -s https://api.github.com/repos/haproxytech/dataplaneapi/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'` &&\
    curl -Lo /tmp/dataplaneapi_${DATAPLANEAPI_VER}_Linux_x86_64.tar.gz                                                                                                \
    https://github.com/haproxytech/dataplaneapi/releases/download/v${DATAPLANEAPI_VER}/dataplaneapi_${DATAPLANEAPI_VER}_Linux_x86_64.tar.gz                         &&\
    tar -xzvf /tmp/dataplaneapi_${DATAPLANEAPI_VER}_Linux_x86_64.tar.gz -C /usr/local/bin/  --strip-components=1                                                    &&\
    chmod +x /usr/local/bin/dataplaneapi                                                                                                                            &&\
    rm -rf /tmp/dataplaneapi_${DATAPLANEAPI_VER}_Linux_x86_64.tar.gz                                                                                                &&\
    rm -rf /var/cache/apk/*


# -------- #
#   Run!   #
# -------- #

CMD ["haproxy", "-W", "-db", "-f", "/etc/haproxy/haproxy.cfg"]
