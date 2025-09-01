*** Keywords ***
Handle Change Password Popup
    Wait Until Element Is Visible    xpath=//div[contains(@class,'change-password-popup')]    timeout=5s
    Click Button    xpath=//button[text()='Cancel']    # or whatever closes the popup
