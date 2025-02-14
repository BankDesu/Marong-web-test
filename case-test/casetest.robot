

*** Settings ***
Resource    resources.robot

*** Test Cases ***

Change Waiting Case To InProgress Case With Detail    
    [Documentation]     เปลี่ยนสถานะ Case เป็น "กำลังดำเนินการ" โดยใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${INPROGRESS_BUTTON} 
    Click Button    ${INPROGRESS_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_INPROGRESS_BOX}     เปลี่ยนสถานะเป็นกำลังดำเนินการ
    Click Button    ${SUBMIT_INPROGRESS_BUTTON}
    Sleep    1s
    #เช็ค id ว่า status เปลี่ยนแล้วจริงๆ
    Case Page Should Be Open
    Close Browser

Change Waiting Case To InProgress Case Without Detail    
    [Documentation]     เปลี่ยนสถานะ Case เป็น "กำลังดำเนินการ" โดยไม่ใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${INPROGRESS_BUTTON} 
    Click Button    ${INPROGRESS_BUTTON}
    Sleep    1s
    Click Button    ${SUBMIT_INPROGRESS_BUTTON}
    Sleep    1s
    Page Should Contain    'Detail' are required when changing status to In progress!
    Close Browser

Revoke Change Waiting Case To InProgress Case    
    [Documentation]     ยกเลิกการเปลี่ยนสถานะเป็น "กำลังดำเนินการ" ของ Waiting Case
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${INPROGRESS_BUTTON} 
    Click Button    ${INPROGRESS_BUTTON}
    Sleep    1s
    Click Button    ${REVOKE_INPROGRESS_BUTTON}
    Sleep    1s
    Waiting Case Should Be Open
    Close Browser

Cancel Waiting Case With Detail    #ผ่าน
    [Documentation]    ยกเลิก Case สถานะเปลี่ยนเป็น "ยกเลิก" โดยใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_CANCEL_BOX}    ยกเลิก
    Click Button    ${SUBMIT_CANCEL_BUTTON}
    Sleep    1s
    Case Page Should Be Open
    Close Browser

Cancel Waiting Case Without Detail    
    [Documentation]    ยกเลิก Case สถานะเปลี่ยนเป็น "ยกเลิก" โดยไม่ใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s 
    Click Button    ${SUBMIT_CANCEL_BUTTON}
    Sleep    1s
    Page Should Contain    'Detail' is required when cancelling the case!
    Close Browser

Revoke Cancel Waiting Case     
    [Documentation]    ยกเลิกการเปลี่ยนสถานะเป็น "ยกเลิก" ของ Waiting Case
    Open And Login And Go To Case Page 
    Open Waiting Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s
    Click Button    ${REVOKE_CANCEL_BUTTON}
    Sleep    1s
    Waiting Case Should Be Open
    Close Browser

Change InProgress Case To Done Case With Detail And Picture    
    [Documentation]     เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" โดยใส่ข้อมูลและใส่รูป
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_DONE_BOX}     เปลี่ยนสถานะเป็นเสร็จสิ้น
    Choose File    ${PICTURE_DONE_BOX}    C:\\Users\\Guy\\Documents\\code\\SE\\testpic.webp
    Sleep    5s
    Click Button    ${SUBMIT_DONE_BUTTON}
    Sleep    1s
    Case Page Should Be Open
    Close Browser

Change InProgress Case To Done Case Without Detail, With Picture    
    [Documentation]     เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" โดยไม่ใส่ข้อมูล แต่ใส่รูป
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Choose File    ${PICTURE_DONE_BOX}    C:\\Users\\Guy\\Documents\\code\\SE\\testpic.webp
    Click Button    ${SUBMIT_DONE_BUTTON}
    Sleep    1s
    Page Should Contain    Both 'detail' and 'picture' are required when changing status to Done!
    Close Browser

Change InProgress Case To Done Case With Detail, Without Picture    
    [Documentation]     เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" โดยใส่ข้อมูล แต่ไม่ใส่รูป
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_DONE_BOX}     เปลี่ยนสถานะเป็นเสร็จสิ้น    
    Click Button    ${SUBMIT_DONE_BUTTON}
    Sleep    1s
    Page Should Contain    Both 'detail' and 'picture' are required when changing status to Done!
    Close Browser

Change InProgress Case To Done Case Without Detail And Without Picture    
    [Documentation]     เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" โดยไม่ใส่ข้อมูลและไม่ใส่รูป
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Click Button    ${SUBMIT_DONE_BUTTON}
    Sleep    1s
    Page Should Contain    Both 'detail' and 'picture' are required when changing status to Done!
    Close Browser

