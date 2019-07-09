*** Settings ***
Library  ExtendedSelenium2Library
Library  ../Library/ReadLocators.py
Resource  ../Resources/CommonKewwords.robot
Resource  ../Validations/Verifications.robot
*** Variables ***
${URL}   http://dev.k8s.local/#/login
${EMRLink}   //a[text()='EMR']
${InPatient}  //dashboard-widget//h4[text()='In Patients']
${AddPrescription}  //a[@title='Add new prescription']
${Med1}   Amiodarone
${Med2}   BECOTIDE
${Med3}   Paracetamol
${Med4}   Quinapril
${Med5}   Letrozole



*** Test Cases ***
Adding prescription in VIDA Plus application TC_001_Reduce
    set selenium timeout   20s
    User Open Browser   ${URL}    Chrome
    User Login to Application   fahad   123
    wait until page contains element    ${EMRLink}
    User Clicks on a Element  ${InPatient}

    go to  http://ehr.dev.k8s.local/#/patient_profile/16321/21523/progress_note
    User Clicks on a Link   ${AddPrescription}
    click element  xpath=//button[contains(text(),'Close')]
    User Clicks on a Link   ${AddPrescription}
    input text  xpath=//ng-select[@formcontrolname='formularyItem']/div/div/div[2]/input  A
    click element  xpath=//span[contains(text(),'Allopurinol')]
    input text  xpath=//input[@formcontrolname='doseQuantity']   5
    select from list by label   xpath=//select[@formcontrolname='uomId']  KG
    select from list by label   xpath=//select[@formcontrolname='frequencyId']  TID
    select from list by label   xpath=//select[@formcontrolname='routeId']  Give
    input text  xpath=//input[@formcontrolname='noOfDays']  5
    select checkbox  xpath=//input[@formcontrolname='isTaperingOrder']
    select from list by label   xpath=//select[@formcontrolname='operation']    Reduce
    input text     xpath=//input[@formcontrolname='byValue']   2
    input text     xpath=//input[@formcontrolname='continuingDays']   1
    input text     xpath=//input[@formcontrolname='finalDoseMeasurement']   1
    input text     xpath=//input[@formcontrolname='afterDaysAmount']   4
    click button  xpath=//button[contains(text(),'Calculate Steps')]
    click button  xpath=//button[@type='submit']
    click button  xpath=//button[@type='button']
    wait until page contains element  xpath=//button[contains(text(),'Sign')]
    click button  xpath=//button[contains(text(),'Sign')]
    close browser


Adding prescription in VIDA Plus application TC_001_Increase
    set selenium timeout  20s
    User Open Browser   ${URL}    Chrome
    User Login to Application   fahad   123
    wait until page contains element    ${EMRLink}
    User Clicks on a Element  ${InPatient}
    go to  http://ehr.dev.k8s.local/#/patient_profile/16321/21523/progress_note

    User Clicks on a Link   ${AddPrescription}
    click element  xpath=//button[contains(text(),'Close')]
    User Clicks on a Link   ${AddPrescription}
    input text  xpath=//ng-select[@formcontrolname='formularyItem']/div/div/div[2]/input  a

    click element  xpath=//span[contains(text(),'${Med1}')]
    input text  xpath=//input[@formcontrolname='doseQuantity']   2
    select from list by label   xpath=//select[@formcontrolname='uomId']  KG
    select from list by label   xpath=//select[@formcontrolname='frequencyId']  TID
    select from list by label   xpath=//select[@formcontrolname='routeId']  Give
    input text  xpath=//input[@formcontrolname='noOfDays']  5
    select checkbox  xpath=//input[@formcontrolname='isTaperingOrder']
    select from list by label   xpath=//select[@formcontrolname='operation']    Increase
    input text     xpath=//input[@formcontrolname='byValue']   3
    input text     xpath=//input[@formcontrolname='continuingDays']   1
    input text     xpath=//input[@formcontrolname='finalDoseMeasurement']   1
    input text     xpath=//input[@formcontrolname='afterDaysAmount']   1
    click button  xpath=//button[contains(text(),'Calculate Steps')]
    click button  xpath=//button[@type='submit']
    click button  xpath=//button[@type='button']
    wait until page contains element  xpath=//button[contains(text(),'Sign')]
    click button  xpath=//button[contains(text(),'Sign')]
    close browser


