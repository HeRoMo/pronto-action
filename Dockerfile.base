FROM ruby:2.6.5-alpine

WORKDIR /pronto

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN set -eux; \
    apk add --update --no-cache --virtual .ruby-builddeps \
        alpine-sdk \
        cmake \
        openssl \
        openssl-dev \
    ; \
    bundle install --jobs 20 --retry 5 \
    ; \
    apk del --purge .ruby-builddeps \
    ; \
    apk add --no-cache \
        jq \
    ;
