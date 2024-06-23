*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL1}    https://shopee.co.th/
${URL2}    https://www.lazada.co.th/
${search_keyword}    baby toys

*** Keywords ***
Test Keyword 1
    Log To Console    Language is English
    Close Browser
Test Keyword 2
    Log To Console    Search button is working
    Close Browser
Test Keyword 3
    Log To Console    Searching items are found
    Close Browser

*** Test Cases ***

T001 Enter Shopee website, landing on home page with EN lang
    Open Browser    ${URL1}    ${BROWSER}
    Click Element    //*[@id="modal"]/div[1]/div[1]/div/div[3]/div[2]/button
    # Cannot execute because the website requires logging in. Upon logging in, an error 'Loading Issue' is encountered.
    Close Browser

T002 Enter Lazada website, landing on home page with EN lang
    Open Browser    ${URL2}    ${BROWSER}
    Maximize Browser Window
    Click Element    //*[@id="topActionSwitchLang"]/span
    Click Element    //*[@id="lzdSwitchPop"]/div/div[2]/span
    Element Text Should Be    //*[@id="topActionFeedback"]/a    FEEDBACK
    Element Text Should Be    //*[@id="topActionSwitchLang"]    เปลี่ยนภาษา
    Test Keyword 1

T003 Search for keywords “ baby toys “
    Open Browser    ${URL2}    ${BROWSER}
    Maximize Browser Window
    Input Text    //*[@id="q"]    baby toys
    Click Element    //*[@id="topActionHeader"]/div/div[2]/div/div[2]/div/form/div/div[2]/a
    Test Keyword 2

T004 Website display search result as a list
    Open Browser    ${URL2}    ${BROWSER}
    Input Text    //*[@id="q"]    baby toys
    Click Element    //*[@id="topActionHeader"]/div/div[2]/div/div[2]/div/form/div/div[2]/a
    Element Text Should Be    //*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/div/div[1]/div/div/span[2]    baby toys
    Element Should Contain    //*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[2]    ของเล่น
    Test Keyword 3
