# The Selenium_Ruby script contains unit test cases for the web form. The script is in Ruby and uses Webdriver/Selenium for execution. The script runs using the chrome driver. Following are the test cases in the script:

setup - Initialize the webdriver before every test. Set the URL and webdriver version and add an implicit wait.

teardown - Close the webdriver after every test.

test_pageload - Open the URL and checks if the title of the page loads correctly (to know that we are on the expected page).

test_validinput1 - Positive test case. Check if on entering valid values for only the required questions (1 and 2) the form submits correctly.

test_validinput2 - Positive test case. Check if on entering valid values for all the required questions (1 thorugh 4) the form submits correctly.

test_invalidinput1 - Negative test case. Check if on not entering values for the required questions (1 and 2), the page throws an error and does not allow the user to submit the form.

test_invalidinput2 - Negative test case. Check if on not entering values for one of the required questions (2), the page throws an error and does not allow the user to submit the form.


