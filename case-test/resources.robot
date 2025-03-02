resourse

*** Settings ***
Library    SeleniumLibrary
Library  DatabaseLibrary

*** Variables ***
${DB_HOST}     localhost
${DB_PORT}     3306 
${DB_NAME}     my_database
${DB_USER}     my_user
${DB_PASSWORD} 

${SERVER}         localhost:3000
${BROWSER}        chrome
${DELAY}          0
${LOGIN_URL}             http://${SERVER}/
${OVERVIEW_URL}          http://${SERVER}/overview
${LOGIN_ERROR_URL}       http://${SERVER}/
${CASE_URL}              http://${SERVER}/case
${NEWS_URL}              http://${SERVER}/news
${NEWS_ADD_URL}          http://${SERVER}/news/addnews
${ALL_ADMIN_URL}        http://${SERVER}/admin
${ADMIN_PROFILE_URL}     http://${SERVER}/admin/adminprofile/
${ADMIN_EDIT_URL}        http://${SERVER}/admin/edit/
${ADMIN_ADD_URL}         http://${SERVER}/admin/add

# Login Locators
${LOGIN_GMAIL}       id=login_gmailBox
${LOGIN_PASSWORD}    id=login_passwordBox
${LOGIN_BUTTON}      id=login_button

# Case Locators
${ID}                id=caseId
${CATEGORY}            id=caseCategory
${DAMAGE}            id=caseDamageValue
${DATE_OPENED}         id=caseDateOpened
${STATUS}            id=caseStatus

#Search & Filter Locater
${SEARCH_BOX}        id=searchBox
${FILTER_BUTTON}       id=Filter btn
${CLOSE_FILTER_BUTTON}    id=CloseFilter btn
${SELECT_ROAD}        id=Road Damage
${SELECT_SIDEWALK}        id=Damaged Sidewalk
${SELECT_OVERPASS}        id=Overpass Damage
${SELECT_WIRE}        id=Wire Damage

# Case ID Locators
# ${CASE_ID}            id=caseID
${STATUS_LABEL}        id=caseStatusLabel
${INPROGRESS_BUTTON}    id=InProgress btn
${DONE_BUTTON}          id=Done btn
${CANCEL_BUTTON}        id=Cancel btn
${CASE_CONTROL}        id=caseControl

# Case Cancel Popup Locators
${SUBMIT_CANCEL_BUTTON}        id=SubmitCancel btn
${REVOKE_CANCEL_BUTTON}    id=RevokeCancel btn
${DETAIL_CANCEL_BOX}         id=CancelDetailBox

# Case InProgress Popup Locators
${SUBMIT_INPROGRESS_BUTTON}        id=SubmitInProgress btn
${REVOKE_INPROGRESS_BUTTON}    id=RevokeInProgress btn
${DETAIL_INPROGRESS_BOX}         id=InProgressDetailBox

# Case Done Popup Locators
${SUBMIT_DONE_BUTTON}        id=SubmitDone btn
${REVOKE_DONE_BUTTON}    id=RevokeDone btn
${DETAIL_DONE_BOX}         id=DoneDetailBox
${PICTURE_DONE_BOX}        id=DonePictureBox

*** Keywords ***
Open Browser To Login Page
    # ${options}=    Evaluate    selenium.webdriver.ChromeOptions()
    # Call Method    ${options}    add_argument    --headless
    # Open Browser    ${LOGIN_URL}    ${BROWSER}    options=${options}
    Open Browser    ${LOGIN_URL}    ${BROWSER}    
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be    ${LOGIN_URL}

Login
    [Arguments]    ${gmail}    ${password}
    Input Text    ${LOGIN_GMAIL}    ${gmail}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Overview Page Should Be Open
    Location Should Be    ${OVERVIEW_URL} 

Go To Case Page
    Go To    ${CASE_URL}

Case Page Should Be Open
    Location Should Be    ${CASE_URL}

Open And Login And Go To Case Page
    Open Browser To Login Page
    Login    msaidmin@gmail.com    hashed_password_2
    Sleep    1s
    Overview Page Should Be Open
    Go To Case Page
    Case Page Should Be Open

Open Case By Status    #loop เข้าตัวแรก
    [Arguments]    ${case_status}
    Sleep    2s
    Wait Until Element Is Visible    ${STATUS}    timeout=5s
    ${elements} =    Get WebElements    ${STATUS}
    FOR    ${element}    IN    @{elements}
        ${status_text} =    Get Text    ${element}
        Log To Console    ${status_text}
        IF    '${status_text}' == '${case_status}'
            Click Element    ${element}
            Sleep    2s
            Exit For Loop 
        END
    END
    Sleep    1s

Open Case By ID    #loop เข้าตัวแรก
    [Arguments]    ${case_ID}
    Sleep    2s
    Wait Until Element Is Visible    ${ID}    timeout=5s
    ${elements} =    Get WebElements    ${ID}
    FOR    ${element}    IN    @{elements}
        ${ID_text} =    Get Text    ${element}
        Log To Console    ${ID_text}
        IF    '${ID_text}' == '${case_ID}'
            Click Element    ${element}
            Sleep    2s
            Exit For Loop 
        END
    END
    Sleep    1s

Open Waiting Case
    Open Case By Status    Waiting
    Waiting Case Should Be Open

Waiting Case Should Be Open
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[@id='caseStatusLabel']    timeout=15s
    ${status} =    Get Text    xpath=//span[@id='caseStatusLabel']
    Log    ${status}
    Should Be Equal As Strings    ${status}    Waiting

