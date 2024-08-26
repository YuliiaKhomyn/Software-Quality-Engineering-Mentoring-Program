*** Settings ***
Resource    ../ui_Cases/settings.robot
Resource    ../ui_Cases/variables.robot

*** Keywords ***
Open Browser And Verify Title
    [Arguments]    ${browser}
    Open Browser    ${URL}    ${browser}
    Title Should Be    EPAM | Software Engineering & Product Development Services
    Close Browser

*** Test Cases ***
Test in Chrome
    Open Browser And Verify Title    chrome

Test in Firefox
    Open Browser And Verify Title    firefox