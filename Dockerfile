FROM hashicorp/terraform:1.4.6

# Ensure your Dockerfile does not set the USER instruction, otherwise you will not be able to access GITHUB_WORKSPACE.

HEALTHCHECK NONE

ENV BUILD_PACKAGES bash ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-bundler
ENV BUNDLE_GEMFILE /Gemfile

# Update and install all of the required packages.
# At the end, remove the apk cache

RUN apk update && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    apk add python3 py3-pip nodejs && \
    pip3 install pyyaml && \
    pip3 install hvac && \
    rm -rf /var/cache/apk/*

COPY Gemfile /Gemfile
COPY kitchen-tmpl.yml /kitchen-tmpl.yml
COPY test.py /test.py

RUN bundle install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]