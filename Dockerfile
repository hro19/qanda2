FROM ruby:3.1.2
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
RUN bundle exec rails db:migrate
# Cloud Run �̓f�t�H���g�|�[�g8080�ŋN��
EXPOSE 8080
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "8080"]