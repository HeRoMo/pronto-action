FROM node:14.15.1-alpine3.12 as nodejs
FROM ruby:2.7.2-alpine3.12

# Install Node.js
ENV NODE_VERSION 14.15.1
ENV YARN_VERSION 1.22.5
RUN mkdir -p /opt
COPY --from=nodejs /opt/yarn-v${YARN_VERSION} /opt/yarn
COPY --from=nodejs /usr/local/bin/node /usr/local/bin/
COPY --from=nodejs /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
    && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx

# Install Rubygems and dependencies
WORKDIR /pronto

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN set -eux; \
    apk add --no-cache --virtual .ruby-builddeps \
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

COPY entrypoint.sh entrypoint.sh
