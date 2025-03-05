require "test_helper"

require "selenium/webdriver"

# Capybara.register_driver :headless_firefox do |app|
#   options = Selenium::WebDriver::Firefox::Options.new
#   options.add_argument("--headless")
#   options.binary = "/usr/bin/firefox"

#   service = Selenium::WebDriver::Service.firefox
#   service.driver_path = "/snap/bin/geckodriver"

#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :firefox,
#     options: options,
#     service: service
#   )
# end

# Capybara.default_driver = :headless_firefox
# Capybara.javascript_driver = :headless_firefox
#
# https://chromium.googlesource.com/chromium/src/+/main/docs/security/apparmor-userns-restrictions.md

# This doesn't appear to be doing jack shit??????????


class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers

  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
  # driven_by :selenium, using: :headless_firefox, screen_size: [ 1400, 1400 ]
end
