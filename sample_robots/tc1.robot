*** Settings ***
library    SeleniumLibrary



*** Variables ***
${URL}    https://www.saucedemo.com/


*** Test Cases ***
LoginTest
    open browser    ${URL}    chrome    options=add_experimental_option("detach", True)
    LoginToApplication
    ${"burger_menu"}    Set Variable    id:react-burger-menu-btn
    Element Should Be Visible    ${"burger_menu"}
    Element Should Be Enabled    ${"burger_menu"}
    Click Button    ${"burger_menu"}
    ${"about_sidebar_link"}    Set Variable    id:about_sidebar_link
    Wait Until Element Is Visible    ${"about_sidebar_link"}
    Element Should Be Visible    ${"about_sidebar_link"}
    Element Should Be Enabled    ${"about_sidebar_link"}
    Click Link    ${"about_sidebar_link"}


*** Keywords ***
LoginToApplication
    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Click Button    id:login-button
