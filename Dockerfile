FROM ruby:3.1.3-alpine

RUN \
    # update alpine packages
    apk update \
    && apk upgrade \
    # install ruby with dev tools to compile native extensions
    && apk --no-cache add ruby ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal \
    # for gem 'unf_ext', which is needed for gems like 'http'
    && apk --no-cache add make g++ \
    && rm -rf /var/cache/apk/*

# Build image with:
#   docker build --rm --force-rm -t chiuzu/ruby-http:3.1.2 .
#
# Run container with this image:
#   docker run --rm -it chiuzu/ruby-http:3.1.2 sh
#
# (OPTIONAL) push image to docker hub with:
#   docker push chiuzu/ruby-http:3.1.2
