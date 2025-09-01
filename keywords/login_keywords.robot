*** Settings ***
Library    JSONLibrary
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    BuiltIn
Library    String
Resource   ../pages/login_pages.robot

*** Keywords ***
Setup SwagLabs
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Login To SwagLabs    ${VALID_USER}    ${VALID_PASS}

Teardown SwagLabs
    Close Browser
Login To SwagLabs
    [Arguments]    ${username}    ${password}
    Input Text     id=user-name    ${username}
    Input Text     id=password     ${password}
    Click Button   id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
Verify Login Error
    [Arguments]    ${expected_error}
    Wait Until Page Contains    ${expected_error}
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=5s
    ${actual_error}=    Get Text    ${ERROR_MESSAGE}
    Should Be Equal    ${actual_error}    ${expected_error}
    Capture Page Screenshot

Read Login Test Data From JSON
   [Arguments]    ${json_path}
    ${json}=    Get File    ${json_path}
    ${data}=    Evaluate    __import__('json').loads("""${json}""")
    RETURN    ${data}

Login With Invalid Credentials
    [Arguments]    ${username}    ${password}    ${expected_error}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button  ${LOGIN_BUTTON}
    ${error}=    Get Text    ${error_message_locator}
    Log    Actual error: ${error}
    Log    Expected error: ${expected_error}
    Should Be Equal    ${error}    ${expected_error}

Verify Successful Login
    Element Should Be Visible    css=.inventory_list
    Wait Until Page Contains Element    xpath=//div[@class='inventory_list']    timeout=10s
    Page Should Contain Element    xpath=//div[@class='inventory_list']

Pause Between Tests
    Sleep    3s
