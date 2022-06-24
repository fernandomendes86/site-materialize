FROM ruby:2.7.2

# Register Yarn package source.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -\ 
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
  nodejs yarn

# Install additional packages.
RUN apt update -qq
RUN apt install -y postgresql-client

# Prepare working directory.
WORKDIR /site_materialize
COPY . ./
RUN gem install bundler -v 2.2.33
RUN bundle check || bundle install
RUN yarn install --check-files

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]