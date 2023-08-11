*** Settings ***
Library    SeleniumLibrary
Resource    ../_Resources/login_keywords.robot
Resource    ../_Resources/_common.robot
Library    DataDriver    ../../TestData/login_data_csv.csv
Test Template    Input valid credentials


*** Test Cases ***
Success Login using ${username} and ${password}
    [Tags]    regression
    [Documentation]    Ticket-1234

*** Keywords ***
Input valid credentials
    [Arguments]    ${username}    ${password}
    Open New Browser    ${URL.${ENVI}}    ${BROWSER}    ${KEEP_BROWSER}
    Enter Username    ${username}
    Enter New Password    ${password}
    Click Sign In Button
    Login is Success
    Sample String Interpolation



