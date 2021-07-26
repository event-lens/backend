FROM elixir:1.12

RUN apt-get -y update
RUN apt-get install -y postgresql-client
RUN apt-get install -y inotify-tools
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.9 --force
RUN mix local.rebar --force

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]