require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

$driver = Selenium::WebDriver.for :chrome
$dropdown = Selenium::WebDriver::Support::Select

def drag_drop_html5(source, target)
  file = File.expand_path('..', Dir.pwd) + '/drag_and_drop_helper.js'
  file_js = File.new(file, "r")
  java_script = ""
  while (line=file_js.gets)
    java_script += line
  end
  file_js.close
  $driver.execute_script(java_script+"$('#{source}').simulateDragDrop({ dropTarget: '#{target}'});")
  rescue Exception => e
    puts "Sat wrong" +e.to_s
end