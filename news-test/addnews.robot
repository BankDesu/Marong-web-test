*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Resource    resources.robot
Test Setup    Login And Navigate To News Page

*** Variables ***
${BASE_URL}    http://localhost:3000  
${TITLE}       testing1
${CONTENT}     content1
${LOCATION}    seacon

*** Test Cases ***
Test Add News Page     #ID:5
    [Documentation]  This test case will login, navigate to news page, click on the add news button, upload an image, fill form fields, and save the news.
    Click Add News Button
    Upload Image
    Fill Form
    Save News
    Verify Success Modal
    Close Browser



Test Add News Page with Missing Field
    [Documentation]  This test case will test adding news with missing form fields (leave fields blank) and verify if the error modal appears.
    Click Add News Button
    Upload Image
    Fill Form With Missing Data
    Save News
    Verify Error Modal
    Close Browser

Test Add News with Missing Title
    [Documentation]  This test case tests adding news without a title.
    Click Add News Button
    Upload Image
    Fill Form With Missing Title
    Save News
    Verify Error Modal
    Close Browser

Test Add News with Missing Location
    [Documentation]  This test case tests adding news without a location.
    Click Add News Button
    Upload Image
    Fill Form With Missing Location
    Save News
    Verify Error Modal
    Close Browser

Test Add News with Missing Content
    [Documentation]  This test case tests adding news without content.
    Click Add News Button
    Upload Image
    Fill Form With Missing Content
    Save News
    Verify Error Modal
    Close Browser

Test Add News with Missing Picture
    [Documentation]  This test case tests adding news without uploading a picture.
    Click Add News Button
    Fill Form
    Save News
    Verify Error Modal
    Close Browser



*** Keywords ***
Login And Navigate To News Page
    Open Browser To Login Page
    Login    msaidmin@gmail.com    hashed_password_2
    Wait Until Location Is    ${OVERVIEW_URL}    10s
    Go To    ${NEWS_URL}  # Navigate to News Page
    Wait Until Location Is    ${NEWS_URL}    10s
    Wait Until Element Is Visible    id=news_search    10s
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Navigate To News Page
    [Documentation]  This keyword navigates to the news page.
    Click Button    id=news_page_button
    Wait Until Element Is Visible    id=addnews_button    10s

Click Add News Button
    [Documentation]  This keyword clicks on the "Add News" button to navigate to the add news page.
    Click Element    id=addnews_button
    Wait Until Element Is Visible    id=addtitle_input    10s

Upload Image
    [Documentation]  This keyword clicks the upload button, uploads a PNG image, and then closes the upload modal.
    Wait Until Element Is Visible    id=uploadnews_button    10s  # Ensure the button is visible
    Wait Until Element Is Enabled    id=uploadnews_button    10s  # Ensure the button is clickable
    Click Element    id=uploadnews_button
    Wait Until Element Is Visible    id=choosefile_button    10s
    Choose File    id=choosefile_button    C:\\Users\\Guy\\Documents\\code\\SE\\testpic.webp
    Click Element    id=closeaddfile_button    # Close the file upload modal
    Wait Until Element Is not Visible    id=closeaddfile_button    10s  # Wait until the "close" button is visible




Fill Form
    [Documentation]  This keyword fills in the title, content, and location description.
    Input Text    id=addtitle_input    ${TITLE}
    Input Text    id=addcontent_input    ${CONTENT}
    Input Text    id=addlocation_input    ${LOCATION}
    Wait Until Element Is Visible    css=input[id="addlocation_input"]  5s  # Wait for the location input
    Set Location Text   ${LOCATION}



Fill Form With Missing Title
    [Documentation]  This keyword fills the form but leaves the title field blank.
    Input Text    id=addtitle_input    ""
    Input Text    id=addcontent_input    ${CONTENT}
    Input Text    id=addlocation_input    ${LOCATION}
    Wait Until Element Is Visible    css=input[id="addlocation_input"]  5s
    Set Location Text    ${LOCATION}

Fill Form With Missing Location
    [Documentation]  This keyword fills the form but leaves the location field blank.
    Input Text    id=addtitle_input    ${TITLE}
    Input Text    id=addcontent_input    ${CONTENT}
    Input Text    id=addlocation_input    ""
    Sleep    2s  # Allow UI time to process empty location

Fill Form With Missing Content
    [Documentation]  This keyword fills the form but leaves the content field blank.
    Input Text    id=addtitle_input    ${TITLE}
    Input Text    id=addcontent_input    ""
    Input Text    id=addlocation_input    ${LOCATION}
    Wait Until Element Is Visible    css=input[id="addlocation_input"]  5s
    Set Location Text    ${LOCATION}


Set Location Text
    [Documentation]  Set the location in the input and trigger the autocomplete.
    [Arguments]    ${location}
    Input Text    id=addlocation_input    ${location}
    Sleep    2s 
    Execute Javascript    return document.querySelector('#addlocation_input').dispatchEvent(new Event('input'))  # Trigger input event



Save News
    [Documentation]  This keyword clicks the save button.
    Click Button    id=saveaddnews_button
    sleep   1s

Verify Success Modal
    [Documentation]  This keyword checks if the modal status is present on the page.
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    id=modal_success_message
    Should Be True    ${is_visible}






Fill Form With Missing Data
    [Documentation]  This keyword leaves the form fields blank.
    Input Text    id=addtitle_input    ""
    Input Text    id=addcontent_input    ""
    Input Text    id=addlocation_input    ""
    Wait Until Element Is Visible    css=input[id="addlocation_input"]  5s  # Wait for the location input
    Set Location Text   ${LOCATION}    # You can optionally leave this out too


Verify Error Modal
    [Documentation]  This keyword checks if the error modal is visible with the id "modal_error_message".
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    id=modal_error_message
    Should Be True    ${is_visible}