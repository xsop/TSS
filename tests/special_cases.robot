*** Settings ***
Library           SeleniumLibrary
Resource         common.resource

*** Test Cases ***

Try to add empty todo item
    Open Browser    ${URL}    Chrome    
    Add Todo Item    ${EMPTY}
    Clear Element Text    ${INPUT}
    Should Have No Todo Items

Try to add todo item with only spaces
    Add Todo Item    ${SPACE}
    Clear Element Text    ${INPUT}
    Should Have No Todo Items

Try JS injection
    Add Todo Item    <script>alert('XSS')</script>
    Clear Element Text    ${INPUT}
    ${alert_present}=    Run Keyword And Return Status    Execute JavaScript    return window.alert
    Should Be True    ${alert_present}    Alert should not be present

[Teardown] 
    Close Browser