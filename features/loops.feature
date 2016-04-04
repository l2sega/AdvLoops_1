Feature: Test
  #Test cases for loops
  Scenario: Loop #1
    Then Collect title in array

  Scenario: While
    Then While loop task

  Scenario: While print
    Then While loop task print

  Scenario: Exception
    Then Error on ebay sign in

  Scenario: While and for loops
    Then Go through pages

  Scenario: Print if not New
    Then Unless

  Scenario: while loop + for
    Then while loop and for

  Scenario: Task 3: (For loop + array)
    Then Search from array

  #Test cases for interface
  Scenario: Check the check-boxes with label
    Then Check the check-boxes with label Model Year
    Then Verify checked boxes

  Scenario Outline: Open drop down list
    Then Select <item> from drop down list

    Examples:
      | item  |
      | Книги |
      | Зоотовары |
      | Искусство |

  Scenario: Cascade dropdown list
    Then Select items from cascade dropdown list

  Scenario: Google
    Then Search with Google

  Scenario: Check Mileage
    Then Check mileage Less than 20,000 miles
    Then Verify mileage

  Scenario: Color
    Then go to "http://www.ebay.com/sch/Cars-Trucks-/6001/i.html"
    Then Click on See all colors
    Then Choose some colors

  Scenario: DD HTML5
    Then go to "http://html5demos.com/drag#"
    Then Ddown

  Scenario: Hybrid dropdown
    Then go to "http://demos.telerik.com/kendo-ui/dropdownlist/cascadingdropdownlist"
    Then Hybrid dd all values to first

  #it works only on Chrome
  Scenario: Upload file
    Then go to "http://cgi-lib.berkeley.edu/ex/fup.html"
    Then upload

  #it works only on Chrome
  Scenario: Upload file 2
    Then go to "http://www.wicket-library.com/wicket-examples/upload/single;jsessionid=C6362C722ED885455F9DD87AB5ACECC6?0"
    Then upload file "AdvLoops_1/TestData/Test.jpg"

  Scenario: Upload file 3
    Then go to "http://fineuploader.com/demos"
    Then Upload files

  Scenario: Game drag and drop
    Then go to "http://www.elated.com/res/File/articles/development/javascript/jquery/drag-and-drop-with-jquery-your-essential-guide/card-game.html"
    Then Drag all items

  Scenario: Click on slice
    Then go to "http://bl.ocks.org/Caged/6476579"
    Then Switch to
    Then Click on a slice A

  Scenario: Reed some file
    Then Read and print out

  Scenario: Scream if found target in text
    Then Scream if found "sun" in text

  Scenario: Print all credentials from file
    Then Print them all

  Scenario: Credentials from specific row
    Then Print credentials from the row "3"

  Scenario: Reading through files
    Then Find string into the files

  Scenario: Try to login
    Then go to "http://www.facebook.com"
    Then Try to login

  Scenario: Gmail log in
    Then Log in into gmail

  Scenario: Gmail print unread mails
    Then Print unread

  Scenario: Gmail registration link
    Then Link from mail

  Scenario: Remove spam from Gmail
    Then Spam remove

  Scenario: Gmail send mail
    Then Send mail to "sskoff@mail.ru"

  Scenario: Net Imap
    Then Net imap mails print

  Scenario: Pathfinder
    Then Find code for pathfinder
   # Then Find the passcode