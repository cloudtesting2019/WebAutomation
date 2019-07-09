*** Settings ***
Library  ExtendedSelenium2Library
Library  ../Library/ReadLocators.py

*** Keywords ***
User Open Browser
    [Arguments]   ${ApplicationUrl}     ${BrowserName}
    open browser  ${ApplicationUrl}  ${BrowserName}
    maximize browser window

User Login to Application
    [Arguments]  ${uname}    ${pass}
    input text  xpath=//input[@formcontrolname='username']  ${uname}
    input text  xpath=//input[@formcontrolname='password']  ${pass}
    click button  xpath=//button[text()='Login']

User Clicks on a Element
    [Arguments]  ${element}
    click element  xpath=${element}

User Naviages to a New Page
    [Arguments]   ${PageURL}
    go to  ${PageURL}


User Clicks on a Link
    [Arguments]  ${link}
    click link  xpath=${link}

User Enter Text in Textbox
    [Arguments]  ${PageName}  ${ElementName}  ${Data}
    ${element}=  Get_Element_Locator  ${PageName}   ${ElementName}
    input text  xpath=${element}  ${Data}

User Clicks on a Button
    [Arguments]  ${PageName}  ${ElementName}
    ${Button}=  Get_Element_Locator  ${PageName}   ${ElementName}
    click button  xpath=${Button}

