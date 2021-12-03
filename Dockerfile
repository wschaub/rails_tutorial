FROM ruby
#Because they want to make installing as a reguler user so dmaned difficult...
RUN useradd -m -u 1000 rails && chown -R rails:rails /usr/local
RUN apt-get -y update && apt-get -y install npm vim && npm install -g yarn
RUN mkdir /code && chown rails:rails /code
USER rails
COPY --chown=rails:rails . /code/
WORKDIR /code
RUN bundle install
