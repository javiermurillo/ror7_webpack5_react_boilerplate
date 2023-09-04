ARG REQUESTED_RUBY_VERSION=3.1.2

FROM ruby:$REQUESTED_RUBY_VERSION-slim-bullseye

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl

# Install NodeJS & Yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

# Set the working directory in the container to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the image and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Install Webpacker
RUN bundle exec rails webpacker:install
# Install React with
RUN bundle exec rails webpacker:install:react
# Install babel plugin
RUN yarn add @babel/plugin-proposal-private-methods

# Expose port 3000
EXPOSE 3000

# Run the app
CMD ["rails", "server", "-b", "0.0.0.0"]
