*** Settings ***
Library    SeleniumLibrary
Library    ../venv/lib/site-packages/robot/libraries/String.py

*** Keywords ***
Generate Random String Numbers
    [Documentation]    Generate a random numbers with length range 5-8. Then Concatenate it with the username argument.
    [Arguments]    ${username}

    ${rand_number}=    Generate Random String    5-8    [NUMBERS]
    ${rand_username}=    Catenate    SEPARATOR=    ${username}    ${rand_number}

    RETURN    ${rand_username}