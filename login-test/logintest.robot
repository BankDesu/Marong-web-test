*** Settings ***
Resource    resources.robot

*** Test Cases ***
Login Successfully    #ID:1
    [Documentation]    ทดสอบการ Login ด้วยข้อมูลที่ถูกต้อง
    Open Browser To Login Page
    Login     msaidmin@gmail.com      hashed_password_2
    Sleep    3s
    Overview Page Should Be Open
    Close Browser

Login With True Email But Wrong Password
    [Documentation]    ทดสอบ Login ด้วย Email ถูกต้อง แต่ Password ผิด
    Open Browser To Login Page
    Login    msaidmin@gmail.com    WrongPass123
    Sleep    3s
    Page Should Contain    Invalid gmail or password
    Sleep    1s
    Close Browser

Login With True Password But Wrong Email
    [Documentation]    ทดสอบ Login ด้วย Password ถูกต้อง แต่ Email ผิด
    Open Browser To Login Page
    Login    wrong@gmail.com    hashed_password_2
    Sleep    3s
    Page Should Contain    Invalid gmail or password
    Sleep    1s
    Close Browser

Login With Wrong Email And Wrong Password
    [Documentation]    ทดสอบ Login ด้วย Email และ Password ผิดทั้งคู่
    Open Browser To Login Page
    Login    wrong@gmail.com    WrongPass123
    Sleep    3s
    Page Should Contain    Invalid gmail or password
    Sleep    1s
    Close Browser

Login Without Inputting Gmail Without Password
    [Documentation]    ทดสอบ Login โดยกรอกแค่ gmail
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Gmail     msaidmin@gmail.com
    Click Button    ${LOGIN_BUTTON}
    Sleep    3s
    Page Should Contain    Please enter password
    Sleep    1s
    Close Browser

Login Without Inputting Password Without Gmail
    [Documentation]    ทดสอบ Login โดยกรอกแค่ password
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Password.     hashed_password_2
    Click Button    ${LOGIN_BUTTON}
    Sleep    3s
    Page Should Contain    Please enter gmail
    Sleep    1s
    Close Browser

Login Without Inputting Anything
    [Documentation]    ทดสอบ Login โดยไม่กรอกอะไรเลย
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Click Button    ${LOGIN_BUTTON}
    Sleep    3s
    Page Should Contain    Please enter gmail and password
    Sleep    1s
    Close Browser

