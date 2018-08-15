require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless
  config.app_host = 'https://mark7.herokuapp.com'
end


Capybara.default_max_wait_time = 5
