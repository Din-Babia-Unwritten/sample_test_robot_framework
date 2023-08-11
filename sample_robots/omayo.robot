*** Settings ***
Library    SeleniumLibrary
Library    ../venv/lib/site-packages/robot/libraries/Collections.py
Library    ../venv/lib/site-packages/robot/libraries/XML.py

*** Variables ***
${url}    https://omayo.blogspot.com/search?q=sdf

*** Test Cases ***
TestRadioButton
    Open Browser    ${url}    chrome    options=add_experimental_option("detach", True)
    Set Selenium Speed    1 seconds

    Maximize Browser Window
    Scroll Element Into View    xpath://div[@id="HTML33"]
    Select Radio Button    vehicle    Car
    Select Checkbox    xpath:(//input[@value="Pen"])[2]
    Select Checkbox    Laptop
    Select Checkbox    Bag

Test Drop Down 1
    Open Browser    ${url}    chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window
    Select From List By Value    SiteMap    def
Test Drop Down 2
    Open Browser    ${url}    chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window
    Select From List By Label    SiteMap    doc 2
Test Drop Down 3
    Open Browser    ${url}    chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window
    Select From List By Index    SiteMap    3

MultiSelect
    ${PageTitle}=    Launch Browser    ${url}    chrome
    Log To Console    ${PageTitle}
    ${CarsCount}=    SeleniumLibrary.Get Element Count    xpath://select[@id="multiselect1"]/option
    Log To Console    ${CarsCount}

    @{CarItems}    Create List

    FOR    ${i}    IN RANGE    1    ${CarsCount} + 1
        ${CarItem}=    get text    xpath:(//select[@id="multiselect1"]/option)[${i}]
        Log To Console    ${CarItem}
    END
    # RIGHT CLICK
   Open Context Menu    xpath://select[@id="multiselect1"]/option

Scrolling Down
    ${PageTitle}=    Launch Browser    ${url}    chrome
    Log To Console    ${PageTitle}
    sleep    2
    # Execute Javascript    window.scrollTo(0,1000)
    # Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    Scroll Element Into View    xpath://div[@id="HTML33"]
    sleep    2
    @{vehicles}=    Get WebElements    xpath://div[@id="HTML32"]/div/input
    FOR    ${vehicle}    IN    @{vehicles}
        ${value}=    Get Value    ${vehicle}
        Log To Console    ${value}
    END

ForLoop
    @{items}    Create List    Din    Laurence    Babia
    FOR    ${item}    IN    @{items}
        Log To Console    Name: ${item}
    END

TableInteract
    ${PageTitle}=    Launch Browser    ${url}    chrome
    Log To Console    ${PageTitle}
    @{headers}=    Get WebElements    xpath://table[@id="table1"]/thead/tr/th
    FOR    ${header}    IN    @{headers}
        ${header_text}=    Get Text    ${header}
        Log To Console    ${header_text}
    END
    Table Header Should Contain    xpath://table[@id="table1"]    Name
    # CHECK HEADERS
    Table Cell Should Contain    xpath://table[@id="table1"]    1    1    Name
    Table Cell Should Contain    xpath://table[@id="table1"]    1    2    Age
    Table Cell Should Contain    xpath://table[@id="table1"]    1    3    Place
