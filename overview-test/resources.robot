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
${NEWS_EDIT_URL}         http://${SERVER}/news/editnews
${ALL_ADDMIN_URL}        http://${SERVER}/admin
${ADMIN_PROFILE_URL}     http://${SERVER}/admin/adminprofile/
${ADMIN_EDIT_URL}        http://${SERVER}/admin/edit/
${ADMIN_ADD_URL}         http://${SERVER}/admin/add

# Login Locators
${LOGIN_GMAIL}       id=gmail
${LOGIN_PASSWORD}    id=password
${LOGIN_BUTTON}      id=login_button


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

Overview Page Should Be Open
    Location Should Be    ${OVERVIEW_URL} 

Open Browser To Overview Page Without Login
    Open Browser    ${OVERVIEW_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}


Login And Navigate To Overview Page
    Open Browser To Login Page
    Login    msaidmin@gmail.com    hashed_password_2
    Wait Until Location Is    ${OVERVIEW_URL}    10s
    Wait Until Element Is Visible    id=overview_title   10s
    sleep   1s
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}