FROM alpine:latest
LABEL maintainer="Stefan Pejcic <stefan@pejcic.rs>"

RUN apk --no-cache --no-progress add tor torsocks && \
    mkdir -p /var/lib/tor/hidden_service /etc/boot-container

COPY configs/torrc /etc/tor
COPY scripts/torhost.sh /etc/profile.d
COPY scripts/bootstrap.sh /etc/boot-container

HEALTHCHECK --interval=4m --timeout=50s --retries=2 \
  CMD torsocks wget --no-verbose --tries=1 --spider `cat /var/lib/tor/hidden_service/hostname` || exit 1

ENTRYPOINT ["sh", "/etc/boot-container/bootstrap.sh"]
