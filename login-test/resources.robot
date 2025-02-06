*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        chrome
${DELAY}          1
${LOGIN_URL}             http://${SERVER}/
${OVERVIEW_URL}          http://${SERVER}/overview
${LOGIN_ERROR_URL}       http://${SERVER}/
${CASE_URL}              http://${SERVER}/case
${NEWS_URL}              http://${SERVER}/news
${NEWS_ADD_URL}          http://${SERVER}/news/addnews
${ALL_ADDMIN_URL}        http://${SERVER}/admin
${ADMIN_PROFILE_URL}     http://${SERVER}/admin/adminprofile/
${ADMIN_EDIT_URL}        http://${SERVER}/admin/edit/
${ADMIN_ADD_URL}         http://${SERVER}/admin/add

# Login Locators
${LOGIN_EMAIL}       id="login_gmail"
${LOGIN_PASSWORD}    id="login_password"
${LOGIN_BUTTON}      id="loginButton"


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be ${LOGIN_URL}

Login
    [Arguments]    ${email}    ${password}
    Input Text    ${LOGIN_EMAIL}    ${email}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Overview Page Should Be Open
    Location Should Be  ${OVERVIEW_URL} 