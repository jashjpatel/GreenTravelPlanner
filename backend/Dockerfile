FROM ruby:3.3.9-slim

# Install system dependencies
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    pkg-config \
    libyaml-dev \
    libssl-dev \
    curl && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock first (for better caching)
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle config set --local deployment true && \
    bundle config set --local without 'development test' && \
    bundle install

# Copy application code after gems are installed
COPY . .

# Expose port
EXPOSE 3000

# Start Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]