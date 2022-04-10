FROM crystallang/crystal:latest-alpine

WORKDIR /app

COPY shard.yml .

RUN shards install

COPY . /app

RUN set -ex && \
    crystal bin/ameba.cr && \
    crystal spec --error-trace && \
    :
