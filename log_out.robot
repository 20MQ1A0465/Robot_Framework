*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Logout From Swag Labs
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Click Button    id:login-button
    Sleep    2s
    Click Element    id:react-burger-menu-btn
    Sleep    1s
    Click Element    id:logout_sidebar_link
    Sleep    2s
    Close Browser
