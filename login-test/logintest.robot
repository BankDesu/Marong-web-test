*** Settings ***
Resource    ./resources.robot

*** Test Cases ***
Login Successfully
    [Documentation]    ทดสอบการ Login ด้วยข้อมูลที่ถูกต้อง
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Login    msaidmin@gmail.com    hashed_password_2
    Location Should Be    Welcome, Admin
    Close Browser

Login With True Email But Wrong Password
    [Documentation]    ทดสอบ Login ด้วย Email ถูกต้อง แต่ Password ผิด
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Login    msaidmin@gmail.com    WrongPass123
    Location Should Be    ${OVERVIEW_URL}
    Close Browser

Login With True Password But Wrong Email
    [Documentation]    ทดสอบ Login ด้วย Password ถูกต้อง แต่ Email ผิด
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Login    wrong@gmail.com    hashed_password_2
    Location Should Be    Invalid username or password
    Close Browser

Login With Wrong Email And Wrong Password
    [Documentation]    ทดสอบ Login ด้วย Email และ Password ผิดทั้งคู่
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Login    wrong@gmail.com    WrongPass123
    Page Should Contain    Invalid username or password
    Close Browser

Login Without Inputting Anything
    [Documentation]    ทดสอบ Login โดยไม่กรอกอะไรเลย
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain    Please enter email and password
    Close Browser
