*** Settings ***
Library  AppiumLibrary

*** Variables ***

${platformName}         ios
${deviceName}           iPhone.*
${visual}               True
${devicelog}            True
${network}              True
${console}              True
${isRealMobile}         True
${LT_GRID_URL}          ''
${TIMEOUT}              3000


*** Keywords ***

Open test app
    [Timeout]   ${TIMEOUT}
    TRY
        ${REMOTE_URL}=    Set Variable If    '%{LT_GRID_URL}' == ''    mobile-hub.lambdatest.com    %{LT_GRID_URL}
    EXCEPT
        ${REMOTE_URL}=    Set Variable    mobile-hub.lambdatest.com
    END
    ${REMOTE_URL}=   Set Variable       https://%{LT_USERNAME}:%{LT_ACCESS_KEY}@${REMOTE_URL}/wd/hub
    &{LT_Options}    Create Dictionary
    ...    isRealMobile=true
    ...    deviceName=iPhone.*
    ...    w3c=true
    ...    platformName=ios
    ...    build=Robot_RD_S4
    &{DESIRED_CAPABILITIES}    Create Dictionary
    ...    LT:Options=&{LT_Options}
    Open Application  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}   
Close test app
    Close All Applications