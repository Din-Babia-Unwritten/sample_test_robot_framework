*** Settings ***
Library    SeleniumLibrary
Resource    ../_Resources/login_keywords.robot
Resource    ../_Resources/_common.robot
Test Template    Invalid Login Scenario


*** Test Cases ***    username    password
# Login invalid Test
#     Open New Browser    ${URL.${ENVI}}    ${BROWSER}    ${KEEP_BROWSER}
#     Enter Random Username    DinBabia
#     Enter New Password    12345
#     Click Sign In Button

# Sample Test Case 001
#     Open New Browser    ${URL.${ENVI}}    ${BROWSER}    ${KEEP_BROWSER}
#     Enter Random Username    Hehehe
#     Enter New Password    12345
#     Click Sign In Button
Empty Username with Invalid Password    ${EMPTY}    random_password
    [Tags]    sanity
Invalid Username with Empty Password    random_username    ${EMPTY}
    [Tags]    sanity
Empty Username and Empty Password    ${EMPTY}    ${EMPTY}
    [Tags]    sanity
Invalid Username and Invalid Password    random_username    random_username
    [Tags]    sanity
Correct Username and Invalid Password    standard_user    random_username
    [Tags]    sanity
Invalid Username and Correct Password    random_username    secret_sauce
    [Tags]    sanity



*** Keywords ***
Invalid Login Scenario
    [Arguments]    ${username}    ${password}
    Open New Browser    ${URL.${ENVI}}    ${BROWSER}    ${KEEP_BROWSER}
    Enter Random Username    ${username}
    Enter New Password    ${password}
    Click Sign In Button
    Sleep    2
    IF    "${username}" == ""
        Login Error Message: Username is required
        Log To Console    Username is required
    ELSE IF    "${password}" == ""
        Login Error Message: Password is required
        Log To Console    Password is required
    ELSE
        Login Error Message: Username and Password are not matched
        Log To Console    Username and Password are not matched
    END
