*** Settings ***                                                                                       
Library    Collections                                                                                 
Library    RequestsLibrary                                                                             
                                                                                                       
Suite Setup    Create Session  jsonplaceholder  https://jsonplaceholder.typicode.com                   
                                                                                                       
*** Test Cases ***                                                                                     
                                                                                                       
Get Request Test                                                                                       
    Create Session    google  http://www.google.com                                                    
                                                                                                       
    ${resp_google}=   GET On Session  google  /  expected_status=200                                   
    ${resp_json}=     GET On Session  jsonplaceholder  /posts/1                                        
                                                                                                       
    Should Be Equal As Strings          ${resp_google.reason}  OK                                      
    Dictionary Should Contain Value     ${resp_json.json()}  sunt aut facere repellat provident        
                                                                                                       
Post Request Test                                                                                      
    &{data}=    Create dictionary  title=Robotframework requests  body=This is a test!  userId=1       
    ${resp}=    POST On Session    jsonplaceholder  /posts  json=${data}  expected_status=anything     
                                                                                                       
    Status Should Be                 201  ${resp}                                                      

*** Keywords ***
Post request com bearer token
  [Arguments]  ${body}
  ${headers} =  Create Dictionary  Content-Type=application/json  Authorization=Bearer abcdefg
  Create Session  alias=SessionComToken  url=https://serverest.dev  headers=${headers}
  ${response} =  POST On Session  alias=SessionComToken  url=/usuarios  json=${body}
  Log  ${response.content}

