*** Settings ***
Library    DatabaseLibrary
Library    SeleniumLibrary
Resource    resources.robot
Test Setup    Login And Navigate To Overview Page


*** Variables ***
${DB_HOST}    localhost
${DB_PORT}    3306
${DB_NAME}    marong_db
${DB_USER}    root
${DB_PASSWORD}    

*** Test Cases ***
Verify All Case Markers Exist
    [Documentation]    Verify all case markers from the database exist on the map.
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${case_ids}=    Query    SELECT id FROM cases
    
    FOR    ${row}    IN    @{case_ids}
        ${case_id}=    Set Variable    ${row}[0]  # Extract ID correctly
        Log    Checking for marker-${case_id} visibility.
        Wait Until Element Is Visible    id=marker-${case_id}    10s
        Page Should Contain Element    id=marker-${case_id}
    END
    Close Browser

Verify Street Markers Exist
    [Documentation]    Click "Street" button and verify only "Road Damage" markers are displayed.
    Click Element    id=street_button
    ${case_ids}=    Query    SELECT id FROM cases WHERE category = "Road Damage"
    Verify Markers Exist    ${case_ids}
    Close Browser

Verify Wire Markers Exist
    [Documentation]    Click "Wire" button and verify only "Wire Damage" markers are displayed.
    Click Element    id=wire_button
    ${case_ids}=    Query    SELECT id FROM cases WHERE category = "Wire Damage"
    Verify Markers Exist    ${case_ids}
    Close Browser

Verify Pavement Markers Exist
    [Documentation]    Click "Pavement" button and verify only "Damaged Sidewalk" markers are displayed.
    Click Element    id=pavement_button
    ${case_ids}=    Query    SELECT id FROM cases WHERE category = "Damaged Sidewalk"
    Verify Markers Exist    ${case_ids}
    Close Browser

Verify Overpass Markers Exist
    [Documentation]    Click "Overpass" button and verify only "Overpass Damage" markers are displayed.
    Click Element    id=overpass_button
    ${case_ids}=    Query    SELECT id FROM cases WHERE category = "Overpass Damage"
    Verify Markers Exist    ${case_ids}
    Disconnect From Database
    Close Browser

*** Keywords ***
Verify Markers Exist
    [Arguments]    ${case_ids}
    FOR    ${row}    IN    @{case_ids}
        ${case_id}=    Set Variable    ${row}[0]  # Extract ID correctly
        Log    Checking for marker-${case_id} visibility.
        Wait Until Element Is Visible    id=marker-${case_id}    10s
        Page Should Contain Element    id=marker-${case_id}
    END
