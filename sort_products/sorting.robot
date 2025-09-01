*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../variables/common_variables.robot
Resource    ../keywords/login_keywords.robot
Resource    ../resources/resources.robot
Resource    ../keywords/sort_variables.robot
Test Setup        Setup SwagLabs
Test Teardown     Teardown SwagLabs

*** Test Cases ***
Sort Products By Name A to Z
    [Documentation]    Verify that products are sorted alphabetically from A to Z
    Select From List By Label    ${SORT_DROPDOWN}    Name (A to Z)
    Wait Until Element Is Visible    xpath=//div[contains(@class,'inventory_item_name')]    timeout=10s
    ${product_names}=    Get WebElements    xpath=//div[@class='inventory_item_name']
    ${names}=    Create List
    FOR    ${element}    IN    @{product_names}
        ${text}=    Get Text    ${element}
        Append To List    ${names}    ${text}
    END
    ${sorted_names}=    Copy List    ${names}
    Sort List    ${sorted_names}
    Log    Actual Product Names: ${names}
    Log    Expected Sorted Names: ${sorted_names}
    Lists Should Be Equal    ${names}    ${sorted_names}

Sort Products By Price Low to High
    [Documentation]    Verify that products are sorted by price from low to high
    Select From List By Value    ${SORT_DROPDOWN}    lohi
    Sleep    1s
    ${product_prices}=    Get WebElements    xpath=//div[@class='inventory_item_price']
    ${prices}=    Create List
    FOR    ${element}    IN    @{product_prices}
        ${text}=    Get Text    ${element}
        ${price}=    Convert To Number    ${text.replace('$', '')}
        Append To List    ${prices}    ${price}
    END
    ${sorted_prices}=    Copy List    ${prices}
    Sort List    ${sorted_prices}
    Log    Actual Prices: ${prices}
    Log    Expected Sorted Prices: ${sorted_prices}
    Lists Should Be Equal    ${prices}    ${sorted_prices}


