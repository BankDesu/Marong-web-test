*** Settings ***
Resource    resources.robot

*** Variables ***
${FIRST_NAME}       Test
${LAST_NAME}        Admin
${GMAIL}           testadmin@example.com
${GMAIL2}           testadmin2@example.com
${TELEPHONE}       0812345678
${PASSWORD}        Test@1234
${BIRTHDAY}        01-01-1995
${ROLE}            Admin
${GENDER}          Male

*** Test Cases ***
Add Admin Successfully
    [Documentation]    ทดสอบการเพิ่มแอดมินสำเร็จ
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Click Element    ${ADD_ADMIN_BUTTON}
    sleep   1s
    Location Should Be    ${ADMIN_ADD_URL}

    # กรอกข้อมูล
    Input Text    id=addFirstNameBox    ${FIRST_NAME}
    Input Text    id=addLastNameBox    ${LAST_NAME}
    Input Text    id=addGmailBox    ${GMAIL}
    Input Text    id=addTelephoneBox    ${TELEPHONE}
    Input Text    id=addPasswordBox    ${PASSWORD}
    Input Text    id=addConfirmPasswordBox    ${PASSWORD}
    Input Text    id=addBirthdayBox    ${BIRTHDAY}
    Select From List By Label    id=addGenderDropdown    ${GENDER}
    Select From List By Label    id=addARoleDropdown    ${ROLE}

    # อัปโหลดรูป (ต้องคลิกปุ่มก่อน)
    Click Element    id=addProfileImageButton
    Choose File    name=picture    C:\\Users\\DarkK\\Downloads\\admin.png

    # กดปุ่มเพิ่มแอดมิน
    Click Element    id=confirmaddAdminButton
    sleep   1s

    Page Should Contain     Account added successfully!
    Click Element    id=okButton

    # กลับไปหน้าแอดมินและตรวจสอบว่าเพิ่มข้อมูลสำเร็จ
    Location Should Be    ${ALL_ADDMIN_URL}
    sleep   1s
    Close Browser

Fail To Add Admin When Passwords Do Not Match
    [Documentation]    ทดสอบกรณีรหัสผ่านไม่ตรงกัน
    Open Browser To Login Page
    Login as masteradmin
    sleep   1s
    Click Element    ${ADMIN_PAGE_BUTTON}
    sleep   1s
    Click Element    ${ADD_ADMIN_BUTTON}
    sleep   1s
    Location Should Be    ${ADMIN_ADD_URL}

    # กรอกข้อมูล แต่รหัสผ่านไม่ตรงกัน
    Input Text    id=addFirstNameBox    ${FIRST_NAME}
    Input Text    id=addLastNameBox    ${LAST_NAME}
    Input Text    id=addGmailBox    ${GMAIL2}
    Input Text    id=addTelephoneBox    ${TELEPHONE}
    Input Text    id=addPasswordBox    ${PASSWORD}
    Input Text    id=addConfirmPasswordBox    WrongPassword123
    Input Text    id=addBirthdayBox    ${BIRTHDAY}
    Select From List By Label    id=addGenderDropdown    ${GENDER}
    Select From List By Label    id=addARoleDropdown    ${ROLE}
    Click Element    id=addProfileImageButton
    Choose File    name=picture    C:\\Users\\DarkK\\Downloads\\admin.png
    Click Element    id=confirmaddAdminButton

    # ตรวจสอบว่ามีการแจ้งเตือนรหัสผ่านไม่ตรงกัน
    Page Should Contain    Passwords do not match
    Click Element    id=okButton
    Close Browser
