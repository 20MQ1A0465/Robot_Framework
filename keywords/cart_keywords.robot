*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/cart_pages.robot

*** Keywords ***
Add Product To Cart
    Click Button    xpath=//button[@data-test='add-to-cart-sauce-labs-backpack']
    Click Element   ${CART_ICON}
    Page Should Contain Element    ${CART_ITEM}

Remove Product From Cart
    Click Element   ${CART_ICON}
    Click Button    ${REMOVE_BUTTON}
    Page Should Not Contain Element    ${CART_ITEM}

