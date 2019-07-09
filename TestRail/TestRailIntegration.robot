*** Settings ***
Library  RequestsLibrary
Test Teardown  LogStatusToTestRail



*** Keywords ***
LogStatusToTestRail
    [Arguments]   ${executionID}    ${tcaseId}
    log to console  ${TEST_STATUS}
    run keyword if  '${TEST_STATUS}' == 'PASS'   LogStatusPass   ${executionID}    ${tcaseId}
    run keyword if  '${TEST_STATUS}' == 'FAIL'   LogStatusFail   ${executionID}    ${tcaseId}

LogStatusPass
    [Arguments]   ${executionID}    ${tcaseId}
    ${header}=	Create Dictionary	Content-Type=application/json
    ${auth}=  create list  testingworldindia@gmail.com   SHPJd6uwgmmPUjAbk80g
    ${param}=  create dictionary  status_id=1
    create session  Session1  ${URL}  auth=${auth}  headers=${header}
    ${Res}=  post request  Session1   /index.php?/api/v2/add_result_for_case/${executionID}/${tcaseId}  data=${param}
    log to console  ${Res.status_code}
    log to console  ${Res.json()}

LogStatusFail
    [Arguments]   ${executionID}    ${tcaseId}
    ${header}=	Create Dictionary	Content-Type=application/json
    ${auth}=  create list  testingworldindia@gmail.com   SHPJd6uwgmmPUjAbk80g
    ${param}=  create dictionary  status_id=5
    create session  Session1  ${URL}  auth=${auth}  headers=${header}
    ${Res}=  post request  Session1   /index.php?/api/v2/add_result_for_case/${executionID}/${tcaseId} data=${param}
    log to console  ${Res.status_code}
    log to console  ${Res.json()}