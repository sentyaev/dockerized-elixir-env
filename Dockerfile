ARG version
FROM elixir:$version

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

CMD [ "mix" ]