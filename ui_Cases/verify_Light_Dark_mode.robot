*** Settings ***
Resource    ../ui_Cases/settings.robot
Resource    ../ui_Cases/variables.robot
Resource    ../ui_Cases/keywords.robot

*** Keywords ***
Switch Light / Dark mode
    [Arguments]    ${browser}
    Browser    ${URL}     ${browser}
    Click Element  css:.header__vaulting-container > .theme-switcher-ui > .theme-switcher
    ${current_mode_body}=     Get Element Attribute  css:.fonts-loaded  class
    Log To Console    ${current_mode_body}
    ${expected_mode}=    Get New Mode    ${current_mode_body}
    Click Element  css:.header__vaulting-container > .theme-switcher-ui > .theme-switcher
    ${actual_mode_body}=   Get Element Attribute  css:.fonts-loaded  class
    ${actual_mode}=   Get Current Mode  ${actual_mode_body}
    Should Be Equal As Strings    ${actual_mode}    ${expected_mode}
    Close Browser

*** Keywords ***
Get New Mode
    [Arguments]  ${current_mode}
    ${contains_dark_mode}=  Evaluate  "dark-mode" in """${current_mode}"""
    ${new_mode}=  Run Keyword If  ${contains_dark_mode}  Set Variable  light-mode  ELSE  Set Variable  dark-mode
    [Return]  ${new_mode}

*** Keywords ***
Get Current Mode
    [Arguments]  ${current_mode}
    ${contains_dark_mode}=  Evaluate  "dark-mode" in """${current_mode}"""
    ${new_mode}=  Run Keyword If  ${contains_dark_mode}  Set Variable  dark-mode  ELSE  Set Variable  light-mode
    [Return]  ${new_mode}


*** Test Cases ***
Test in Chrome
    Switch Light / Dark mode    chrome

Test in Firefox
    Switch Light / Dark mode    firefox

