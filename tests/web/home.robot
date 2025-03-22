*** Settings ***
Library  String
Library  SeleniumLibrary
Test Setup  Open the browser
Test Teardown  Close the browser

*** Test Cases ***
Create account
  Open Parabank website
  Access register page
  Register new user

*** Keywords ***
Open the browser
  Open Browser  browser=edge

Close the browser
  Close Browser

Open Parabank website
  Maximize Browser Window
  Go To  url=https://parabank.parasoft.com/parabank/index.htm
  Wait Until Element Is Visible  id:loginPanel

Access register page
  Click Element  link:Register
  Wait Until Element Is Visible  id:customerForm

Register new user
  ${randomText} =  Generate Random String  length=5  chars=[LOWER]
  Input Text  id:customer.firstName  name
  Input Text  id:customer.lastName  lastName
  Input Text  id:customer.address.street  street
  Input Text  id:customer.address.city  city
  Input Text  id:customer.address.state  state
  Input Text  id:customer.address.zipCode  12345
  Input Text  id:customer.phoneNumber  1234567890
  Input Text  id:customer.ssn  123456789
  Input Text  id:customer.username  user${randomText}
  Input Text  id:customer.password  password
  Input Text  id:repeatedPassword  password
  Click Element  xpath://input[@value='Register']
  Wait Until Element Is Visible  xpath://a[normalize-space()='Log Out']

