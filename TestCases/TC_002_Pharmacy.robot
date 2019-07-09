*** Settings ***
Library  ExtendedSelenium2Library
Resource  ../Resources/CommonKewwords.robot
Resource  ../Validations/Verifications.robot

*** Variables ***
${URL}   http://dev.k8s.local/#/login
${EMRLink}   //a[text()='EMR']
${IngredianteName}  Active_20
${brandName}  Brand_20
${inventoryCode}   11001036

*** Test Cases ***
Adding prescription in VIDA Plus application TC_001
    set selenium implicit wait   20s
    User Open Browser   ${URL}    Chrome
    User Login to Application   ayaan  123
    wait until angular ready

    # Add Ingredient
    wait until page contains element  xpath=//i[text()='note_add']
    mouse over   xpath=//i[text()='note_add']
    click element  xpath=//span[text()='Item Master']
    click element  xpath=//span[text()='Generic Formularies']
    click element  xpath=//a[text()='Active Ingredients']
    input text   xpath=//input[@formcontrolname='genericName']   ${IngredianteName}
    click button  xpath=//button[contains(text(),'Save')]

    # Add Brand Name
    mouse over   xpath=//i[text()='label']
    wait until element is visible  xpath=//span[text()='Brand']
    click element  xpath=//span[text()='Brand']
    input text   xpath=//input[@formcontrolname='brandName']   ${brandName}
    input text   xpath=//input[@formcontrolname='erpCode']   ${inventoryCode}
    input text   xpath=//input[@formcontrolname='vendorBarcode']   ${inventoryCode}
    input text   xpath=//input[@formcontrolname='supplierBarcode']   ${inventoryCode}

    click element  xpath=//*[@formcontrolname='vendorId']
    input text  xpath=//*[@formcontrolname='vendorId']//input  AL
    click element  xpath=//span[contains(text(),'AL NAGHI COMPANY')]

    click element  xpath=//*[@formcontrolname='manufacturerId']
    input text  xpath=//*[@formcontrolname='manufacturerId']//input  Om
    click element  xpath=//span[contains(text(),'Oman Pharmaceutical Products')]

    click element  xpath=//*[@formcontrolname='countryCode']
    input text  xpath=//*[@formcontrolname='countryCode']//input  Sa
    click element  xpath=//span[contains(text(),'Kingdom of Saudi Arabia')]

    click element  xpath=//*[@formcontrolname='categoryId']
    input text  xpath=//*[@formcontrolname='categoryId']//input  M
    click element  xpath=//span[contains(text(),'MEDICINE')]

    click element  xpath=//*[@formcontrolname='itemGroupId']
    input text  xpath=//*[@formcontrolname='itemGroupId']//input  A
    click element  xpath=//span[contains(text(),'ACCESSORIES')]

    click element  xpath=//*[@formcontrolname='itemSubGroupId']
    input text  xpath=//*[@formcontrolname='itemSubGroupId']//input  A
    click element  xpath=//span[contains(text(),'AAPRI')]

    click element  xpath=//*[@formcontrolname='prescriptionType']
    input text  xpath=//*[@formcontrolname='prescriptionType']//input  A
    click element  xpath=//span[contains(text(),'ALL')]

    click element  xpath=//*[@formcontrolname='UOMUnit']
    input text  xpath=//*[@formcontrolname='UOMUnit']//input  M
    click element  xpath=//span[contains(text(),'MGS')]

    click element  xpath=//*[@formcontrolname='secondaryUOMUnit']
    input text  xpath=//*[@formcontrolname='secondaryUOMUnit']//input  G
    click element  xpath=//span[contains(text(),'GM')]

    click element  xpath=//*[@formcontrolname='strengthUnit']
    input text  xpath=//*[@formcontrolname='strengthUnit']//input  O
    click element  xpath=//span[contains(text(),'OZ')]

    input text   xpath=//input[@formcontrolname='conversionFactor']   1
    input text   xpath=//input[@formcontrolname='noOfSecondaryUOM']   1
    input text   xpath=//input[@formcontrolname='strengthValue']   50

    click button  xpath=//button[@id='brandUOMFormSubBtn']
    click button  xpath=//button[contains(text(),'Save')]

    # Add Generic Formularies

    go to   http://pharmacy.dev.k8s.local/#/item/generic-formularies
    #mouse over   xpath=//i[text()='dns']
    #wait until element is visible  xpath=//span[contains(text(),'Generic Formularies')]
    #click element  xpath=//span[contains(text(),'Generic Formularies')]

    input text   xpath=//input[@formcontrolname='dosage']   50

    click element  xpath=//*[@formcontrolname='activeIngredient']
    input text  xpath=//*[@formcontrolname='activeIngredient']//input  A
    click element  xpath=//span[contains(text(),'Asprin')]



    click element  xpath=//*[@formcontrolname='dosageUnit']
    input text  xpath=//*[@formcontrolname='dosageUnit']//input  M
    click element  xpath=//span[contains(text(),'MGS')]

    click element  xpath=//*[@formcontrolname='route']
    input text  xpath=//*[@formcontrolname='route']//input  O
    click element  xpath=//span[contains(text(),'Oral')]

    click element  xpath=//*[@formcontrolname='dosageForm']
    input text  xpath=//*[@formcontrolname='dosageForm']//input  MC
    click element  xpath=//span[contains(text(),'MCG')]
    select checkbox   id=inclusions
    click button  xpath=//button[@id='genericActiveIngBtn']

    click element  xpath=//*[@formcontrolname='gracePeriod']
    input text  xpath=//*[@formcontrolname='gracePeriod']//input  4
    click element  xpath=//span[contains(text(),'48')]

    click element  xpath=//*[@formcontrolname='brandNames']
    input text  xpath=//*[@formcontrolname='brandNames']//input  D
    click element  xpath=//span[contains(text(),'Diazepam')]

    # Drug Default
    click button  xpath=//button[contains(text(),'Drug Defaults')]

    click element  xpath=//*[@formcontrolname='strength' and @id='strength']
    input text  xpath=//*[@formcontrolname='strength' and @id='strength']//input  M
    click element  xpath=//span[contains(text(),'ML')]
    select checkbox  xpath=//span[contains(text(),'ML')]/preceding-sibling::input[@type='checkbox']
    click element  xpath=//span[contains(text(),'MGS')]
    select checkbox  xpath=//span[contains(text(),'MGS')]/preceding-sibling::input[@type='checkbox']


    click element  xpath=//*[@formcontrolname='frequency']
    click element  xpath=//span[contains(text(),'TID')]
    select checkbox  xpath=//span[contains(text(),'TID')]/preceding-sibling::input[@type='checkbox']
    click element  xpath=//span[contains(text(),'BID')]
    select checkbox  xpath=//span[contains(text(),'BID')]/preceding-sibling::input[@type='checkbox']

    click element  xpath=//*[@formcontrolname='drugRoute' and @id='route']
    click element  xpath=//span[contains(text(),'Give')]
    select checkbox  xpath=//span[contains(text(),'Give')]/preceding-sibling::input[@type='checkbox']
    click element  xpath=//span[contains(text(),'Apply')]
    select checkbox  xpath=//span[contains(text(),'Apply')]/preceding-sibling::input[@type='checkbox']

    click element  xpath=//*[@formcontrolname='prescriptionType']
    input text  xpath=//*[@formcontrolname='prescriptionType']//input  A
    click element  xpath=//span[contains(text(),'ALL')]

    input text   xpath=//input[@formcontrolname='maxDuration']   5



    click button  xpath=//button[contains(text(),'Add') and @id='addDataToGrid']
    #  Work on Common  Orders
    click button  xpath=//button[contains(text(),'Common Orders')]

    click element  xpath=//*[@formcontrolname='patientType']
    input text  xpath=//*[@formcontrolname='patientType']//input  A
    click element  xpath=//span[contains(text(),'ALL')]

    click element  xpath=//*[@formcontrolname='gender']
    input text  xpath=//*[@formcontrolname='gender']//input  M
    click element  xpath=//span[contains(text(),'Male')]

    input text   xpath=//input[@formcontrolname='quantity']   1

    click element  xpath=//*[@formcontrolname='strengthId']
    input text  xpath=//*[@formcontrolname='strengthId']//input  M
    click element  xpath=//span[contains(text(),'MGS')]

    click element  xpath=//*[@formcontrolname='frequency1']
    input text  xpath=//*[@formcontrolname='frequency1']//input  B
    click element  xpath=//span[contains(text(),'BID')]

    click element  xpath=//*[@formcontrolname='dispenseRoute']
    input text  xpath=//*[@formcontrolname='frequency1']//input  A
    click element  xpath=//span[contains(text(),'Apply')]

    input text   xpath=//input[@formcontrolname='duration']   1

    click button  xpath=//button[@id='addDataToGrid']
    click button  xpath=//button[contains(text(),'Save')]
