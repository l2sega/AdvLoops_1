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

Then /^Check the check-boxes with label Model Year$/ do
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  show = $driver.find_element :xpath => "//div[@id = 'e1-9']//a[@role = 'button']"
  show.click
  sleep 3
  el = $driver.find_elements :xpath => "(//div[@class = 'selected_content']//input[@type = 'checkbox'])[position() > 1]"
  for i in el do
    i.click
  end
end

Then /^Verify checked boxes$/ do
  el = $driver.find_elements :xpath => "//div[@class = 'selected_content']//input[@type = 'checkbox']"
  for i in el do
    if i.selected?
    else
      raise 'You have not checked box/boxess'
    end
  end
end

Then /^Select ([^"]*) from drop down list$/ do |item|
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  drop = $driver.find_element :id => "gh-cat"
  sel_drop = $dropdown.new(drop)
  #sel_drop.select_by(:index, 1)
  sel_drop.select_by(:text, "#{item}")
  drop = $driver.find_element :id => "gh-cat"
  sel_drop = $dropdown.new(drop)
  sel_drop.first_selected_option.text
  puts "OK"
end

Then /^Select items from cascade dropdown list$/ do
  $driver.get "http://ajaxcontroltoolkit.com/CascadingDropDown/CascadingDropDown.aspx"
  drop = $driver.find_elements :xpath => "//select[contains(@id, 'ctl00')]"
  for i in drop do
    sel_drop = $dropdown.new(i)
    sel_drop.select_by(:index, 1)
    sleep 2
  end
end

Then /^Search with Google$/ do
  $driver.get "http://www.google.com"
  searchline = $driver.find_element :id => "lst-ib"
  searchline.send_keys "What if "
  puts "Google sugest folowing variants"
  sleep 2
  subsearch = $driver.find_elements :xpath => "//ul[@role = 'listbox']//div[@class = 'sbqs_c']"
  for i in subsearch do
    puts i.text
  end
  random_variant = subsearch.sample
  puts "I have chose %s" %random_variant.text
  random_variant.click
end

Then /^Check mileage ([^"]*)$/ do |x|
  $driver.get "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
  box = $driver.find_element :xpath => "//a[.//span[text() = '#{x}']]//input"
  box.click
end

Then /^Verify mileage$/ do
  array_for_var = []
  mileafes = $driver.find_elements :xpath => "//li[contains(text(), 'Mileage')]"
  for i in mileafes do
    a = i.text.sub!('Mileage: ', '').delete(',').to_i
    array_for_var.push(a)
  end
  for x in array_for_var do
    if x < 20000
      next
    else
      raise 'Your range more then 20,000'
    end
  end
  puts 'succesful'
  #puts array_for_var
end

Then /^go to "([^"]*)"$/ do |link|
  $driver.get link
  sleep 2
end

Then /^Click on See all colors$/ do
  button = $driver.find_element(:xpath, "//div[.//span/h3[text() = 'Exterior Color']]/a")
  button.click
  sleep 2
end

Then /^Choose some colors$/ do
  color_we_want = ['Black', 'Gray', 'Blue']
  for i in color_we_want do
    $driver.find_element(:xpath, "//input[@type = 'checkbox' and @value = '"+i+"']").click
    sleep 1
  end
end

Then /^Ddown$/ do
  target = $driver.find_element :id => "bin"
  sourse = $driver.find_element :id => "one" #:xpath => "//article//a"
  $driver.action.drag_and_drop(sourse, target).perform
end

Then /^Hybrid dd all values to first$/ do
  triggers = $driver.find_elements :xpath => "//span[@class = 'k-input'][contains(text(), 'Select')]"
  for i in triggers do
    i.click
    sleep 1
    $driver.find_element(:xpath, "(//ul[@aria-hidden = 'false']/li)[1]").click
    sleep 1
  end
end

Then /^upload$/ do
  upload = $driver.find_element :xpath => "//form[@action = 'fup.cgi']/input[@type = 'file']"
  #upload.send_keys "C:\\Users\\Sega\\Desktop\\Test.jpg"
  file = 'AdvLoops_1/TestData/Test.jpg'
  #final_path = File.join(File.expand_path("..", Dir.pwd), file) #E:\Git\RubymineProjects\AdvLoops_1\TestData
  #sleep 2
  final_path = File.join(Dir.pwd, file)
  #file = File.join(File.dirname(__FILE__) + '/../TestData/Test.jpg')
  upload.send_keys final_path
  #$driver.execute_script "$('input').show();"
  #$driver.execute_script 'document.getElementsByName('body')[0].setAttribute('type', 'text')'
  #button = $driver.find_element :xpath => "//input[@type = 'submit']"
  #button.click
  #puts final_path
end

Then /^upload file "([^"]*)"$/ do |file|
  upload = $driver.find_element :xpath => "//form[@id = 'id6']//input[@name = 'fileInput']"
  #file = 'AdvLoops_1/TestData/Test.jpg'
  final_path = File.join(Dir.pwd, file)
  upload.send_keys final_path
