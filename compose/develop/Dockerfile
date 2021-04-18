FROM ruby:2.7.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /helpify_api

COPY Gemfile /helpify_api/Gemfile
COPY Gemfile.lock /helpify_api/Gemfile.lock

RUN gem install bundler:1.17.3 && bundle install

COPY . /helpify_api

# Add a script to be executed every time the container starts.
COPY /compose/develop/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]