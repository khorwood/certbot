FROM certbot/certbot:v2.11.0

COPY ./requirements.txt /tmp

RUN python3 -m pip install --no-cache-dir -r /tmp/requirements.txt
