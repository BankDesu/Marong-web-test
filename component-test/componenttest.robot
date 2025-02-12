*** Settings ***
Resource    resources.robot

*** Test Cases ***

Open Overview Page    #ผ่าน
    [Documentation]    เปิด Overview page และเช็คสี Sidebar
    Open And Login
    Go To Overview Page
    Close Browser

Open Case Page    #ผ่าน
    [Documentation]    เปิด Case page และเช็คสี Sidebar
    Open And Login
    Go To Case Page
    Close Browser

Open News Page    #ผ่าน
    [Documentation]    เปิด News page และเช็คสี Sidebar
    Open And Login
    Go To News Page
    Close Browser

Open Admin Page    #ผ่าน
    [Documentation]    เปิด Admin page และเช็คสี Sidebar
    Open And Login
    Go To Admin Page
    Close Browser