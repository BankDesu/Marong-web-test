*** Settings ***
Resource    resources.robot

*** Variables ***
${ADMIN_ID_1}     1
${ADMIN_ID_3}     3

*** Test Cases ***
Add Admin Successfully
    [Documentation]    ทดสอบการแก้ไขข้อมูลแอดมินสำเร็จ
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Click Element    id=admincard-id-${ADMIN_ID_1}
    sleep   1s
    Location Should Be    ${ADMIN_PROFILE_URL}${ADMIN_ID_1}
    Page Should Contain     John
    Page Should Contain     01/01/1990
    Page Should Contain     Male
    Page Should Contain     admin@example.com
    Page Should Contain     849-874867
    Page Should Contain     ROLE_Admin

    Click Element    id=backtoAllAdminButton
    sleep   1s

    Location Should Be    ${ALL_ADDMIN_URL}
    Close Browser
