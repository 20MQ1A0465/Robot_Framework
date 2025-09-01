*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Scroll Products Manually
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Click Button    id:login-button
    Sleep    2s
    Execute JavaScript    window.scrollBy(0, 300)
    Sleep    1s
    Execute JavaScript    window.scrollBy(0, 300)
    Sleep    1s
    Close Browser
