*** Settings ***
Library    JSONLibrary
Resource   ../resources/resources.robot
Resource   ../keywords/login_keywords.robot
Resource    ../pages/login_pages.robot
Resource    ../variables/common_variables.robot
Suite Setup       Open SwagLabs
Suite Teardown    Close Browser

*** Test Cases ***
Loop Through Invalid Login Tests
    ${test_data}=    Read Login Test Data From JSON    ${JSON_PATH}
    FOR    ${case}    IN    @{test_data}
        Login With Invalid Credentials    ${case['username']}    ${case['password']}    ${case['expected_error']}
        Sleep    1s
        Reload Page
    END





