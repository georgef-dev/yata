ARG ALPINE_VERSION="3.22"
ARG RUBY_VERSION="3.4.4"
ARG BUNDLER_VERSION="2.6.9"

FROM alpine:${ALPINE_VERSION} AS base-alpine

RUN apk add --no-cache \
  bash \
  curl \
  gcompat \
  build-base \
  git \
  tzdata \
  nodejs \
  yarn \
  mysql-client \
  mysql-dev \
  libffi-dev \
  readline-dev \
  zlib-dev \
  yaml-dev \
  openssl-dev

WORKDIR /app

FROM ruby:${RUBY_VERSION}-alpine${ALPINE_VERSION} AS lang-ruby

# ---------- Merge base and Ruby into a clean app image ----------
FROM base-alpine AS app

COPY . .
COPY --from=lang-ruby /usr/local /usr/local

ENV PATH="/app/bin:$PATH"
ENV GEM_HOME="/usr/local/bundle"
ENV BUNDLER_VERSION="2.6.9"
ENV BUNDLE_BIN="$GEM_HOME/bin"
ENV BUNDLE_PATH="$GEM_HOME"
ENV BUNDLE_SILENCE_ROOT_WARNING=1
ENV PATH="$GEM_HOME/bin:$PATH"
ENV RAILS_ENV="development" 

RUN gem install bundler -v "$BUNDLER_VERSION"
RUN bundle install

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

# Precompile assets (optional, if you serve assets via Rails)
# RUN bundle exec rake assets:precompile
# Default CMD for dev environment (overridden in docker-compose for prod/test)
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
