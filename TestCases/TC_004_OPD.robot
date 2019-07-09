*** Settings ***
Library  ExtendedSelenium2Library
Library  ../Library/ReadLocators.py
Resource  ../Resources/CommonKewwords.robot
Resource  ../Validations/Verifications.robot

*** Variables ***
${URL}   http://dev.k8s.local/#/login
${EMRLink}   //a[text()='EMR']
${MRN}    9037
${AddPrescription}  //a[@title='Add new prescription']


*** Test Cases ***
Adding prescription in VIDA Plus application TC_004
    User Open Browser   ${URL}    Chrome
    User Login to Application   fahad   123
    #wait until page contains element  ${EMRLink}
    sleep  15s
    #input text   xpath=//input[@ref='eColumnFloatingFilter']    ${MRN}
    go to  http://ehr.dev.k8s.local/#/patient_profile/1518848/${MRN}/22221/new_episode/wizard

    # Enter history of Present Illness
    sleep  7s
    click button   xpath=//button[contains(text(),'Add New')]

    # Check element there if not try again
    : FOR  ${i}  IN RANGE  1  4
    \    ${Result}=  Run Keyword And Return Status   Page Should Contain Element  xpath=//label[contains(text(),'Cardiovascular diseases')]/preceding-sibling::input[@type='checkbox']
    \    log to console   ${Result}
    \    Run Keyword If  '${Result}' == 'FAIL'   click element  xpath=//div[@class='modal-content']//input[@value='Close']
    \    Run Keyword If  '${Result}' == 'FAIL'   click button   xpath=//button[contains(text(),'Add New')]

    select checkbox   xpath=//label[contains(text(),'Cardiovascular diseases')]/preceding-sibling::input[@type='checkbox']
    input text   xpath=//label[contains(text(),'Cardiovascular diseases')]/parent::div/parent::td/following-sibling::td/input  TestData
    select checkbox   xpath=//label[contains(text(),'Diabetes')]/preceding-sibling::input[@type='checkbox']
    input text   xpath=//label[contains(text(),'Diabetes')]/parent::div/parent::td/following-sibling::td/input  TestData

    #  Enter Social History
    click link   xpath=//span[contains(text(),'Social')]/parent::a
    select checkbox   xpath=//label[contains(text(),'Travel')]/preceding-sibling::input[@type='checkbox']
    input text   xpath=//label[contains(text(),'Travel')]/parent::div/parent::td/following-sibling::td/input  TestData
    select checkbox   xpath=//label[contains(text(),'Diet')]/preceding-sibling::input[@type='checkbox']
    input text   xpath=//label[contains(text(),'Diet')]/parent::div/parent::td/following-sibling::td/input  TestData

    #  Enter Hospitalization History
    #click link   xpath=//span[contains(text(),'Hospitalizations')]/parent::a
    #click element  xpath=//label[contains(text(),'Medical')]/preceding-sibling::input[@type='checkbox']
    #input text   xpath=//label[contains(text(),'Medical')]/parent::div/parent::td/following-sibling::td/input  TestData
    #click element   xpath=//label[contains(text(),'Surgical')]/preceding-sibling::input[@type='checkbox']
    #input text   xpath=//label[contains(text(),'Surgical')]/parent::div/parent::td/following-sibling::td/input  TestData

    #  Enter Medical History
    click link   xpath=//span[contains(text(),'Medical')]/parent::a
    select checkbox   xpath=//label[contains(text(),'Diphtheria')]/preceding-sibling::input[@type='checkbox']
    input text   xpath=//label[contains(text(),'Diphtheria')]/parent::div/parent::td/following-sibling::td/input  TestData
    select checkbox   xpath=//label[contains(text(),'Measles')]/preceding-sibling::input[@type='checkbox']
    input text   xpath=//label[contains(text(),'Measles')]/parent::div/parent::td/following-sibling::td/input  TestData

    click element  xpath=//div[@class='modal-content']//input[@type='submit']
    sleep  10s

    # Enter Allrgies
    #click button   xpath=//div[contains(text(),'Allergies')]//button[contains(text(),'Add New')]
    #click element  xpath=//div[contains(text(),'Beef-derived Products')]/preceding-sibling::div/span/span/span[2]
    #click link  xpath=//a[contains(text(),'Add Reactions')]
    #click element  xpath=//label[contains(text(),'Rash')]/preceding-sibling::input
    #click element  xpath=//label[contains(text(),'Rash')]/parent::div/parent::td/following-sibling::td//label/span[text()='Mild']/following-sibling::input
    #click element  xpath=//input[@type='button' and @value='Close']

    # Proceed to Object
    click button   xpath=//button[contains(text(),'Proceed to Objective')]
    execute javascript  $('html,body').scrollTop(0);

    #  Add Vital Sign
    sleep  5s
    click element   xpath=//div[contains(text(),'Vital Sign')]/parent::div//a[contains(text(),'Add New')]
    wait until page contains element   xpath=//input[@id='vital-weight_']
    input text  xpath=//input[@id='vital-weight_']   20
    input text  xpath=//input[@id='vital-height_']   173
    input text  xpath=//input[@id='vital-tempreture_']   37
    input text  xpath=//input[@id='vital-SA02_']   100
    input text  xpath=//input[@id='vital-FI02_']   90
    input text  xpath=//input[@id='vital-systolic_']   120
    input text  xpath=//input[@id='vital-diastolic_']   80
    sleep  10s
    click button  xpath=//div[contains(text(),'Add Vital')]/parent::div/following-sibling::div[1]/button

     # Proceed to Asssesment
    click button   xpath=//button[contains(text(),'Proceed to Assessment')]
    execute javascript  $('html,body').scrollTop(0);

    # Add Problem List
    #click element   xpath=//div[contains(text(),'Vital Sign')]/parent::div//a[contains(text(),'Add New')]

    # Proceed to Plan
    click button   xpath=//button[contains(text(),'Proceed to Plan')]
    execute javascript  $('html,body').scrollTop(0);
    sleep  5s
    User Clicks on a Link   ${AddPrescription}
    input text  xpath=//input[@role='combobox']  A
    click element  xpath=//span[contains(text(),'Allopurinol')]
    input text  xpath=//input[@formcontrolname='doseQuantity']   100
    select from list by label   xpath=//select[@formcontrolname='uomId']  KG
    select from list by label   xpath=//select[@formcontrolname='frequencyId']  TID
    select from list by label   xpath=//select[@formcontrolname='routeId']  Give
    input text  xpath=//input[@formcontrolname='noOfDays']  5
     select checkbox  xpath=//input[@formcontrolname='isStatRoutine']
    click button  xpath=//button[@type='submit']
    click button  xpath=//button[@type='button']
    click button  xpath=//button[contains(text(),'Sign')]



