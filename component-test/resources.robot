
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        chrome
${DELAY}          0
${LOGIN_URL}             http://${SERVER}/
${OVERVIEW_URL}          http://${SERVER}/overview
${LOGIN_ERROR_URL}       http://${SERVER}/
${CASE_URL}              http://${SERVER}/case
${NEWS_URL}              http://${SERVER}/news
${NEWS_ADD_URL}          http://${SERVER}/news/addnews
${ALL_ADMIN_URL}        http://${SERVER}/admin
${ADMIN_PROFILE_URL}     http://${SERVER}/admin/adminprofile/
${ADMIN_EDIT_URL}        http://${SERVER}/admin/edit/
${ADMIN_ADD_URL}         http://${SERVER}/admin/add

# Login Locators
${LOGIN_GMAIL}       id=login_gmailBox
${LOGIN_PASSWORD}    id=login_passwordBox
${LOGIN_BUTTON}      id=loginButton

# Case Locators
${STATUS}            id=caseStatus

#Sidebar Locator
${OVERVIEW_LINK}      id=Overview
${CASE_LINK}      id=Case
${NEWS_LINK}      id=News
${ADMIN_LINK}      id=Admin management

*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${options}    add_argument    --headless
    Open Browser    ${LOGIN_URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be    ${LOGIN_URL}

Login
    [Arguments]    ${gmail}    ${password}
    Input Text    ${LOGIN_GMAIL}    ${gmail}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Overview Page Should Be Open
    Location Should Be    ${OVERVIEW_URL} 
    Sleep    1s
    Wait Until Element Is Visible  ${OVERVIEW_LINK}  timeout=5s
    ${element}=  Get WebElement  ${OVERVIEW_LINK}
    ${color}=  Execute JavaScript  return window.getComputedStyle(arguments[0]).backgroundColor;  ARGUMENTS  ${element}
    Log To Console  Background color: ${color}
    Should Contain  ${color}  rgb(191, 219, 254)

Open And Login
    Open Browser To Login Page
    Login    msaidmin@gmail.com    hashed_password_2
    Sleep    1s
    Overview Page Should Be Open


Go To Overview Page
    Wait Until Element Is Visible    ${OVERVIEW_LINK}    timeout=5s
    Click Element    ${OVERVIEW_LINK}
    Sleep    1s
    Overview Page Should Be Open

Go To Case Page
    Wait Until Element Is Visible    ${CASE_LINK}    timeout=5s
    Click Element    ${CASE_LINK}
    Sleep    1s
    Case Page Should Be Open

Case Page Should Be Open
    Location Should Be    ${CASE_URL}
    Sleep    1s
    Wait Until Element Is Visible  ${CASE_LINK}  timeout=5s
    ${element}=  Get WebElement  ${CASE_LINK}
    ${color}=  Execute JavaScript  return window.getComputedStyle(arguments[0]).backgroundColor;  ARGUMENTS  ${element}
    Log To Console  Background color: ${color}
    Should Contain  ${color}  rgb(191, 219, 254)

Go To News Page
    Wait Until Element Is Visible    ${NEWS_LINK}    timeout=5s
    Click Element    ${NEWS_LINK}
    Sleep    1s
    News Page Should Be Open

News Page Should Be Open
    Location Should Be    ${NEWS_URL}
    Sleep    1s
    Wait Until Element Is Visible  ${NEWS_LINK}  timeout=5s
    ${element}=  Get WebElement  ${NEWS_LINK}
    ${color}=  Execute JavaScript  return window.getComputedStyle(arguments[0]).backgroundColor;  ARGUMENTS  ${element}
    Log To Console  Background color: ${color}
    Should Contain  ${color}  rgb(191, 219, 254)

Go To Admin Page
    Wait Until Element Is Visible    ${ADMIN_LINK}    timeout=5s
    Click Element    ${ADMIN_LINK}
    Sleep    1s
    Admin Page Should Be Open

Admin Page Should Be Open
    Location Should Be    ${ALL_ADMIN_URL}
    Sleep    1s
    Wait Until Element Is Visible  ${ADMIN_LINK}  timeout=5s
    ${element}=  Get WebElement  ${ADMIN_LINK}
    ${color}=  Execute JavaScript  return window.getComputedStyle(arguments[0]).backgroundColor;  ARGUMENTS  ${element}
    Log To Console  Background color: ${color}
    Should Contain  ${color}  rgb(191, 219, 254)

Open Overview Page   
    Open And Login
    Go To Overview Page
    Overview Page Should Be Open

Open Case Page    
    Open And Login
    Go To Case Page
    Case Page Should Be Open

Open News Page    
    Open And Login
    Go To News Page
    News Page Should Be Open


Open Admin Page   
    Open And Login
    Go To Admin Page
    Admin Page Should Be Open