Open InProgress Case
    Open Case By Status    InProgress
    InProgress Case Should Be Open

InProgress Case Should Be Open
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[@id='caseStatusLabel']    timeout=15s
    ${status} =    Get Text    xpath=//span[@id='caseStatusLabel']
    Should Be Equal As Strings    ${status}    InProgress

Open Done Case
    Open Case By Status    Done
    Done Case Should Be Open

Done Case Should Be Open
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[@id='caseStatusLabel']    timeout=15s
    ${status} =    Get Text    xpath=//span[@id='caseStatusLabel']
    Should Be Equal As Strings    ${status}    Done

Open Cancel Case
    Open Case By Status    Cancel
    Cancel Case Should Be Open

Cancel Case Should Be Open
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[@id='caseStatusLabel']    timeout=15s
    ${status} =    Get Text    xpath=//span[@id='caseStatusLabel']
    Should Be Equal As Strings    ${status}    Cancel

Search
    [Arguments]    ${key}
    Wait Until Element Is Visible    ${SEARCH_BOX}    timeout=3s
    Input Text    ${SEARCH_BOX}    ${key}

Should Contain CASE DATA
    [Arguments]    ${key_word}
    Sleep    2s
    Wait Until Element Is Visible    ${ID}    timeout=5s
    
    # ดึง WebElements ที่มี Case IDs
    ${elements} =    Get WebElements    ${ID}
    
    # ลูปผ่านทุกๆ element ที่มี Case ID
    FOR    ${element}    IN    @{elements}
        # ดึง Case ID
        ${caseId_text} =    Get Text    ${element}
        Log To Console    เจอ ID : ${caseId_text}

        # ดึงข้อมูล Category จากทุก element ที่มี Category
        ${category_elements} =    Get WebElements    ${CATEGORY}
        FOR    ${category_element}    IN    @{category_elements}
            ${case_category_text} =    Get Text    ${category_element}
            Log To Console    Category : ${case_category_text}
        END

        # ดึงข้อมูล Damage Value
        ${damage_elements} =    Get WebElements    ${DAMAGE}
        FOR    ${damage_element}    IN    @{damage_elements}
            ${case_damage_text} =    Get Text    ${damage_element}
            Log To Console    Damage value : ${case_damage_text}
        END

        # ดึงข้อมูล Date Opened
        ${date_elements} =    Get WebElements    ${DATE_OPENED}
        FOR    ${date_element}    IN    @{date_elements}
            ${case_date_text} =    Get Text    ${date_element}
            Log To Console    Date opened : ${case_date_text}
        END

        # ดึงข้อมูล Status
        ${status_elements} =    Get WebElements    ${STATUS}
        FOR    ${status_element}    IN    @{status_elements}
            ${case_status_text} =    Get Text    ${status_element}
            Log To Console    Status : ${case_status_text}
        END
    END
    Sleep    1s

Open Filter 
    Wait Until Element Is Visible    ${FILTER_BUTTON}    timeout=3s
    Click Button    ${FILTER_BUTTON}
    Sleep    1s

Filter Road    
    Wait Until Element Is Visible    ${SELECT_ROAD}    timeout=3s
    Click Element    ${SELECT_ROAD}
    Click Button    ${CLOSE_FILTER_BUTTON}
    Sleep    1s

    ${elements} =    Get WebElements    ${CATEGORY}
    FOR    ${element}    IN    @{elements}
        ${category_text} =    Get Text    ${element}
        Run Keyword If    '${category_text}' == 'Road Damage'    
        ...    Log To Console    ✅ พบ Road Damage!
    END
    Sleep    1s

Filter Sidewalk
    Wait Until Element Is Visible    ${SELECT_ROAD}    timeout=3s
    Click Element    ${SELECT_SIDEWALK}
    Click Button    ${CLOSE_FILTER_BUTTON}
    Sleep    1s

    ${elements} =    Get WebElements    ${CATEGORY}
    FOR    ${element}    IN    @{elements}
        ${category_text} =    Get Text    ${element}
        Run Keyword If    '${category_text}' == 'Damaged Sidewalk'    
        ...    Log To Console    ✅ พบ Damaged Sidewalk!
    END
    Sleep    1s

Filter Overpass
    Wait Until Element Is Visible    ${SELECT_OVERPASS}    timeout=3s
    Click Element    ${SELECT_OVERPASS}
    Click Button    ${CLOSE_FILTER_BUTTON}
    Sleep    1s

    ${elements} =    Get WebElements    ${CATEGORY}
    FOR    ${element}    IN    @{elements}
        ${category_text} =    Get Text    ${element}
        Run Keyword If    '${category_text}' == 'Overpass Damage'    
        ...    Log To Console    ✅ พบ Overpass Damage!
    END
    Sleep    1s

Filter Wire
    Wait Until Element Is Visible    ${SELECT_WIRE}    timeout=3s
    Click Element    ${SELECT_WIRE}
    Click Button    ${CLOSE_FILTER_BUTTON}
    Sleep    1s

    ${elements} =    Get WebElements    ${CATEGORY}
    FOR    ${element}    IN    @{elements}
        ${category_text} =    Get Text    ${element}
        Run Keyword If    '${category_text}' == 'Wire Damage'    
        ...    Log To Console    ✅ พบ Wire Damage!
    END
    Sleep    1s

Go Back To Case Page
    Go To Case Page
    Case Page Should Be Open
