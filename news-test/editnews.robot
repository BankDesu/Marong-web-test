*** Settings ***
Library    SeleniumLibrary
Resource    resources.robot
Test Setup    Login And Navigate To News Page

*** Variables ***
${EDIT_SUFFIX}       edited
${SPECIAL_CHAR}    ‎  # U+200E (Left-to-Right Mark)


*** Test Cases ***
Test Edit News Successfully
    [Documentation]  edits an existing news item, verifies success.
    Click Edit News Button
    Upload Image
    Fill Edit Form
    Save News
    Verify Success Modal
    Close Browser


Test Edit News With Empty Title
    [Documentation]  Attempts to edit a news item with an empty title field and verifies an error.
    Click Edit News Button
    Clear Edit Title Field
    Save News
    Verify Error Modal
    Close Browser

Test Edit News With Empty Location
    [Documentation]  Attempts to edit a news item with an empty location field and verifies an error.
    Click Edit News Button
    Clear Edit Location Field
    Save News
    Verify Error Modal
    Close Browser

Test Edit News With Empty Content
    [Documentation]  Attempts to edit a news item with an empty content field and verifies an error.
    Click Edit News Button
    Clear Edit Content Field
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
    
Click Edit News Button
    [Documentation]  Clicks the edit button to open the edit news form.
    Wait Until Element Is Visible    id=editnews_button    10s
    Click Element    id=editnews_button
    Wait Until Element Is Visible    id=edittitle_input    10s

Fill Edit Form
    [Documentation]  Appends "edited" to the existing title and content without changing the location.
    ${current_title}=    Get Value    id=edittitle_input
    ${current_content}=  Get Value    id=editcontent_input

    ${new_title}=    Catenate    SEPARATOR=    ${current_title}    ${EDIT_SUFFIX}
    ${new_content}=  Catenate    SEPARATOR=    ${current_content}    ${EDIT_SUFFIX}

    Input Text    id=edittitle_input    ${new_title}
    Input Text    id=editcontent_input    ${new_content}




Upload Image
    [Documentation]  This keyword clicks the upload button, uploads a PNG image, and then closes the upload modal.
    Wait Until Element Is Visible    id=edituploadnews_button    10s  
    Wait Until Element Is Enabled    id=edituploadnews_button    10s  
    Click Element    id=edituploadnews_button
    Wait Until Element Is Visible    id=choosefile_button    10s

    # Choose File    id=choosefile_button    C:\\Users\\acer\\Downloads\\green overpass marker.png
    Choose File    id=choosefile_button    C:\\Users\\acer\\Downloads\\aqua cry.png

    Click Element    id=closeeditfile_button    # Close the file upload modal
    Wait Until Element Is not Visible    id=closeeditfile_button    10s  # Wait until the "close" button is visible



Save News
    [Documentation]  This keyword clicks the save button.
    Click Button    id=saveeditnews_button
    sleep   1s


Verify Success Modal
    [Documentation]  This keyword checks if the modal status is present on the page.
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    id=modal_successedit_message
    Should Be True    ${is_visible}



Clear Edit Title Field
    [Documentation]  Ensures the title field is cleared properly by inserting a special invisible character.
    Wait Until Element Is Visible    id=edittitle_input    5s
    Clear Element Text    id=edittitle_input
    Input Text    id=edittitle_input    ${SPECIAL_CHAR}  
    Press Keys    id=edittitle_input    \t  

Clear Edit Location Field
    [Documentation]  Clears the location field before editing.
    Wait Until Element Is Visible    id=editlocation_input    5s
    Clear Element Text    id=editlocation_input
    Input Text    id=editlocation_input    ${SPECIAL_CHAR}  
    Press Keys    id=editlocation_input    \t  

Clear Edit Content Field
    [Documentation]  Clears the content field before editing.
    Wait Until Element Is Visible    id=editcontent_input    5s
    Clear Element Text    id=editcontent_input
    Input Text    id=editcontent_input    ${SPECIAL_CHAR}  
    Press Keys    id=editcontent_input    \t  

Verify Error Modal
    [Documentation]  Checks if the error modal is visible after attempting to save.
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    id=modal_erroredit_message
    Should Be True    ${is_visible}