Adding prescription in VIDA Plus application TC_002
    User Open Browser   ${URL}    Chrome
    User Login to Application   fahad   123
    wait until page contains element    ${EMRLink}

    go to  http://ehr.dev.k8s.local/#/patient_profile/16321/21523/progress_note

    User Clicks on a Link   ${AddPrescription}
    click element  xpath=//button[contains(text(),'Close')]
    User Clicks on a Link   ${AddPrescription}
    input text  xpath=//ng-select[@formcontrolname='formularyItem']/div/div/div[2]/input  b


    click element  xpath=//span[contains(text(),'${Med2}')]
    input text  xpath=//input[@formcontrolname='doseQuantity']   30
    select from list by label   xpath=//select[@formcontrolname='uomId']  TAB
    select from list by label   xpath=//select[@formcontrolname='frequencyId']  BID
    select from list by label   xpath=//select[@formcontrolname='routeId']  Oral
    input text  xpath=//input[@formcontrolname='noOfDays']  10
    select checkbox  xpath=//input[@formcontrolname='isStatRoutine']
    click button  xpath=//button[@type='submit']
    click button  xpath=//button[@type='button']
    wait until page contains element  xpath=//button[contains(text(),'Sign')]
    click button  xpath=//button[contains(text(),'Sign')]
    close browser

Adding prescription in VIDA Plus application TC_003
    User Open Browser   ${URL}    Chrome
    User Login to Application   fahad   123
    wait until page contains element    ${EMRLink}

    go to  http://ehr.dev.k8s.local/#/patient_profile/16321/21523/progress_note

    User Clicks on a Link   ${AddPrescription}
    click element  xpath=//button[contains(text(),'Close')]
    User Clicks on a Link   ${AddPrescription}
    input text  xpath=//ng-select[@formcontrolname='formularyItem']/div/div/div[2]/input  pa


    click element  xpath=//span[contains(text(),'${Med3}')]
    input text  xpath=//input[@formcontrolname='doseQuantity']   20
    select from list by label   xpath=//select[@formcontrolname='uomId']  MGS
    select from list by label   xpath=//select[@formcontrolname='frequencyId']  Q2H
    select from list by label   xpath=//select[@formcontrolname='routeId']  Intravenous
    input text  xpath=//input[@formcontrolname='noOfDays']  3
    select checkbox  xpath=//input[@formcontrolname='isStatRoutine']
    click button  xpath=//button[@type='submit']
    click button  xpath=//button[@type='button']
    wait until page contains element  xpath=//button[contains(text(),'Sign')]
    click button  xpath=//button[contains(text(),'Sign')]
    close browser

Adding prescription in VIDA Plus application TC_004
    User Open Browser   ${URL}    Chrome
    User Login to Application   fahad   123
    wait until page contains element    ${EMRLink}

    go to  http://ehr.dev.k8s.local/#/patient_profile/16321/21523/progress_note

    User Clicks on a Link   ${AddPrescription}
    click element  xpath=//button[contains(text(),'Close')]
    User Clicks on a Link   ${AddPrescription}
    input text  xpath=//ng-select[@formcontrolname='formularyItem']/div/div/div[2]/input  q

    click element  xpath=//span[contains(text(),'${Med4}')]
    input text  xpath=//input[@formcontrolname='doseQuantity']   50
    select from list by label   xpath=//select[@formcontrolname='uomId']  TAB
    select from list by label   xpath=//select[@formcontrolname='frequencyId']  BID
    select from list by label   xpath=//select[@formcontrolname='routeId']  Give
    input text  xpath=//input[@formcontrolname='noOfDays']  2
    select checkbox  xpath=//input[@formcontrolname='isStandingOrder']
    select from list by label   xpath=//select[@formcontrolname='ruleType']  free text
    input text   xpath=//input[@formcontrolname='ruleFreeText']  test data
    click button   xpath=//input[@formcontrolname='ruleFreeText']/parent::div/following-sibling::div/button
    click button  xpath=//button[@type='submit']
    click button  xpath=//button[@type='button']
    wait until page contains element  xpath=//button[contains(text(),'Sign')]
    click button  xpath=//button[contains(text(),'Sign')]
    close browser

Adding prescription in VIDA Plus application TC_005
    User Open Browser   ${URL}    Chrome
    User Login to Application   fahad   123
    wait until page contains element    ${EMRLink}

    go to  http://ehr.dev.k8s.local/#/patient_profile/16321/21523/progress_note

    User Clicks on a Link   ${AddPrescription}
    click element  xpath=//button[contains(text(),'Close')]
    User Clicks on a Link   ${AddPrescription}
    input text  xpath=//ng-select[@formcontrolname='formularyItem']/div/div/div[2]/input  let


    click element  xpath=//span[contains(text(),'${Med5}')]
    input text  xpath=//input[@formcontrolname='doseQuantity']   40
    select from list by label   xpath=//select[@formcontrolname='uomId']  ML
    select from list by label   xpath=//select[@formcontrolname='frequencyId']  TID
    select from list by label   xpath=//select[@formcontrolname='routeId']  Oral
    input text  xpath=//input[@formcontrolname='noOfDays']  4
    select checkbox  xpath=//input[@formcontrolname='isPRN']
    click button  xpath=//button[@type='submit']
    click button  xpath=//button[@type='button']
    wait until page contains element  xpath=//button[contains(text(),'Sign')]
    click button  xpath=//button[contains(text(),'Sign')]
    close browser

*** Keywords ***
Change Timeout
    set selenium timeout  100s
    wait until angular ready

