*** Settings ***
Library           SeleniumLibrary
Resource         common.resource

*** Test Cases *** 

Add 5 todos
    Open Browser    ${URL}    Chrome
    FOR    ${i}    IN RANGE    5
        Add Todo Item    Todo Item ${i}
    END
    Should Have Todo Items    5

Mark all as complete
    Click Element    ${TOGGLE_ALL}
    ${completed}=    Get Todo Item Count    //todo-item[@completed]
    Should Be Equal As Numbers    ${completed}    5

Unmark all
    Click Element    ${TOGGLE_ALL}
    ${active}=    Get Todo Item Count    //todo-item[not(@completed)]
    Should Be Equal As Numbers    ${active}    5

[Teardown]
    Close Browser