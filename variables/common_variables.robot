*** Variables ***
${BROWSER}        chrome
${URL}            https://www.saucedemo.com/
${JSON_PATH}    ${CURDIR}/../testdata/invalid_login_data.json
${json_path}    ${CURDIR}/../testdata/login_data.json
${VALID_USER}     standard_user
${VALID_PASS}     secret_sauce
${error_message_locator}    xpath=//h3[@data-test="error"]


