*** Settings ***
Resource    resources.robot

*** Test Cases ***
Login With True Email But Wrong Password
    [Documentation]    ทดสอบ Login ด้วย Email ถูกต้อง แต่ Password ผิด
    Open Browser To Login Page
    Login    msaidmin@gmail.com    WrongPass123
    Can't Login
    Close Browser

Login With True Password But Wrong Email
    [Documentation]    ทดสอบ Login ด้วย Password ถูกต้อง แต่ Email ผิด
    Open Browser To Login Page
    Login    wrong@gmail.com    hashed_password_2
    Can't Login
    Close Browser

Login With Wrong Email And Wrong Password
    [Documentation]    ทดสอบ Login ด้วย Email และ Password ผิดทั้งคู่
    Open Browser To Login Page
    Login    wrong@gmail.com    WrongPass123
    Can't Login
    Close Browser

Login Without Inputting Anything
    [Documentation]    ทดสอบ Login โดยไม่กรอกอะไรเลย
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Click Button    ${LOGIN_BUTTON}
    Can't Login
    Close Browser
