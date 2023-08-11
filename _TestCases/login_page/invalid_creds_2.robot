*** Settings ***
Library    SeleniumLibrary
Resource    ../_Resources/login_keywords.robot
Resource    ../_Resources/_common.robot
Suite Setup    Open New Browser    ${URL.${ENVI}}    ${BROWSER}    ${KEEP_BROWSER}
Test Template    Invalid Login Scenario


*** Test Cases ***    username    password
Empty Username with Invalid Password    ${EMPTY}    random_password
    [Tags]    sanity

Invalid Username with Empty Password    random_user    ${EMPTY}
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
    Enter Random Username    ${username}
    Enter New Password    ${password}
    Sleep    2
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
    Go To    ${URL.${ENVI}}
