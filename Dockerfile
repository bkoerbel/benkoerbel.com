FROM alpine:latest
MAINTAINER Ben Koerbel <bkoerbel@gmail.com>

ENV HUGO_VERSION=0.24
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp
RUN tar -xf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/hugo_${HUGO_VERSION}_linux_amd64

COPY site/ /src/

WORKDIR /src
CMD ["hugo", "server", "--bind=0.0.0.0", "--port=80", "--appendPort=false", "--disableLiveReload=true"]

EXPOSE 80