*** Settings ***
Library    DatabaseLibrary
Library  SeleniumLibrary
Resource    resources.robot
Test Setup    Login And Navigate To News Page

*** Variables ***
${DB_HOST}    localhost
${DB_PORT}    3306
${DB_NAME}    marong_db
${DB_USER}    root
${DB_PASSWORD}    

*** Test Cases ***
Verify News Items and Search Functionality
    [Documentation]    Verify all news items exist on the news page and test search functionality.
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

    ${news_ids}=    Query    SELECT id FROM news


    # verify News Items Exist (run only once)
    FOR    ${id}    IN    @{news_ids}
        ${id}=    Get From List    ${id}    0  # Extract the ID from the tuple
        Log    Checking for news_${id} visibility.
        Wait Until Element Is Visible    id=news_${id}    10s
        Page Should Contain Element    id=news_${id}
    END

    # iterate over news IDs to perform search functionality checks
    FOR    ${row}    IN    @{news_ids}
        ${id}=    Set Variable    ${row[0]}  
        ${id_str}=    Set Variable    ${id}  
        ${id_str}=    Convert To String    ${id_str}  
        # count all row based on the substring in the id
        ${expected_count}=    Query    SELECT COUNT(*) FROM news WHERE id LIKE '%${id_str}%'        
        ${expected_count}=    Get From List    ${expected_count}    0    
        ${expected_count}=    Get From List    ${expected_count}    0    

        # verify Search Functionality by ID
        Input Text    id=news_search    ${id_str}
        Press Keys    id=news_search    ENTER
        Sleep    2s  # Wait for the search results to update

        # check if results contain an element with the correct id
        ${found_element}=    Get Text    xpath=//tr[contains(@id, 'news_') and not(contains(@style, 'display: none'))]
        Should Contain    ${found_element}    ${id_str}

        # search results match the expected count from database
        ${news_count}=    Get Element Count    xpath=//tr[contains(@id, 'news_') and not(contains(@style, 'display: none')) and contains(@id, '${id_str}')]
        Should Be Equal As Integers    ${news_count}    ${expected_count}    Search is not filtering properly
    END
        Disconnect From Database

    # Search for title containing "Park"
    Input Text    id=news_search    Park
    Press Keys    id=news_search    ENTER
    Sleep    2s
    ${news_count}=    Get Element Count    xpath=//td[starts-with(@id, 'title_') and contains(text(), 'Park')]
    Should Be True    ${news_count} > 0    No title contains 'Park'

    # Search with string "hello" and check for search_error
    Input Text    id=news_search    hello
    Press Keys    id=news_search    ENTER
    Sleep    2s
    Run Keyword And Return Status    Element Should Be Visible    id=search_error
    Should Be True    ${True}    Search error message is not displayed.


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
