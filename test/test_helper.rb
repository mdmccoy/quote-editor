ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

# Capybara.register_driver :headless_chrome2 do |app|
#   options = Selenium::WebDriver::Chrome::Options.new
#   options.add_argument("--headless=new")
#   options.add_argument("--no-sandbox")
#   options.add_argument("--disable-dev-shm-usage")
#   options.add_argument("--disable-gpu")
#   options.add_argument("--remote-debugging-port=9222")
#   # options.add_argument("--disable-setuid-sandbox")

#   # Create a temporary user data directory for each test run
#   options.add_argument("--user-data-dir=/tmp/chrome-test-#{Time.now.to_i}")

#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :chrome,
#     options: options
#   )
# end

# Capybara.default_driver = Capybara.javascript_driver = :headless_chrome2