end

Then /^Upload files$/ do
  new_array = []
  until new_array.count == 3  do
    upload = $driver.find_element(:xpath, "//div[@id = 'fine-uploader-gallery']//div/div/input")
    array = ['Test.jpg', 'Test2.jpg', 'Test3.jpg']
    random_variant = array.sample
    if new_array.include? random_variant
      next
    else
      new_array.push(random_variant)
      file = '/TestData/' + random_variant
      final_path = File.join(Dir.pwd, file)
      upload.send_keys final_path
    end
  end
  puts new_array
end

Then /^Drag all items$/ do
  sourses = $driver.find_elements(:xpath, "//div[@id = 'cardPile']/div")
  for i in sourses
    sourse = $driver.find_element(:xpath, "//div[@id = 'cardPile']/div[text() = '"+i.text.to_s+"']")
    target = $driver.find_element(:xpath, "(//div[@id = 'cardSlots']/div)["+i.text.to_s+"]")
    $driver.action.drag_and_drop(sourse, target).perform
    sleep 1
  end
end

Then /^Switch to$/ do
  $driver.switch_to.frame(0)
  #$driver.switch_to.default_content
end

Then /^Click on a slice ([^"]*)$/ do |target|
  letters = $driver.find_elements(:xpath, "//*[name() = 'g'][@class = 'x axis']//*[name() = 'text']")
  letters = letters.map {|x| x.text}
  puts letters

  #letters.index(target)
  #hash = Hash[letters.map.with_index.to_a]
  #puts hash
  counter = 0
  for i in letters do
    if i == target
      break
    else
      counter += 1
    end
  end
  sleep 1

  link_to_the_chart = $driver.find_element(:xpath, "(//*[name() = 'g'][@transform = 'translate(40,40)']//*[name() = 'rect'])["+(counter+1).to_s+"]")
  sleep 2
  $driver.mouse.move_to link_to_the_chart
  sleep 1
  pers = $driver.find_element(:xpath, "//div[@class = 'd3-tip n']/span").text.to_f*100
  puts target + ' equal ' + pers.round(1).to_s + '%'
  #hash[target]
end

Then /^Read and print out$/ do
  file_rtf = File.join(Dir.pwd, '/TestData/romeo.txt')
  File.open(file_rtf, 'r').each_line do |line|
    puts line
  end
end

Then /^Scream if found "([^"]*)" in text$/ do |phrase|
  file_rtf = File.join(Dir.pwd, '/TestData/romeo.txt')
  File.open(file_rtf, 'r').each_line do |line|
    if line.include? phrase
      raise "Wow, got it"
    end
  end
end

Then /^Print them all$/ do
  file_xls = File.join(Dir.pwd, '/TestData/Test_ss.xls')
  book = Spreadsheet.open(file_xls)
  ws = book.worksheet('Sheet1') #or index from 0
  ws.each do |row|
    login = row[0]
    password = row[1]
    puts login, password
  end
end

Then /^Print credentials from the row "([^"]*)"$/ do |row_num|
  file_xls = File.join(Dir.pwd, '/TestData/Test_ss.xls')
  book = Spreadsheet.open(file_xls)
  ws = book.worksheet('Sheet1') #or index from 0

  target_row = ws.row(row_num.to_i-1)
  my_login = target_row[0]
  my_password = target_row[1]

  puts "My login is: " + my_login,  "My password is: " + my_password
end

