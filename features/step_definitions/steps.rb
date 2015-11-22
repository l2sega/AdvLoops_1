Then /^For loops task$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  element = $driver.find_elements :xpath => "//a[@class = 'vip']"
  for i in element do
    puts i.text
  end
end

Then /^While loop task$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  count = 0
  while count < 2
    element = $driver.find_element :xpath => "//a[@class = 'gspr next']"
    element.click
    count += 1
  end
end

Then /^While loop task print$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  count = 0
  until count == 5
    element = $driver.find_elements :xpath => "//a[@class = 'vip']"
    puts element[count].text
    count += 1
  end
end

Then /^Error on ebay sign in$/ do
  begin
    $driver.get "http://www.ebay.com/"
    element = $driver.find_element :xpath => "//a[contains(text(), 'Войдите')]"
    element.click
    sleep 2
    element = $driver.find_element :id => "userid"
    element.send_keys "ivanov@gmail.com"
    element = $driver.find_element :id => "pass"
    element.send_keys " "
    element = $driver.find_element :id => "sgnBt"
    element.click
    element = $driver.find_elements :xpath => "//a[@class = 'p']"
    element.click
    element = $driver.find_elements :xpath => "//a[contains(text(), 'Войдите')]"
  rescue
    raise 'Ivalid data'
  end
end

Then /^Collect title in array$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  element = $driver.find_elements :xpath => "//a[@class = 'vip']"
  puts element
  cars_array = []
  for i in element do
    cars_array.push(i.text)
  end
  puts cars_array
end

Then /^Go through pages$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  x = $driver.find_element :xpath => "//td[@class = 'pages']/a[contains(@aria-label, 'Выбранная')]"
  until x.text == '4' do
    cars = $driver.find_elements :xpath => "//a[@class = 'vip']"
    for i in cars do
      puts i.text
    end
    next_button = $driver.find_element :xpath => "//a[@class = 'gspr next']"
    next_button.click
    x = $driver.find_element :xpath => "//td[@class = 'pages']/a[contains(@aria-label, 'Выбранная')]"
  end
end

Then /^Unless$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  element = $driver.find_elements :xpath => "//a[@class = 'vip']"
  for i in element do
    unless i.text.include? 'НОВОЕ'
      puts i.text
    end
  end
end

Then /^while loop and for$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  x = $driver.find_element :xpath => "//a[@class = 'pg  curr'][contains(@aria-label, 'Выбранная')]"
  until x.text == '4' do
    cars_puts
    next_button = $driver.find_element :xpath => "//a[@class = 'gspr next']"
    next_button.click
    x = $driver.find_element :xpath => "//a[@class = 'pg  curr'][contains(@aria-label, 'Выбранная')]"
  end
  cars_puts
end

def cars_puts
  cars = $driver.find_elements :xpath => "//a[@class = 'vip']"
  for i in cars do
    if i.text.include?('НОВОЕ')
      next
    else
      puts i.text
    end
  end
end

Then /^Search from array$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  array = ['BMW', 'Mercedes', 'Lexus']
  for brand in array do
    element = $driver.find_element :id => "gh-ac"
    element.clear
    element.send_keys brand
    element = $driver.find_element :id => "gh-btn"
    element.click
    cars = $driver.find_elements :xpath => "//a[@class = 'vip']"
    for car in cars do
      if car.text.include?(brand)
        puts car.text
      else
        raise "No this brand"
      end
    end
  end
end