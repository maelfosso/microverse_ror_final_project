# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
# require 'rspec/collection_matchers'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'devise'
# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.include FactoryBot::Syntax::Methods

  # config.extend ControllerMacros, :type => :controller
  # config.include Devise::Test::ControllerHelpers, :type => :controller

  # Add Warden for logging ins users for testing
  config.include Warden::Test::Helpers
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
    with.library :action_controller
    with.library :rails
  end
end

Capybara.javascript_driver = :webkit

# Capybara::Webkit.configure do |config|
#   # Enable debug mode. Prints a log of everything the driver is doing.
#   config.debug = true

#   # By default, requests to outside domains (anything besides localhost) will
#   # result in a warning. Several methods allow you to change this behavior.

#   # Silently return an empty 200 response for any requests to unknown URLs.
#   # config.block_unknown_urls

#   # Allow pages to make requests to any URL without issuing a warning.
#   # config.allow_unknown_urls

#   # Allow a specific domain without issuing a warning.
#   config.allow_url("localhost:3000")

#   # Allow a specific URL and path without issuing a warning.
#   # config.allow_url("localhost:3000/some/path")

#   # Wildcards are allowed in URL expressions.
#   # config.allow_url("*.localhost:3000")

#   # Silently return an empty 200 response for any requests to the given URL.
#   # config.block_url("localhost:3000")

#   # Timeout if requests take longer than 5 seconds
#   config.timeout = 5

#   # Don't raise errors when SSL certificates can't be validated
#   config.ignore_ssl_errors

#   # Don't load images
#   config.skip_image_loading

#   # Use a proxy
#   # config.use_proxy(
#   #   host: "localhost:3000",
#   #   port: 1234,
#   #   user: "proxy",
#   #   pass: "secret"
#   # )

#   # Raise JavaScript errors as exceptions
#   # config.raise_javascript_errors = true
# end
