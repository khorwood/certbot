FROM alpine:3@sha256:0a4eaa0eecf5f8c050e5bba433f58c052be7587ee8af3e8b3910ef9ab5fbe9f5

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

COPY ./requirements.txt /tmp

# hadolint ignore=DL3018
RUN set -x \
    && \
    apk add --no-cache --virtual=run-deps \
        certbot \
        python3 \
        py3-pip \
    && \
    python3 -m pip install --require-hashes --only-binary :all: --no-cache-dir --break-system-packages -r /tmp/requirements.txt \
    && \
    rm -rf /tmp/* \
           /var/cache/apk/* \
           /var/tmp/*

COPY ./certbot.sh /

VOLUME ["/etc/letsencrypt"]

ENTRYPOINT [ "./certbot.sh" ]
