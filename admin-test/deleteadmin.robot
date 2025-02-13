*** Settings ***
Resource    resources.robot

*** Variables ***
${ADMIN_ID}     4
${ADMIN_ID_3}     3


*** Test Cases ***
delete other admin
    [Documentation]    ทดสอบลบ admin อื่น
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Click Element   xpath=//div[@id="admincard-id-${ADMIN_ID}"]//button[@id="deleteadminButton"]
    Click Element   ${CONFIRM_DELETE_BUTTON}
    sleep   1s
    Page Should Contain    Account has been successfully deleted.
    sleep   1s
    Click Element   ${OK_BUTTON}
    Page Should Not Contain Element    xpath=//div[@id="admincard-id-${ADMIN_ID}"]
    sleep   1s

    Close Browser

delete Admin currently active
    [Documentation]    ลบ Admin ที่กำลังใช้งานอยู่
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Click Element   xpath=//div[@id="admincard-id-${ADMIN_ID_3}"]//button[@id="deleteadminButton"]
    Click Element   ${CONFIRM_DELETE_BUTTON}
    Page Should Contain    You cannot delete currently active Account.
    sleep   1s
    Click Element   ${OK_BUTTON}
    sleep   1s
    Page Should Contain Element    id=admincard-id-3
    Close Browser

    