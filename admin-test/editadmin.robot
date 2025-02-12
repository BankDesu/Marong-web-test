*** Settings ***
Resource    resources.robot

*** Variables ***
${FIRST_NAME}       Test1
${LAST_NAME}        Admin1
${TELEPHONE}       0812345678
${PASSWORD}        Test@1234
${BIRTHDAY}        01-01-1995
${ROLE}            Master Admin
${ROLE2}            Admin
${GENDER}          Male

${ADMIN_ID}     15
${ADMIN_ID_3}     3

*** Test Cases ***
Add Admin Successfully
    [Documentation]    ทดสอบการแก้ไขข้อมูลแอดมินสำเร็จ
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Click Element    id=admincard-id-${ADMIN_ID}
    sleep   1s
    Location Should Be    ${ADMIN_PROFILE_URL}${ADMIN_ID}
    Click Element    id=editProfileButton
    sleep   1s
    Location Should Be    ${ADMIN_EDIT_URL}${ADMIN_ID}

    # กรอกข้อมูล
    Input Text    id=editFirstNameBox    ${FIRST_NAME}
    Input Text    id=editLastNameBox    ${LAST_NAME}
    Input Text    id=editPasswordBox    test2
    Input Text    id=editConfirmPasswordBox    test2

    # กดปุ่มบันทึกแก้ไขข้อมูลแอดมิน
    Click Element    id=saveEditButton
    sleep   1s

    Location Should Be    ${ADMIN_PROFILE_URL}${ADMIN_ID}
    sleep   1s
    Close Browser

Edit Passwords Do Not Match
    [Documentation]    ทดสอบกรณีรหัสผ่านไม่ตรงกัน
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Click Element    id=admincard-id-${ADMIN_ID}
    sleep   1s
    Location Should Be    ${ADMIN_PROFILE_URL}${ADMIN_ID}
    Click Element    id=editProfileButton
    sleep   1s
    Location Should Be    ${ADMIN_EDIT_URL}${ADMIN_ID}

    # กรอกข้อมูล แต่รหัสผ่านไม่ตรงกัน
    Input Text    id=editPasswordBox    ${PASSWORD}
    Input Text    id=editConfirmPasswordBox    WrongPassword123

    # กดปุ่มบันทึกแก้ไขข้อมูลแอดมิน
    Click Element    id=saveEditButton
    sleep   1s

    # ตรวจสอบว่ามีการแจ้งเตือนรหัสผ่านไม่ตรงกัน
    Page Should Contain    Password and Confirm Password do not match.
    Close Browser

edit role Admin Successfully
    [Documentation]    ทดสอบการแก้ไขข้อมูลแอดมินสำเร็จ
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Click Element    id=admincard-id-${ADMIN_ID}
    sleep   1s
    Location Should Be    ${ADMIN_PROFILE_URL}${ADMIN_ID}
    Click Element    id=editProfileButton
    sleep   1s
    Location Should Be    ${ADMIN_EDIT_URL}${ADMIN_ID}

    # กรอกข้อมูล
    Select From List By Label    id=editRoleDropdown    ${ROLE}

    # กดปุ่มบันทึกแก้ไขข้อมูลแอดมิน
    Click Element    id=saveEditButton
    sleep   1s

    Location Should Be    ${ADMIN_PROFILE_URL}${ADMIN_ID}
    sleep   1s
    Page Should Contain     ROLE_master Admin
    Close Browser