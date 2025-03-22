## Introduction
:construction_worker::construction: This README file is under construction! :construction::construction_worker:

**introduction-to-robotframework** is a project created for the workshop "*Conhecendo Robot Framework para automação de testes*" (Robot Framework for test automation) by [Aubay Portugal](https://www.aubay.pt/) which I was the speaker, and it contains files that present essential knowledge in Robot Framework, such as:
- Structure of a Robot file;
- Types of variables;
- Examples of test and keyword files;
- Custom keywords in Python;
- Locators for web testing;
- Web testing with Selenium Library;
- API testing with Requests Library.

The workshop was recorded and is available in Portuguese on YouTube via [this link](https://www.youtube.com/watch?v=r1Yp3Ju4C-U).

## Table of Contents
- [Introduction](#introduction)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
- [Usage](#usage)
- [References](#references)

## Installation
1. Clone the repository:
```bash
git clone https://github.com/tiagocbarbosa/introduction-to-robotframework.git
```
2. Install Python 3.12.0 or newest.
3. Robot Framework 4.1.2 or newest:
```bash
pip install robotframework
```
4. SeleniumLibrary:
```bash
pip install --upgrade robotframework-seleniumlibrary
```
5. RequestsLibrary:
```bash
pip install robotframework-requests
```

(TO DO: chrome driver).

## Usage
To run the project, open it on your favorite IDE and use one of the following commands:
- `robot -d reports/ tests/`: to execute all tests inside the "tests" folder and save the report in the "reports" folder.
- `robot -d reports/ tests/web/home.robot`: to execute all tests defined in the "home.robot" file.
- `robot -d reports/ -i REGRESSION`: to execute all tests with the "REGRESSION" tag.
<!-- - Para executar o teste do arquivo "tipos-variaveis.robot": robot -d reports/ resources/tipos-variaveis.robot
- Para executar o teste do arquivo "home.robot": robot -d reports/ tests/web/home.robot -->

## References
[Robot Framework](https://robotframework.org/)

[SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary/)

[RequestsLibrary](https://github.com/MarketSquare/robotframework-requests#readme)

[ParaBank for web testing](https://parabank.parasoft.com/parabank/index.htm)

[ServeRest for API testing](https://serverest.dev/)