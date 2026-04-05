source "https://rubygems.org"
ruby "3.2.2" if ENV['RENDER']

gem "rails", "~> 7.2.2", ">= 7.2.2.2"
gem "sprockets-rails"

# データベース設定（Render用とローカル用をまとめました）
group :development, :test, :production do
  gem "pg", "~> 1.1"
end

gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "devise"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'factory_bot_rails'
end

group :development do
  gem "web-console"
  gem "error_highlight", ">= 0.4.0", platforms: [ :ruby ]
  gem 'htmlbeautifier'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end