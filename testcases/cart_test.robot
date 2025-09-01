*** Settings ***
Resource   ../resources/resources.robot
Resource   ../keywords/login_keywords.robot
Resource   ../keywords/cart_keywords.robot
Resource    ../pages/cart_pages.robot
Resource    ../variables/common_variables.robot
Resource    ../pages/login_pages.robot
*** Test Cases ***
Add and remove product of Cart
    Open SwagLabs
    Login To SwagLabs    ${VALID_USER}    ${VALID_PASS}
    Sleep    1s
    Add Product To Cart
    Sleep    2s
    Page Should Contain Element    class=cart_item
    Remove Product From Cart
    Sleep    1s
    Page Should Not Contain Element    class=cart_item
    Close SwagLabs

