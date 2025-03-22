*** Variable ***
${id}       id:idBtn
${name}     name:example
${class}    class:example
${tag}      tag:div
${xpath}    xpath: //*[contains(text(), "example")]
${css}      css:div#example

*** Keywords ***
Exemplo 01 de click
  Click Element  ${id}

Exemplo 02 de click
  Click Element  ${class}

Exemplo 03 de click
  Click Element  xpath://div[@id="example"]

