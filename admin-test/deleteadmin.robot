*** Settings ***
Resource    resources.robot

*** Variables ***
${ADMIN_ID}     12
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
    Close Browser

    