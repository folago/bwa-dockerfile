FROM alpine:3.9.2

ENV BWA_VERSION 0.7.17

RUN apk add --update --no-cache \
build-base \ 
zlib-dev \
bzip2-dev \
ca-certificates \
wget && \
wget -q https://github.com/lh3/bwa/releases/download/v${BWA_VERSION}/bwa-${BWA_VERSION}.tar.bz2 && \
tar xjf bwa-${BWA_VERSION}.tar.bz2 && \
cd /bwa-${BWA_VERSION}/ && \
make && \
mv /bwa-${BWA_VERSION}/bwa /bin/ && \
#cluenup
rm -rf /bwa-${BWA_VERSION}* && \
apk del \
build-base \
zlib-dev \
bzip2-dev \
ca-certificates \
wget

WORKDIR /data
