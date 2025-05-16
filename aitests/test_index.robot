*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    file://${CURDIR}/../index.html

*** Test Cases ***
Adaugare Task
    Open Browser    ${URL}    Chrome
    Input Text    xpath=//main//input[@type="text"]    Test Task 1
    Press Keys    xpath=//main//input[@type="text"]    RETURN
    Wait Until Element Is Visible    xpath=//todo-item
    Element Should Contain    xpath=//todo-item//span    Test Task 1
    [Teardown]    Close Browser

Completare Task
    Open Browser    ${URL}    Chrome
    Input Text    xpath=//main//input[@type="text"]    Test Task 2
    Press Keys    xpath=//main//input[@type="text"]    RETURN
    Wait Until Element Is Visible    xpath=//todo-item
    Click Element    xpath=//todo-item//div[@id="checkbox"]
    Sleep    0.5
    Element Attribute Value Should Be    xpath=//todo-item    completed    true
    [Teardown]    Close Browser

Editare Task
    Open Browser    ${URL}    Chrome
    Input Text    xpath=//main//input[@type="text"]    Test Task 3
    Press Keys    xpath=//main//input[@type="text"]    RETURN
    Wait Until Element Is Visible    xpath=//todo-item
    Double Click Element    xpath=//todo-item//span
    Input Text    xpath=//todo-item//input[@id="input"]    Task Editat
    Press Keys    xpath=//todo-item//input[@id="input"]    RETURN
    Sleep    0.5
    Element Should Contain    xpath=//todo-item//span    Task Editat
    [Teardown]    Close Browser

Stergere Task
    Open Browser    ${URL}    Chrome
    Input Text    xpath=//main//input[@type="text"]    Test Task 4
    Press Keys    xpath=//main//input[@type="text"]    RETURN
    Wait Until Element Is Visible    xpath=//todo-item
    Mouse Over    xpath=//todo-item
    Click Element    xpath=//todo-item//button
    Sleep    0.5
    Element Should Not Be Visible    xpath=//todo-item
    [Teardown]    Close Browser

Clear Completed
    Open Browser    ${URL}    Chrome
    Input Text    xpath=//main//input[@type="text"]    Task 1
    Press Keys    xpath=//main//input[@type="text"]    RETURN
    Input Text    xpath=//main//input[@type="text"]    Task 2
    Press Keys    xpath=//main//input[@type="text"]    RETURN
    Wait Until Element Count Is    xpath=//todo-item    2
    Click Element    xpath=(//todo-item//div[@id="checkbox"])[1]
    Sleep    0.5
    Click Element    id=clear-button
    Sleep    0.5
    Element Should Contain    xpath=//todo-item//span    Task 2
    Element Should Not Contain    xpath=//todo-item//span    Task 1
    [Teardown]    Close Browser