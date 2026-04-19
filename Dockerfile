# 開発用Dockerfile
FROM ruby:3.4.4

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# ポート3000を公開
EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
