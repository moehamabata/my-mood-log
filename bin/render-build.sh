#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

# データベースを本番環境でマイグレーションする指示
RAILS_ENV=production bundle exec rails db:migrate