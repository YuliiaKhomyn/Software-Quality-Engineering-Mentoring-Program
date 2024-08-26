*** Keywords ***
Browser
    [Arguments]   ${URL}   ${BROWSER}  ${BROWSER_WIDTH}=1920   ${BROWSER_HEIGHT}=1080
    Open Browser  ${URL}  ${BROWSER}
    Set Window Size  ${BROWSER_WIDTH}   ${BROWSER_HEIGHT}


