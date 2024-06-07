FROM certbot/certbot@sha256:ddf9e5d226a56e886986838fa0ebedc0237511c78664352e8d0f4346ee022cd8

COPY ./requirements.txt /tmp

RUN python3 -m pip install --no-cache-dir -r /tmp/requirements.txt
