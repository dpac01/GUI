require "selenium-webdriver"
gem "test-unit"
require "test/unit"

class GUI < Test::Unit::TestCase

# Setup before every test
  def setup
    @driver = Selenium::WebDriver.for :chrome # Using chrome driver
    @url = "http://t.sidekickopen06.com/e1t/c/5/f18dQhb0S7lC8dDMPbW2n0x6l2B9nMJW7t5XYg1q7jx6N8q5vnTdV5-YW64JdXC56dwznf67Cw8n02?t=https%3A%2F%2Fdocs.google.com%2Fforms%2Fd%2F181whJlBduFo5qtDbxkBDWHjNQML5RutvHWOCjEFWswY%2Fviewform&si=6492974060142592&pi=de7d3cb7-acb6-49e3-e16f-27369bc361ff"
    @driver.manage.timeouts.implicit_wait = 10 # Implicit wait for pages to finish
  end
 
 # Tear down after every test
  def teardown
    @driver.quit   
  end
 
 # Check if the page opens correctly
  def test_pageload
    @driver.navigate.to(@url)
    element = @driver.find_element(:class, "ss-form-title")
    assert_equal(element.text,"Basic Web Forms") # Check if the page open and the title is "Basic Web Forms"
  end

# Positive test case, check if on entering all the required fields, the form submits correctly
 def test_validinput1
    @driver.navigate.to(@url)
    element = @driver.find_element(:id,'entry_1041466219') # Find the name field
    element.send_keys("Michael")
    element = @driver.find_element(:id,'group_310473641_1') # Select the "Yes" checkbox
    element.click
    element.submit
    element = @driver.find_element(:class,'ss-resp-message')
    assert_equal(element.text,"Your response has been recorded.")
  end

# Positive test case, check if on entering all of the input fields, the form submits correctly
 def test_validinput2
    @driver.navigate.to(@url)
    element = @driver.find_element(:id,'entry_1041466219') # Find the name field
    element.send_keys("Michael")
    element = @driver.find_element(:id,'group_310473641_1') # Select the "Yes" checkbox
    element.click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id => 'entry_262759813')).select_by :text, 'JUnit' # From the dropdown, select "JUnit"
    element = @driver.find_element(:id,'entry_649813199')
    element.send_keys("Some random text here.") # Enter some text in the text area
    element.submit
    element = @driver.find_element(:class,'ss-resp-message') 
    assert_equal(element.text,"Your response has been recorded.") # Check if on the submit page, the message displayed is the one expected
 end 

# Negative test case, check if on not entering required fields, form should show an error
 def test_invalidinput1 
    @driver.navigate.to(@url)
    element = @driver.find_element(:id,'entry_1041466219')
    element.submit # Submit without entering anything on the page
    elementError = @driver.find_element(:xpath,"//form[@id='ss-form']/ol/div[1]/div/div/div[@class='required-message']")
    assert_equal(elementError.text,"This is a required question") # Check if error message for question 1 shows up
    elementError = @driver.find_element(:xpath,"//form[@id='ss-form']/ol/div[2]/div/div/div[@class='required-message']")
    assert_equal(elementError.text,"This is a required question") # Check if error message for question 2 shows up
 end

# Negative test case, check if on not selecting anything in Question 2, the form should show an error
 def test_invalidinput2
    @driver.navigate.to(@url)
    element = @driver.find_element(:id,'entry_1041466219')
    element.send_keys("Michael") # Valid value for question 1
    element.submit # Submit without valid input for question 2
    elementError = @driver.find_element(:xpath,"//form[@id='ss-form']/ol/div[2]/div/div/div[@class='required-message']")
    assert_equal(elementError.text,"This is a required question") # Check if error message for question 2 shows up
 end

end
