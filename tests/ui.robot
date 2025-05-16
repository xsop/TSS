*** Settings ***
Library           SeleniumLibrary
Resource         common.resource

*** Test Cases ***
Run UI Test Chrome
    Run UI Test    Chrome
Run UI Test Firefox
    Run UI Test    Firefox

*** Keywords ***
Run UI Test
    [Arguments]    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Horizontal Scroll
    [Teardown]    Close Browser

Horizontal Scroll
    Set Window Size    375    667
    ${scrollWidth}=    Execute JavaScript    return document.documentElement.scrollWidth;
    ${clientWidth}=    Execute JavaScript    return document.documentElement.clientWidth;
    Should Be True    ${scrollWidth} <= ${clientWidth}
    [Teardown]    Close Browser
