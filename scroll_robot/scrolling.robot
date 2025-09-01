*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/common_variables.robot
Resource    ../keywords/login_keywords.robot
Resource   ../resources/resources.robot
Test Setup        Setup SwagLabs
Test Teardown     Teardown SwagLabs

*** Test Cases ***
Scroll To Top Using JavaScript
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    1s
    Page Should Contain Element    css:.app_logo
    Pause Between Tests

Scroll To Bottom Using JavaScript
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    1s
    Page Should Contain Element    xpath://div[@class='footer_copy']
    Pause Between Tests

Scroll To Middle Using JavaScript
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight / 2)
    Sleep    1s
    Page Should Contain Element    xpath://div[contains(@class,'inventory_item')][3]
    Pause Between Tests

Scroll To Bottom Item Using Object
    Scroll Element Into View    xpath:(//div[@class='inventory_item'])[last()]
    Sleep    1s
    Page Should Contain Element    xpath:(//div[@class='inventory_item'])[last()]
    Pause Between Tests

Scroll To Middle Item Using Object
    Scroll Element Into View    xpath:(//div[@class='inventory_item'])[3]
    Sleep    1s
    Page Should Contain Element    xpath:(//div[@class='inventory_item'])[3]
    Pause Between Tests

Scroll To Top Item Using Object
    Scroll Element Into View    xpath:(//div[@class='inventory_item'])[1]
    Sleep    1s
    Page Should Contain Element    xpath:(//div[@class='inventory_item'])[1]
