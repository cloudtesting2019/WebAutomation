*** Settings ***
Library  ExtendedSelenium2Library
Library  ../Library/ReadLocators.py

*** Keywords ***
User Verify Link on the page
    [Arguments]   ${EMRLink}
    page should contain link  xpath=${EMRLink}
