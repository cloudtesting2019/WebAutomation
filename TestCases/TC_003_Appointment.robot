*** Settings ***
Library  ExtendedSelenium2Library
Library  ../Library/ReadLocators.py
Resource  ../Resources/CommonKewwords.robot
Resource  ../Validations/Verifications.robot
*** Variables ***
${URL}   http://dev.k8s.local/#/login
${MRNnumber}  9034
${TimeSlot}  17

*** Test Cases ***
Adding prescription in VIDA Plus application TC_001
    User Open Browser   ${URL}    Chrome
    User Login to Application   adela   123
    click element  xpath=//a[text()='Appointments']
    input text   xpath=//label[text()='Search Patient']/following-sibling::div/input   ${MRNnumber}
    click button  xpath=//span[text()='Split button!']/parent::button
    click element  xpath=//a[text()='MRN No']
    wait until page contains element  xpath=//div[@ng-reflect-klass='pat-appt-gen apt-male-']
    click element  xpath=//div[@ng-reflect-klass='pat-appt-gen apt-male-']
    #input text  xpath=//label[contains(text(),'Date:')]/following-sibling::input    ${d}
    select from list by label  xpath=//label[contains(text(),'Select Hospital')]/following-sibling::select    Rayyan
    select from list by label  xpath=//label[contains(text(),'Select Clinic')]/following-sibling::select    CARDIOLOGY
    select from list by label  xpath=//label[contains(text(),'Select Doctor')]/following-sibling::select    EHR-Doctor
    click button  xpath=//button[text()='View']
    wait until page contains element  xpath=//li[contains(text(),'Rayyan')]/parent::ul
    click element  xpath=//li[contains(text(),'Rayyan')]/parent::ul
    wait until page contains element  xpath=//td[text()='${TimeSlot}:00']/parent::tr//div[contains(text(),'EHR-Doctor')]
    click element  xpath=//td[text()='${TimeSlot}:00']/parent::tr//div[contains(text(),'EHR-Doctor')]
    select checkbox  xpath=//label[contains(text(),'M')][last()]/preceding-sibling::input
    sleep  5s
    click button  xpath=//button[text()='Book']
    select from list by label  xpath=//label[contains(text(),'Visit Type')]/following-sibling::select     Consultation
    click button  xpath=//button[text()='Confirm']
    sleep  3s
    execute javascript  $('html,body').scrollTop(0);
    #press key   xpath=//body    \\33
    #press key   xpath=//body    \\33
    #press key   xpath=//body    \\33
    click element  xpath=//a[text()='Resource Registration']
    click element  xpath=//a[text()='Appointments']
    input text   xpath=//label[text()='Search Patient']/following-sibling::div/input   ${MRNnumber}
    click button  xpath=//span[text()='Split button!']/parent::button
    click element  xpath=//a[text()='MRN No']
    wait until page contains element  xpath=//div[@ng-reflect-klass='pat-appt-gen apt-male-']
    click element  xpath=//div[@ng-reflect-klass='pat-appt-gen apt-male-']
    sleep  5s
    Run Keyword And Ignore Error  click element    xpath=//a[@title='Confirm']
    Run Keyword And Ignore Error  click element    xpath=//a[@title='Patient Arrived']
    sleep  5s
    ${x}=  get alert message
    sleep  5s
    log to console  ${x}
