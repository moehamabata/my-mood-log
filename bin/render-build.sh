#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
<<<<<<< HEAD
bundle exec rails db:migrate
=======

# データベースを本番環境でマイグレーションする指示
RAILS_ENV=production bundle exec rails db:migrate
>>>>>>> 15e83568e23540d107d48e9b5f9898576315dcad
