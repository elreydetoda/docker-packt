FROM lsiobase/alpine.python3
LABEL maintainer="GhostWriters"
LABEL co-contributor="elreydetoda"
ADD root /
WORKDIR /root
RUN apk upgrade --no-cache && \
      apk add --update git
RUN python3 -m pip install packt --upgrade
# upgrading all python packages
RUN pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

ENTRYPOINT ["/init"]
