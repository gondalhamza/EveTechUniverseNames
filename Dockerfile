FROM ruby:3.0.3-slim-buster
RUN gem install bundler -v 2.3.0
WORKDIR /app
COPY . ./
RUN bundle install
ENTRYPOINT ["./docker-entrypoint.sh"]
