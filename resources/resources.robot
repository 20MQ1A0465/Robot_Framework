*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/common_variables.robot

*** Keywords ***
Open SwagLabs
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close SwagLabs
    Close Browser