Then /^Find string into the files$/ do
  array = ['romeo.txt', 'text_1.txt', 'text_2.txt']
  for i in array do
    file = '/TestData/' + i
    path = File.join(Dir.pwd, file)
    File.open(path, 'r').each_line do |line|
      if line.include? "This is the line of text I was looking for"
        next
      else
        puts i
        raise i "does not include this string"
      end
    end
  end
end

Then /^Try to login$/ do
  file = File.join(Dir.pwd, "/TestData/Test_ss.xls")
  book = Spreadsheet.open(file)
  ws = book.worksheet('Sheet1')

  ws.each do |row|
    loggin = row[0]
    password = row[1]
    login_field = $driver.find_element(:id, "email") rescue false
    if login_field
      login_field.send_keys loggin
      pass_field = $driver.find_element(:id, "pass")
      pass_field.send_keys password
      button = $driver.find_element(:id, "loginbutton")
      button.click
      sleep 2
      try_again = $driver.find_element(:xpath, "//a[contains(text(), 'Попробуйте еще раз')]") rescue false
      if try_again
        try_again.click
        sleep 2
      end
    end
  end
  login_field = $driver.find_element(:id, "email") rescue false
  if login_field
    raise 'No correct login/password'
  elsif not login_field
    puts "Successful login"
  end
end

Then /^Log in into gmail$/ do
  login = 'isegamega@gmail.com'
  password = ''
  gmail = Gmail.connect(login, password)

  puts gmail.logged_in?
  puts gmail.inbox.count(:unread)
  gmail.logout
end

Then /^Print unread$/ do
  login = 'isegamega@gmail.com'
  password = ''
  gmail = Gmail.connect(login, password)
  puts gmail.logged_in?

  gmail.inbox.find(:unread).each do |mail|
    text = mail.body.decoded
    puts text
  end


  gmail.logout
end

Then /^Link from mail$/ do
  login = 'isegamega@gmail.com'
  password = ''
  gmail = Gmail.connect(login, password)
  puts gmail.logged_in?

  #gmail.inbox.find(:read, :from => 'support@educadium.com').each do |mail|
  gmail.inbox.find(:read, :subject => 'Quiz submission confirmation: Quiz 2').each do |mail|
    text = mail.body.decoded

    reg_link = /<a>Click/m.match(text).gsub!(/\s/, '') #or (' ', '')


    puts reg_link
  end
  gmail.logout
end

Then /^Spam remove$/ do
  login = 'isegamega@gmail.com'
  password = ''
  gmail = Gmail.connect(login, password)
  puts gmail.logged_in?

  black_list = ['spam@spam.com', 'spam2@spam.com']
  for i in black_list do
    gmail.inbox.find(:read, :from => i).each do |mail|
      mail.delete!
    end
  end
  gmail.logout
end

Then /^Send mail to "([^"]*)"$/ do |address|
  login = 'isegamega@gmail.com'
  password = ''
  gmail = Gmail.connect(login, password)
  puts gmail.logged_in?

  gmail.deliver do
    to address
    subject "wow"
    body 'Some information'
    #add_file file
  end
  gmail.logout
end

Then /^Net imap mails print$/ do
  login = 'isegamega@gmail.com'
  password = ''
  imap = Net::IMAP.new('imap.gmail.com', 993, true)
  imap.login(login, password)
  imap.select('INBOX')
  imap.search(['FROM', 'spam@spam.com']).each do |mail|
    text = imap.fetch(mail, 'RCF822')
    puts text
  end
  imap.logout
end

Then /^Find code for pathfinder$/ do
  $driver.get "http://www.practicalsqa.net/mars-brainteaser.html"
  buttons = $driver.find_elements(:xpath, "//div[@id = 'buttons']/button")
  n = 0
  while n < buttons.count
    m = 0
    while m < buttons.count
      for i in buttons do
        status = $driver.find_elements(:xpath, "//span[@class = 'unlocked']")
        break if status.count == 1
        x, y, z = buttons[n].text, buttons[m].text, i.text
        buttons[n].click
        buttons[m].click
        i.click
        status = $driver.find_elements(:xpath, "//span[@class = 'unlocked']")
        if status.count == 1
          puts "Congratulation. Your password is: " + x + ' ' + y + ' ' + z
        end
      end
      m += 1
    end
    n += 1
  end
end


