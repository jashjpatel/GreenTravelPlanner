FROM ruby:3.3.9-slim

WORKDIR /app
COPY . .
RUN bundle install
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]