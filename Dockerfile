FROM alpine:3.2
LABEL "maintainer=Philippe Huysmans"

RUN apk add --update \
          python3 \
          wget \
 && wget --no-check-certificate "https://bootstrap.pypa.io/get-pip.py" \
 && apk del \
          wget \
 && python3 get-pip.py \
 && rm get-pip.py \
 && pip3 install -U \
          docker-py \
          pip

COPY entrypoint.py /
RUN chmod +x /entrypoint.py

ENTRYPOINT ["/entrypoint.py"]
