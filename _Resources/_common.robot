*** Settings ***
Library    SeleniumLibrary
Library    ../venv/lib/site-packages/robot/libraries/String.py
Library    ../venv/lib/site-packages/robot/libraries/OperatingSystem.py
Variables    ../_PageObjects/locators.py

*** Variables ***
${BROWSER}    chrome
${KEEP_BROWSER}    f
${ENVI}    test
&{URL}    test=https://www.saucedemo.com/    stage=https://testautomationpractice.blogspot.com/


*** Keywords ***
Open New Browser
    [Arguments]    ${SiteUrl}    ${browser}    ${keep_browser}
    IF    "${browser}" == "chrome" and "${keep_browser}" == "t"
        Open Browser    ${SiteUrl}    ${browser}    options=add_experimental_option("detach", True)
        #Search this: selenium display on other screen when in dual screen
        Set Window Position    -1000    0

    ELSE
        Open Browser    ${SiteUrl}    ${browser}
    END
    Maximize Browser Window
