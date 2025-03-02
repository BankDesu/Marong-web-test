

*** Settings ***
Resource    resources.robot

*** Test Cases ***


Change Waiting Case To InProgress Case With Detail    #pass
    [Documentation]     เปลี่ยนสถานะ Case เป็น "กำลังดำเนินการ" โดยใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open Waiting Case               
    Page Should Contain Element    ${INPROGRESS_BUTTON} 

    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  

    Click Button    ${INPROGRESS_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_INPROGRESS_BOX}     เปลี่ยนสถานะเป็นกำลังดำเนินการ
    Click Button    ${SUBMIT_INPROGRESS_BUTTON}
    Sleep    1s
    Case Page Should Be Open

    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    InProgress  

    Close Browser

Change Waiting Case To InProgress Case Without Detail    #pass
    [Documentation]     เปลี่ยนสถานะ Case เป็น "กำลังดำเนินการ" โดยไม่ใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open Waiting Case         
    Page Should Contain Element    ${INPROGRESS_BUTTON}
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${INPROGRESS_BUTTON}
    Sleep    1s
    Click Button    ${SUBMIT_INPROGRESS_BUTTON}
    Sleep    1s
    Page Should Contain    'Detail' are required when changing status to In progress!

    Click Element    class=swal2-confirm
    Wait Until Element Is Visible    ${REVOKE_INPROGRESS_BUTTON}    3s
    Click Button    ${REVOKE_INPROGRESS_BUTTON}
    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Waiting 

    Close Browser

Revoke Change Waiting Case To InProgress Case    #pass
    [Documentation]     ยกเลิกการเปลี่ยนสถานะเป็น "กำลังดำเนินการ" ของ Waiting Case
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${INPROGRESS_BUTTON} 
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${INPROGRESS_BUTTON}
    Sleep    1s
    Click Button    ${REVOKE_INPROGRESS_BUTTON}
    Sleep    1s

    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Waiting 

    Close Browser

Cancel Waiting Case With Detail    #pass
    [Documentation]    ยกเลิก Case สถานะเปลี่ยนเป็น "ยกเลิก" โดยใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 

    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  

    Click Button    ${CANCEL_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_CANCEL_BOX}    ยกเลิก
    Click Button    ${SUBMIT_CANCEL_BUTTON}
    Sleep    1s
    Case Page Should Be Open

    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Cancel 

    Close Browser

Cancel Waiting Case Without Detail    #pass
    [Documentation]    ยกเลิก Case สถานะเปลี่ยนเป็น "ยกเลิก" โดยไม่ใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s 
    Click Button    ${SUBMIT_CANCEL_BUTTON}
    Sleep    1s
    Page Should Contain    'Detail' is required when cancelling the case!

    Click Element    class=swal2-confirm
    Wait Until Element Is Visible    ${REVOKE_CANCEL_BUTTON}   3s
    Click Button    ${REVOKE_CANCEL_BUTTON}
    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Waiting 

    Close Browser

Revoke Cancel Waiting Case     #pass
    [Documentation]    ยกเลิกการเปลี่ยนสถานะเป็น "ยกเลิก" ของ Waiting Case
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s
    Click Button    ${REVOKE_CANCEL_BUTTON}
    Sleep    1s
    Waiting Case Should Be Open

    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Waiting 

    Close Browser

Change InProgress Case To Done Case With Detail And Picture    #pass
    [Documentation]     เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" โดยใส่ข้อมูลและใส่รูป
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}

    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  

    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_DONE_BOX}     เปลี่ยนสถานะเป็นเสร็จสิ้น
    Choose File    ${PICTURE_DONE_BOX}    C:\\Users\\Guy\\Documents\\code\\SE\\testpic.webp
    Sleep    5s
    Click Button    ${SUBMIT_DONE_BUTTON}
    Sleep    1s
    Case Page Should Be Open

    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Done 

    Close Browser

Change InProgress Case To Done Case Without Detail, With Picture    #pass
    [Documentation]     เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" โดยไม่ใส่ข้อมูล แต่ใส่รูป
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Choose File    ${PICTURE_DONE_BOX}    C:\\Users\\Guy\\Documents\\code\\SE\\testpic.webp
    Click Button    ${SUBMIT_DONE_BUTTON}
    Sleep    1s
    Page Should Contain    Both 'detail' and 'picture' are required when changing status to Done!

    Click Element    class=swal2-confirm
    Wait Until Element Is Visible    ${REVOKE_DONE_BUTTON}    3s
    Click Button    ${REVOKE_DONE_BUTTON}
    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    InProgress

    Close Browser

Change InProgress Case To Done Case With Detail, Without Picture    #pass
    [Documentation]     เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" โดยใส่ข้อมูล แต่ไม่ใส่รูป
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_DONE_BOX}     เปลี่ยนสถานะเป็นเสร็จสิ้น    
    Click Button    ${SUBMIT_DONE_BUTTON}
    Sleep    1s
    Page Should Contain    Both 'detail' and 'picture' are required when changing status to Done!

    Click Element    class=swal2-confirm
    Wait Until Element Is Visible    ${REVOKE_DONE_BUTTON}    3s
    Click Button    ${REVOKE_DONE_BUTTON}
    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    InProgress

    Close Browser

