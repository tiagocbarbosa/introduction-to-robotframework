*** Settings ***
Library  Collections
Library  String
Library  RequestsLibrary

*** Test Cases ***
Get and create ServerRest users
  [Tags]  REGRESSION
  # Get request
  ${getResponse} =  Get all users
  Check response of get users API  ${getResponse}
  
  # Post request
  ${randomText} =  Generate Random String  length=5  chars=[LOWER]
  ${user} =  Create Dictionary  nome=João  email=joao${randomText}@gmail.com  password=123456  administrador=false
  ${createResponse} =  Create user  ${user}
  Check response of create user API  ${createResponse}

*** Keywords ***
Get all users
  ${headers} =  Create Dictionary  Content-Type=application/json
  Create Session  alias=ServerRest  url=https://serverest.dev  headers=${headers}
  ${response} =  GET On Session  alias=ServerRest  url=/usuarios
  Log  ${response.content}
  [Return]  ${response}

Check response of get users API
  [Arguments]  ${response}
  Should Be Equal As Strings  ${response.status_code}  200
  Should Be Equal As Strings  ${response.reason}  OK
  Dictionary Should Contain Key  ${response.json()}[usuarios][0]  nome

Create user
  [Arguments]  ${body}
  ${headers} =  Create Dictionary  Content-Type=application/json
  Create Session  alias=ServerRest  url=https://serverest.dev  headers=${headers}
  ${response} =  POST On Session  alias=ServerRest  url=/usuarios  json=${body}
  Log  ${response.content}
  [Return]  ${response}

Check response of create user API
  [Arguments]  ${response}
  Should Be Equal As Strings  ${response.status_code}  201
  Should Be Equal As Strings  ${response.reason}  Created
  Dictionary Should Contain Item  ${response.json()}  message  Cadastro realizado com sucesso
  Dictionary Should Contain Key  ${response.json()}  _id