Revoke Change InProgress Case To Done Case    
    [Documentation]     ยกเลิกการเปลี่ยนสถานะเป็น "เสร็จสิ้น" ของ InProgress Case
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${DONE_BUTTON}
    Click Button    ${DONE_BUTTON}
    Sleep    1s
    Click Button    ${REVOKE_DONE_BUTTON}
    Sleep    1s
    InProgress Case Should Be Open
    Close Browser

Cancel InProgress Case With Detail    #ผ่าน
    [Documentation]    ยกเลิก Case สถานะเปลี่ยนเป็น "ยกเลิก" โดยใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s
    Input Text    ${DETAIL_CANCEL_BOX}    ยกเลิก
    Click Button    ${SUBMIT_CANCEL_BUTTON}
    Sleep    1s
    Case Page Should Be Open
    Close Browser

Cancel InProgress Case Without Detail    
    [Documentation]    ยกเลิก Case สถานะเปลี่ยนเป็น "ยกเลิก" โดยไม่ใส่ข้อมูล
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s 
    Click Button    ${SUBMIT_CANCEL_BUTTON}
    Sleep    1s
    Page Should Contain    'Detail' is required when cancelling the case!
    Close Browser

Revoke Cancel InProgress Case     
    [Documentation]    ยกเลิกการเปลี่ยนสถานะเป็น "ยกเลิก" ขแง InProgress Case
    Open And Login And Go To Case Page 
    Open InProgress Case            
    Page Should Contain Element    ${CANCEL_BUTTON} 
    Click Button    ${CANCEL_BUTTON}
    Sleep    1s
    Click Button    ${REVOKE_CANCEL_BUTTON}
    Sleep    1s
    InProgress Case Should Be Open
    Close Browser
    
Cannot Done Cancel Case    #ผ่าน
    [Documentation]    เปลี่ยนสถานะ Case เป็น "เสร็จสิ้น" → ไม่สามารถเปลี่ยนแปลง
    Open And Login And Go To Case Page 
    Open Cancel Case 
    Page Should Not Contain Element    ${CASE_CONTROL}
    Page Should Not Contain Element    ${DONE_BUTTON} 
    Close Browser

Cannot Cancel Done Case    #ผ่าน
    [Documentation]    กดยกเลิก Case ที่เสร็จสิ้นแล้ว → ไม่สามารถเปลี่ยนแปลง
    Open And Login And Go To Case Page 
    Open Done Case
    Page Should Not Contain Element    ${CASE_CONTROL}
    Page Should Not Contain Element   ${CANCEL_BUTTON}
    Close Browser

# Search    #Input       
#     [Documentation]    หา Case ID โดยใส่อินพุตหา ID / Category / Status
#     Log To Console    Input keyword : 
#     ${key_word}    Evaluate    input("")
#     Open And Login And Go To Case Page 
#     Search    ${key_word}
#     Should Contain CASE DATA    ${key_word}
#     Close Browser

Search Case Data By Random ID    #Random    #ผ่าน
    [Documentation]    ค้นหา Case ID ด้วยเลขที่สุ่มและตรวจสอบว่าแสดงข้อมูลที่ถูกต้อง
    ${key_word}    Evaluate    random.randint(1, 4) 
    Log To Console    Input keyword : ${key_word}
    
    Open And Login And Go To Case Page 
    Search    ${key_word} 
    Should Contain CASE DATA    ${key_word}  
    Close Browser

Use Filter Road    #ผ่าน
    [Documentation]    ใช้ Filter หา Road Damage
    Open And Login And Go To Case Page 
    Open Filter 
    Filter Road 
    Close Browser

Use Filter Sidewalk    #ผ่าน
    [Documentation]    ใช้ Filter หา Damaged Sidewalk
    Open And Login And Go To Case Page 
    Open Filter 
    Filter Sidewalk 
    Close Browser

Use Filter Overpass    #ผ่าน
    [Documentation]    ใช้ Filter หา Overpass Damage
    Open And Login And Go To Case Page 
    Open Filter 
    Filter Overpass
    Close Browser

Use Filter Wire    #ผ่าน
    [Documentation]    ใช้ Filter หา Wire Damage
    Open And Login And Go To Case Page 
    Open Filter 
    Filter Wire
    Close Browser

Check All Case Data    #ผ่าน
    [Documentation]    ตรวจสอบว่า Case แสดงครบ
    Open And Login And Go To Case Page 
    Sleep   1s

    ${elements} =    Get WebElements    ${ID}
    
    ${num_elements} =    Get Length    ${elements}
    
    Should Be Equal As Numbers    ${num_elements}    4
    
    FOR    ${element}    IN    @{elements}
        ${id_text} =    Get Text    ${element}
        Log To Console    ID : ${id_text}
    END
    
    Close Browser

