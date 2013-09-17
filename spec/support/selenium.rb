Capybara.register_driver :selenium do |app|
  require 'selenium/webdriver'
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['focusmanager.testmode'] = true
  Capybara::Selenium::Driver.new(app, :profile => profile)
end
Capybara.javascript_driver = :selenium
Selenium::WebDriver::Firefox.path = "/Users/ialiende/Desktop/Firefox 10/Firefox.app/Contents/MacOS/firefox-bin"
