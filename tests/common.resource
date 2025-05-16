*** Variables ***
${URL}            file:///C:/Users/Admin/Desktop/TSS/TSS/index.html
${INPUT}          //input[@placeholder='What needs to be done?']
${TODO_ITEM}      //todo-item
${COUNT}          //div[@id='count']
${FOOTER}         //div[@id='footer']
${FILTERS}        //div[@id='filters']
${CLEAR_BTN}      //button[@id='clear-button']
${TOGGLE_ALL}     //div[@id='toggle-all']
${ALL_FILTER}     //a[@href='#/all']
${ACTIVE_FILTER}  //a[@href='#/active']
${COMPLETED_FILTER}  //a[@href='#/completed']

*** Keywords ***
Add Todo Item
    [Arguments]    ${text}
    Input Text    ${INPUT}    ${text}
    Press Keys    ${INPUT}    RETURN

Delete Todo Item By Description
    [Arguments]    ${desc}
    Execute JavaScript    document.querySelector('todo-item[description="${desc}"]').remove()
    Sleep    0.5

Get Todo Item Count
    [Arguments]    ${xpath}=${TODO_ITEM}
    ${count}=    Get Element Count    ${xpath}
    RETURN    ${count}

Should Have No Todo Items
    ${item_count}=    Get Todo Item Count
    Should Be Equal As Numbers    ${item_count}    0

Should Have Todo Items
    [Arguments]    ${expected}
    ${item_count}=    Get Todo Item Count
    Should Be Equal As Numbers    ${item_count}    ${expected}
