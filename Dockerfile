FROM alpine:latest
LABEL maintainer="https://fedorafans.com <hossein.a97@gmail.com>"

# ---------------- #
#   Installation   #
# ---------------- #

# Install and setup all prerequisites
RUN apk add --no-cache haproxy       &&\
    rm -rf /var/cache/apk/*
    
    
# -------- #
#   Run!   #
# -------- #

CMD ["haproxy", "-W", "-db", "-f", "/etc/haproxy/haproxy.cfg"]
