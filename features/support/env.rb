require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

$driver = Selenium::WebDriver.for :firefox
$dropdown = Selenium::WebDriver::Support::Select