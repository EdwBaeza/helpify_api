FROM ruby:2.7.3-alpine

RUN apk update & apk add --no-cache build-base libxml2-dev libxslt-dev build-base nodejs tzdata postgresql-dev postgresql-client imagemagick gcompat
WORKDIR /helpify_api

COPY Gemfile /helpify_api/Gemfile
COPY Gemfile.* /helpify_api/Gemfile.lock

RUN gem install bundler:2.3.10 & bundle config set force_ruby_platform true & bundle install

COPY . /helpify_api

# Add a script to be executed every time the container starts.
COPY /compose/develop/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]