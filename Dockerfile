FROM hashicorp/terraform:1.8.0

# Ensure your Dockerfile does not set the USER instruction, otherwise you will not be able to access GITHUB_WORKSPACE.

HEALTHCHECK NONE

ENV BUILD_PACKAGES bash ruby-dev build-base libffi-dev
ENV RUBY_PACKAGES ruby ruby-bundler
ENV BUNDLE_GEMFILE /Gemfile

# Update and install all of the required packages.
# At the end, remove the apk cache

RUN apk update && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

COPY Gemfile /Gemfile

RUN bundle install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
