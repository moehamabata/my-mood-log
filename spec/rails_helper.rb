# This file is copied to spec/ when you run 'rails generate rspec:install'
  require 'spec_helper'
  require 'capybara/rspec'
  ENV['RAILS_ENV'] ||= 'test'
  require_relative '../config/environment'

  # Prevent database truncation if the environment is production
  abort("The Rails environment is running in production mode!") if Rails.env.production?

  require 'rspec/rails'

  # Ensures that the test database schema matches the current schema file.
  begin
    ActiveRecord::Migration.maintain_test_schema!
  rescue ActiveRecord::PendingMigrationError => e
    abort e.to_s.strip
end

RSpec.configure do |config|
  # Fixtures
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::IntegrationHelpers, type: :request

  # Use transactional fixtures
  config.use_transactional_fixtures = true

  # Automatically infer spec type from file location
  config.infer_spec_type_from_file_location!

  # Filter Rails gems from backtrace
  config.filter_rails_from_backtrace!

  # Deviseをテストで使うための機能を追加
  config.include Devise::Test::IntegrationHelpers, type: :request

  # System spec (Capybara + Selenium)
  config.before(:each, type: :system) do
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end