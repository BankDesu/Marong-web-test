*** Settings ***
Resource   resources.robot
Library    SeleniumLibrary

*** Test Cases ***
Verify Admin Cards Exist
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Page Should Contain Element    id=admincard-id-1
    Page Should Contain Element    id=admincard-id-3
    Page Should Contain Element    id=admincard-id-15
    Page Should Contain Element    id=admincard-id-21
    Close Browser
