# Emulate cedar-16 stack: https://devcenter.heroku.com/articles/stack
FROM ubuntu:xenial

# Install prerequisites (these are available on Heroku)
RUN apt-get update
RUN apt-get install -y wget \
                       curl \
                       git \
                       build-essential \
                       autoconf \
                       libtool \
                       libpcre3 \
                       libpcre3-dev \
                       libssl-dev

# To get `erb` like on Heroku
RUN apt-get install -y ruby-full

ENV LAST_UPDATED 20170801

# https://devcenter.heroku.com/articles/buildpack-api#stacks
ENV STACK heroku-16

RUN mkdir /var/buildpack_cache
RUN mkdir /var/buildpack

COPY dummy_app /var/dummy_app

COPY buildpack_env /var/buildpack_env

CMD "echo 'nothing to put here atm'"
