FROM certbot/certbot:amd64-latest@sha256:835f40053d6621fa90acf4bccf84c4683f27ff5eae6b59dbe7ea6474093ce2c6

COPY ./requirements.txt /tmp

RUN python3 -m pip install --require-hashes --only-binary :all: --no-cache-dir -r /tmp/requirements.txt
