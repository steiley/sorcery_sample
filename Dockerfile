FROM sickp/alpine-ruby:2.2.4

ENV APP_ROOT /railsapp

RUN apk add --update openssl-dev pcre-dev git && \
    apk add sqlite \
            sqlite-dev \
            make \
            gcc \
            musl-dev \
            g++ \
            tzdata \
            nodejs

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
ADD . $APP_ROOT

RUN echo 'gem: --no-document' >> ~/.gemrc && \
    bundle install && \
    rake db:migrate

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]