Change InProgress Case To Done Case Without Detail And Without Picture    #pass
    [Documentation]     เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" โดยไม่ใส่ข้อมูลและไม่ใส่รูป
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Click Button    ${SUBMIT_DONE_BUTTON}
    Sleep    1s
    Page Should Contain    Both 'detail' and 'picture' are required when changing status to Done!

    Click Element    class=swal2-confirm
    Wait Until Element Is Visible    ${REVOKE_DONE_BUTTON}    3s
    Click Button    ${REVOKE_DONE_BUTTON}
    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    InProgress

    Close Browser

Revoke Change InProgress Case To Done Case    #pass
    [Documentation]     ยกเลิกการเปลี่ยนสถานะเป็น "เสร็จสิ้น" ของ InProgress Case
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Click Button    ${REVOKE_DONE_BUTTON}
    Sleep    1s
    InProgress Case Should Be Open

    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    InProgress

    Close Browser

Cancel InProgress Case With Detail    #pass
    [Documentation]    ยกเลิก Case สถานะเปลี่ยนเป็น "ยกเลิก" โดยใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 

    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  

    Click Button    ${CANCEL_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_CANCEL_BOX}    ยกเลิก
    Click Button    ${SUBMIT_CANCEL_BUTTON}
    Sleep    1s
    Case Page Should Be Open

    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Cancel

    Close Browser

Cancel InProgress Case Without Detail    #pass
    [Documentation]    ยกเลิก Case สถานะเปลี่ยนเป็น "ยกเลิก" โดยไม่ใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s 
    Click Button    ${SUBMIT_CANCEL_BUTTON}
    Sleep    1s
    Page Should Contain    'Detail' is required when cancelling the case!

    Click Element    class=swal2-confirm
    Wait Until Element Is Visible    ${REVOKE_CANCEL_BUTTON}    3s
    Click Button    ${REVOKE_CANCEL_BUTTON}
    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    InProgress

    Close Browser

Revoke Cancel InProgress Case     #pass
    [Documentation]    ยกเลิกการเปลี่ยนสถานะเป็น "ยกเลิก" ขแง InProgress Case
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s
    Click Button    ${REVOKE_CANCEL_BUTTON}
    Sleep    1s
    InProgress Case Should Be Open

    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    InProgress

    Close Browser
    
Cannot Done Cancel Case    #pass
    [Documentation]    เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" → ไม่สามารถเปลี่ยนแปลง
    Open And Login And Go To Case Page 
    Open Cancel Case 
    Page Should Not Contain Element    ${CASE_CONTROL}
    Page Should Not Contain Element    ${DONE_BUTTON} 
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Cancel 
    Close Browser

Cannot Cancel Done Case    #pass
    [Documentation]    กดยกเลิก Case ที่เสร็จสิ้นแล้ว → ไม่สามารถเปลี่ยนแปลง
    Open And Login And Go To Case Page 
    Open Done Case
    Page Should Not Contain Element    ${CASE_CONTROL}
    Page Should Not Contain Element   ${CANCEL_BUTTON}
    ${CASE_ID}    Get Text    id=caseID
    Log To Console    ID = ${CASE_ID}  
    Go Back To Case Page
    ${STATUS_XPATH}    Set Variable    //*[@id='caseId'][text()='${CASE_ID}']/following-sibling::*[@id='caseStatus']
    ${NEW_STATUS}    Get Text    xpath=${STATUS_XPATH}
    Log To Console    สถานะใหม่ของ ${CASE_ID} = ${NEW_STATUS}
    Should Be Equal    ${NEW_STATUS}    Done
    Close Browser

Search Case Data By Random ID    #Random    
    [Documentation]    ค้นหา Case ID ด้วยเลขที่สุ่มและตรวจสอบว่าแสดงข้อมูลที่ถูกต้อง
    ${key_word}    Evaluate    random.randint(1, 4) 
    Log To Console    Input keyword : ${key_word}
    
    Open And Login And Go To Case Page 
    Search    ${key_word} 
    Should Contain CASE DATA    ${key_word}  
    Close Browser

Use Filter Road    
    [Documentation]    ใช้ Filter หา Road Damage
    Open And Login And Go To Case Page 
    Open Filter 
    Filter Road 
    Close Browser

Use Filter Sidewalk    
    [Documentation]    ใช้ Filter หา Damaged Sidewalk
    Open And Login And Go To Case Page 
    Open Filter 
    Filter Sidewalk 
    Close Browser

Use Filter Overpass    
    [Documentation]    ใช้ Filter หา Overpass Damage
    Open And Login And Go To Case Page 
    Open Filter 
    Filter Overpass
    Close Browser

Use Filter Wire    
    [Documentation]    ใช้ Filter หา Wire Damage
    Open And Login And Go To Case Page 
    Open Filter 
    Filter Wire
    Close Browser

Check All Case Data    #pass
    [Documentation]    ตรวจสอบว่า Case แสดงครบ
    Open And Login And Go To Case Page 
    Sleep   1s

    ${elements} =    Get WebElements    ${ID}
    
    ${num_elements} =    Get Length    ${elements}
    
    Should Be Equal As Numbers    ${num_elements}    4
    
    Close Browser

