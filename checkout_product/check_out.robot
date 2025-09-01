*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../variables/common_variables.robot
Resource    ../keywords/login_keywords.robot
Resource    ../resources/resources.robot
Resource    ../keywords/cart_keywords.robot
Test Setup        Setup SwagLabs
Test Teardown     Teardown SwagLabs
*** Test Cases ***
Checkout Product on SwagLabs
    Open SwagLabs
    Login To SwagLabs    ${VALID_USER}    ${VALID_PASS}
    Run Keyword And Ignore Error    Handle Change Password Popup
    Add Product To Cart
    Wait Until Page Contains Element    class=cart_item    timeout=10s
    Page Should Contain Element        class=cart_item
    Wait Until Page Contains Element   class=shopping_cart_badge    timeout=10s
    Click Element                      id=shopping_cart_container
    Wait Until Page Contains Element   id=checkout    timeout=10s
    Click Button                       id=checkout
    Wait Until Page Contains           Checkout: Your Information    timeout=20s
    Sleep                              2s
    Capture Page Screenshot
    Wait Until Element Is Visible      xpath=//input[@data-test='firstName']    timeout=40s
    Input Text                         xpath=//input[@data-test='firstName']    Navya
    Input Text                         xpath=//input[@data-test='lastName']     Lingam
    Input Text                         xpath=//input[@data-test='postalCode']   560001
    Click Button                       id=continue
    Wait Until Element Is Visible      id=finish    timeout=10s
    Click Button                       id=finish
    Page Should Contain                Thank you for your order!
    Close Browser

