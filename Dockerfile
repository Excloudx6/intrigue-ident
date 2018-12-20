###
### https://github.com/GoogleChrome/puppeteer/issues/3019
###

# Ref: https://github.com/gliderlabs/docker-alpine/issues/53
FROM ruby:2.3.1-alpine

RUN apk add --update \
build-base \
libxml2-dev \
libxslt-dev \
postgresql-dev \
&& rm -rf /var/cache/apk/*

# Use libxml2, libxslt a packages from alpine for building nokogiri
RUN bundle config build.nokogiri --use-system-libraries

ADD . /ident

# install chrome

# Installs latest Chromium package.
RUN apk update && apk upgrade \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk add --no-cache \
    chromium@edge \
    nss@edge \
    && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

# Add Chrome as a user
RUN mkdir -p /usr/src/app \
    && adduser -D chrome \
    && chown -R chrome:chrome /usr/src/app
# Run Chrome as non-privileged
USER chrome
WORKDIR /usr/src/app

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# install ruby deps
WORKDIR /ident
RUN gem install bundler --no-ri --no-rdoc
RUN bundle install


