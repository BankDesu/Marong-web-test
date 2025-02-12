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

    # ตรวจสอบว่ามีข้อมูลในแต่ละการ์ด
    Element Should Contain    id=admincard-id-1    John Doe
    Element Should Contain    id=admincard-id-1    Admin
    
    Element Should Contain    id=admincard-id-3    Master Admin
    Element Should Contain    id=admincard-id-3    master Admin
    
    Element Should Contain    id=admincard-id-15    Test1 Admin1
    Element Should Contain    id=admincard-id-15    master Admin
    
    Element Should Contain    id=admincard-id-21    Test Admin
    Element Should Contain    id=admincard-id-21    Admin
    
    Close Browser
