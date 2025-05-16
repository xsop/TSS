*** Settings ***
Library           SeleniumLibrary
Resource          common.resource

*** Test Cases ***
Basic Regression Chrome
    Run Regression Test    Chrome

Basic Regression Firefox
    Run Regression Test    Firefox

*** Keywords ***
Run Regression Test
    [Arguments]    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Todos
    Page Should Contain    todos
    Page Should Contain Element    ${INPUT}
    Add a todo item
    Filter: Active
    Filter: Completed
    Back to all and delete the item
    Check that footer, filters, and count are not visible
    [Teardown]    Close Browser

Add a todo item
    Add Todo Item    New Todo Item
    Page Should Contain Element    //todo-item[@description='New Todo Item']
    Should Have Todo Items    1
    Element Text Should Be    ${COUNT}    1 item left

Filter: Active
    Click Element    ${ACTIVE_FILTER}
    ${active_count}=    Get Todo Item Count    //todo-item[not(@completed)]
    Should Be Equal As Numbers    ${active_count}    1

Filter: Completed
    Click Element    ${COMPLETED_FILTER}
    ${completed_count}=    Get Todo Item Count    //todo-item[@completed]
    Should Be Equal As Numbers    ${completed_count}    0

Back to all and delete the item
    Click Element    ${ALL_FILTER}
    Should Have Todo Items    1
    Delete Todo Item By Description    New Todo Item
    Should Have No Todo Items

Check that footer, filters, and count are not visible
    Element Should Not Be Visible    ${FOOTER}
    Element Should Not Be Visible    ${FILTERS}
    Element Should Not Be Visible    ${COUNT}