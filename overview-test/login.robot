*** Settings ***
Resource    resources.robot

*** Test Cases ***
Login Successfully
    [Documentation]    ทดสอบการ Login ด้วยข้อมูลที่ถูกต้อง
    Open Browser To Login Page
    Login     msaidmin@gmail.com      hashed_password_2
    Wait Until Location Is    ${OVERVIEW_URL}    5s  # Wait until URL matches the overview page
    Overview Page Should Be Open
    sleep   2s
    Close Browser


Unauthorized Access To Overview Page
    [Documentation]    ทดสอบการเข้าถึงหน้า Overview โดยไม่ได้ล็อกอิน
    Open Browser To Overview Page Without Login
    Login Page Should Be Open
    Close Browser