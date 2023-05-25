FROM ruby:3.2.2

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

ENTRYPOINT ruby test.rb 
