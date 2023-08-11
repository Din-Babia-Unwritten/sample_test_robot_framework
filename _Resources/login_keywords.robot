*** Settings ***
Library    SeleniumLibrary
Library    ../venv/lib/site-packages/robot/libraries/String.py
Variables    ../_PageObjects/locators.py
Resource    utils/string_format.robot
Resource    _common.robot


*** Keywords ***

Enter Username
    [Arguments]    ${username}

    Input Text    ${login_username_text_field}    ${username}

Enter Random Username
    [Documentation]    Ticket-001: <link_here>
    [Arguments]    ${username}

    IF    "${username}" == ""
        Log To Console    No Action. No Username Provided.
    ELSE
        ${rand_username}=    Generate Random String Numbers    ${username}
        Log To Console    Username: ${rand_username}
        Input Text    ${login_username_text_field}    ${rand_username}
    END

Enter New Password
    [Arguments]    ${password}
    Input Text    ${login_password_password_field}    ${password}

Click Sign In Button
    Click Button    ${login_submit_button}

Login Error Message: Username is required
    Page Should Contain    Username is required
Login Error Message: Password is required
    Page Should Contain    Password is required
Login Error Message: Username and Password are not matched
    Page Should Contain    Username and password do not match any user in this service

Login is Success
    ${inventory_url}=    Catenate    SEPARATOR=    ${URL.${ENVI}}    inventory.html
    Log To Console    ${inventory_url}
    Location Should Be    ${inventory_url}
    Element Should Be Visible    ${inventory_burger_menu}

Sample String Interpolation
    ${new_string}=    Format String    ${login_sample_interpolate}    hello=Din
    Log To Console    ${new_string}

