# at the top of spec/spec_helper.rb
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console,
                                                                 # Want a nice code coverage website? Uncomment this next line!
                                                                 # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start
# Set the environment to "test"
ENV['ENVIRONMENT'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), '..', 'Rakefile.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rake'
require 'rspec'

Rake.application.load_rakefile

# Tell Capybara to talk to BookmarkManager
Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
RSpec.configure do |config|
    config.before(:each) do
      Rake::Task['test_environment'].invoke
    end
  end
end
