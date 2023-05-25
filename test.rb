require 'selenium-webdriver'
require 'test-unit'
require 'dotenv/load'


class GoogleTest < Test::Unit::TestCase
def setup
#   @driver = Selenium::WebDriver.for :chrome

  puts ENV['SELENIUM_URL']
  options = Selenium::WebDriver::Chrome::Options.new
  puts options.inspect
  @driver = Selenium::WebDriver.for :remote, url: ENV['SELENIUM_URL'], options: options
  @url = "https://www.google.com/"
  @driver.manage.timeouts.implicit_wait = 30
  
 end
def test_google_search
  @driver.get(@url)
# Search for the search box using the name selector
  @query_box = @driver.find_element(:name, 'q')
# Input the search phrase we need to search for in the searched query_box element
  @query_box.send_keys("Selenium webdriver")
# Click submit button(enter to search)
  @query_box.submit
# Add an explicit wait to ensure the page finishes loading
  wait = Selenium::WebDriver::Wait.new(:timeout => 30)
  wait.until{@driver.title.include? "Selenium webdriver - Google Search"}

# Assert that the search bar title is what you expect
  assert_equal("Selenium webdriver - Google Search", @driver.title)
  
 end
def teardown
  @driver.quit
  
 end
end
