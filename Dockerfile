# syntax=docker/dockerfile:1
# https://registry.hub.docker.com/_/ruby?tab=tags
# https://docs.docker.com/samples/rails/
FROM ruby:3.0.2

# update yarn repo
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
# update node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
WORKDIR /myapp
# Install latest bundler
RUN gem install bundler

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the layers with gems
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install
