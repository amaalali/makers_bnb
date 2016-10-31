ENV['RACK_ENV'] = 'test'

require './app/app.rb'

require 'web_helpers'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'

Capybara.app = MakersBnB

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  # config.order = :random
  #
  # Kernel.srand config.seed

end
