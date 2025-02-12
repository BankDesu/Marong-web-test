*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        chrome
${DELAY}          0
${LOGIN_URL}             http://${SERVER}/
${OVERVIEW_URL}          http://${SERVER}/overview

# Login Locators
${LOGIN_GMAIL}       id=login_gmailBox
${LOGIN_PASSWORD}    id=login_passwordBox
${LOGIN_BUTTON}      id=loginButton


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
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

Input Gmail
    [Arguments]    ${gmail}
    Input Text    ${LOGIN_GMAIL}    ${gmail}

Input Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PASSWORD}    ${password}

Overview Page Should Be Open
    Location Should Be    ${OVERVIEW_URL} 

Can't Login
    Location Should Be    ${LOGIN_ERROR_URL}