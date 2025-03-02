*** Settings ***
Resource    resources.robot

*** Test Cases ***
Test Responsive Login Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Login Page ที่ 1280x800
    Open Browser To Login Page
    Set Window Size    1280    800
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Overview Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Overview Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To Overview Page
    Overview Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Case Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Case Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To Case Page
    Case Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Case ID=1 Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Case ID=1 Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To Case Page
    Case Page Should Be Open
    Open Case By ID    1
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive News Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ News Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To News Page
    News Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Edit News ID=1 Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Edit News ID=1 Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To News Page
    News Page Should Be Open
    Click Element    //*[@id="editnews_button"]/img
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Add News Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Add News Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To News Page
    News Page Should Be Open
    Click Element    //*[@id="addnews_button"]/span
    Sleep    2s
    Capture Page Screenshot
    Close Browser


Test Responsive Admin Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Admin Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To Admin Page
    Admin Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Admin Profile ID=1 Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Admin Profile ID=1 Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To Admin Page
    Admin Page Should Be Open
    Click Element    //*[@id="admincard-id-1"]
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Add Admin Page at 1280x800
    [Documentation]    ตรวจสอบ Responsive ของ Add Admin Page ที่ 1280x800
    Open And Login
    Set Window Size    1280    800
    Go To Admin Page
    Admin Page Should Be Open
    Click Element    //*[@id="add_adminButton"]/span
    Sleep    2s
    Capture Page Screenshot
    Close Browser



Test Responsive Login Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Login Page ที่ 1536x864
    Open Browser To Login Page
    Set Window Size    1536    864
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Overview Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Overview Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To Overview Page
    Overview Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Case Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Case Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To Case Page
    Case Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Case ID=1 Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Case ID=1 Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To Case Page
    Case Page Should Be Open
    Open Case By ID    1
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive News Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ News Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To News Page
    News Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Edit News ID=1 Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Edit News ID=1 Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To News Page
    News Page Should Be Open
    Click Element    //*[@id="editnews_button"]/img
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Add News Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Add News Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To News Page
    News Page Should Be Open
    Click Element    //*[@id="addnews_button"]/span
    Sleep    2s
    Capture Page Screenshot
    Close Browser


Test Responsive Admin Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Admin Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To Admin Page
    Admin Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Admin Profile ID=1 Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Admin Profile ID=1 Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To Admin Page
    Admin Page Should Be Open
    Click Element    //*[@id="admincard-id-1"]
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Add Admin Page at 1536x864
    [Documentation]    ตรวจสอบ Responsive ของ Add Admin Page ที่ 1536x864
    Open And Login
    Set Window Size    1536    864
    Go To Admin Page
    Admin Page Should Be Open
    Click Element    //*[@id="add_adminButton"]/span
    Sleep    2s
    Capture Page Screenshot
    Close Browser



Test Responsive Login Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Login Page ที่ 1920x1080
    Open Browser To Login Page
    Set Window Size    1920    1080
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Overview Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Overview Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To Overview Page
    Overview Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Case Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Case Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To Case Page
    Case Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Case ID=1 Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Case ID=1 Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To Case Page
    Case Page Should Be Open
    Open Case By ID    1
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive News Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ News Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To News Page
    News Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Edit News ID=1 Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Edit News ID=1 Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To News Page
    News Page Should Be Open
    Click Element    //*[@id="editnews_button"]/img
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Add News Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Add News Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To News Page
    News Page Should Be Open
    Click Element    //*[@id="addnews_button"]/span
    Sleep    2s
    Capture Page Screenshot
    Close Browser


Test Responsive Admin Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Admin Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To Admin Page
    Admin Page Should Be Open
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Admin Profile ID=1 Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Admin Profile ID=1 Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To Admin Page
    Admin Page Should Be Open
    Click Element    //*[@id="admincard-id-1"]
    Sleep    2s
    Capture Page Screenshot
    Close Browser

Test Responsive Add Admin Page at 1920x1080
    [Documentation]    ตรวจสอบ Responsive ของ Add Admin Page ที่ 1920x1080
    Open And Login
    Set Window Size    1920    1080
    Go To Admin Page
    Admin Page Should Be Open
    Click Element    //*[@id="add_adminButton"]/span
    Sleep    2s
    Capture Page Screenshot
    Close Browser
