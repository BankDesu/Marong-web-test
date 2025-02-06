*** Settings ***
Library    SeleniumLibrary
Variables  variables.robot

*** Keywords ***
Open Browser
    Open Browser    ${LOGIN_URL}     ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login
    [Arguments]    ${email}    ${password}
    Input Text    ${LOGIN_EMAIL}    ${email}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button    ${LOGIN_BUTTON}