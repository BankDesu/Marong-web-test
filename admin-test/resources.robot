*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        chrome
${DELAY}          0
${LOGIN_URL}             http://${SERVER}/
${OVERVIEW_URL}          http://${SERVER}/overview
${NEWS_ADD_URL}          http://${SERVER}/news/addnews
${ALL_ADDMIN_URL}        http://${SERVER}/admin
${ADMIN_PROFILE_URL}     http://${SERVER}/admin/adminprofile/
${ADMIN_EDIT_URL}        http://${SERVER}/admin/edit/
${ADMIN_ADD_URL}         http://${SERVER}/admin/add

# Login Locators
${LOGIN_GMAIL}       id=login_gmailBox
${LOGIN_PASSWORD}    id=login_passwordBox
${LOGIN_BUTTON}      id=loginButton

# Admin Locators
${ADMIN_PAGE_BUTTON}    id=goto_adminpageButton
${ADD_ADMIN_BUTTON}     id=add_adminButton
${OK_BUTTON}     id=okButton
${CONFIRM_DELETE_BUTTON}     id=confirmDeleteButton
${CANNCEL_DELETE_BUTTON}     id=cancelDeleteButton


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be    ${LOGIN_URL}

Login as masteradmin
    Input Text    ${LOGIN_GMAIL}    msaidmin@gmail.com
    Input Text    ${LOGIN_PASSWORD}    hashed_password_2
    Click Button    ${LOGIN_BUTTON}

Login as admin
    Input Text    ${LOGIN_GMAIL}    admin@example.com
    Input Text    ${LOGIN_PASSWORD}    hashed_password_2
    Click Button    ${LOGIN_BUTTON}

Overview Page Should Be Open
    Location Should Be    ${OVERVIEW_URL} 
