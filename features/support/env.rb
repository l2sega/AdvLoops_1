require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
require 'spreadsheet'
require 'gmail'
require 'net/imap'

$dropdown = Selenium::WebDriver::Support::Select

Before do
  $driver = Selenium::WebDriver.for :firefox
  $driver.manage.window.maximize
end

After do
  $driver.quit
end

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

#username = sample@gmail.com
#password = 1234TEST!
def read_mail(username, password)
  Gmail.new(username, password) do |gmail|


  end

end

def read_mail2(username, password)
  gmail = Gmail.connect(username, password)
  gmail.inbox.count
  gmail.inbox.count(:unread, :from => 'selenium@gmail.com') #or :read
  gmail.inbox.find(:unread, :from => 'selenium@gmail.com').each do |mail|
    mail.read!
    mail.move_to('LABELED_folder')
    mail.label('label')
  end
  gmail.logout
end

def read_mail3(username, password)
  gmail = Gmail.connect(username, password)

  gmail.label("New_label").emails.each do |mail|
    mail.read!
  end
  gmail.logout
end

def read_mail4(username, password)
  save_folder = "c://save_folder"
  gmail = Gmail.connect(username, password)

  gmail.inbox.find(:unread, :from => 'selenium@gmail.com').each do |mail|
    if mail.message.attachments.empty?
      mail.message.save_attachments_to(save_folder)
    end

  end
  gmail.logout
end

def read_mail5(username, password)
  url = ''
  gmail = Gmail.connect(username, password)

  gmail.inbox.find(:unread, :from => 'webportal@gmail.com').each do |mail|
    if mail.count == 0
      puts "Ooops"
    end
    message = mail.body.decoded
    url = /<a>Welcome on board/m.mutch(message)[1].gsub!(/\s/, '')
  end
  gmail.logout
  return url
end

def send_mail(username, password)
  for_attaches = "c:/path"

  gmail = Gmail.connect(username, password)
  gmail.deliver do
    to 'seleniumHW@gmail.com'
    subject 'Wow its work'
    body 'TEXT'
    add_file for_attaches
  end
  gmail.logout
end

def read_mail_imap(username, password)
  imap = Net::IMAP.new('imap.gmail.com', 993, true)
  imap.login(username, password)
  imap.select('INBOX')
  target_mail = search_mail(imap, 'SUBJECT' 'Spam_subject')
  target_message = imap.fetch(target_mail, 'RFC822')[0].atte['RFC822']
  mail = Mail.read_from_string target_message
  out_body = mail.html_part.body
end








