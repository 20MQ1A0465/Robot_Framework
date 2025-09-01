*** Settings ***
Library    JSONLibrary
Resource   ../resources/resources.robot
Resource   ../keywords/login_keywords.robot
Resource    ../pages/login_pages.robot
Resource    ../variables/common_variables.robot

*** Test Cases ***
Valid Login Test
    Open SwagLabs
    Login To SwagLabs   ${VALID_USER}   ${VALID_PASS}
    Element Should Be Visible    css=.inventory_list
    Close Browser









