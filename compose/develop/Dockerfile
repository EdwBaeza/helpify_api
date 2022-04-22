FROM ruby:2.7.2

RUN apt-get clean && \
    apt-get update -qq && \
    apt-get install -y build-essential nodejs postgresql-client zlib1g-dev liblzma-dev patch pkg-config libxml2-dev libxslt-dev
WORKDIR /helpify_api

COPY Gemfile /helpify_api/Gemfile
COPY Gemfile.* /helpify_api/Gemfile.lock

RUN gem install bundler:2.3.10 && bundle config set force_ruby_platform true && bundle install

COPY . /helpify_api
COPY /compose/develop/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]