*** Variable ***
${string}  This is a string
@{list}  juice  soda  iogurte  water
&{dictionary}  name=John  email=john@gmail.com  age=18

*** Keywords ***
Print variables
  Log  ${string}                # This is a string
  Log  ${list}                  # ['juice', 'soda', 'iogurte', 'water']
  Log  ${dictionary}            # {'name': 'John', 'email': 'john@gmail.com', 'age': '18'}
  Log  ${dictionary['name']}    # John
  Log  ${dictionary['email']}   # john@gmail.com
  Log  ${dictionary['age']}     # 18

