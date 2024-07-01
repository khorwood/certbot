FROM alpine:3.20.1@sha256:b89d9c93e9ed3597455c90a0b88a8bbb5cb7188438f70953fede212a0c4394e0

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
