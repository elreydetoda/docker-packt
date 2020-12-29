FROM lsiobase/alpine.python3
LABEL maintainer="GhostWriters"
LABEL co-contributor="elreydetoda"
ADD root /
WORKDIR /root
RUN set -ex && \
      apk upgrade --no-cache && \
      apk add --update git
RUN set -ex && \
      python3 -m pip install packt pip pyasn1 six --upgrade

ENTRYPOINT ["/init"]
