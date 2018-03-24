ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'pry'
require 'capybara/rails'
require 'simplecov'
require 'shoulda/matchers'
require 'devise'
require 'webmock/rspec'
require 'json'
SimpleCov.start 'rails'
WebMock.disable_net_connect!(allow_localhost: true)
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
    with.library :action_controller
    with.library :rails
  end
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  config.include Features::SessionHelpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :request
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include ActiveSupport::Testing::TimeHelpers
  config.use_transactional_fixtures = true
  config.include Capybara::DSL
  config.infer_spec_type_from_file_location!
  include Warden::Test::Helpers
  Warden.test_mode!
  config.include FactoryBot::Syntax::Methods
  config.filter_rails_from_backtrace!
end
