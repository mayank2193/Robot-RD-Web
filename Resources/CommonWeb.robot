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
    ${CAPABILITIES}=    Create Dictionary
    ...   platformName=${platformName}
    ...   deviceName=${deviceName}
    ...   visual=${visual}
    ...   network=${network}
    ...   console=${console}
    ...   devicelog=${devicelog}
    ...   isRealMobile=${isRealMobile}
    ...   name=LT_Appium_Robot_App_iOS
    ...   build=LT_Appium_Robot_App_Automation
    TRY
        ${REMOTE_URL}=    Set Variable If    '%{LT_GRID_URL}' == ''    mobile-hub.lambdatest.com    %{LT_GRID_URL}
    EXCEPT
        ${REMOTE_URL}=    Set Variable    mobile-hub.lambdatest.com
    END
    ${REMOTE_URL}=   Set Variable       https://%{LT_USERNAME}:%{LT_ACCESS_KEY}@${REMOTE_URL}/wd/hub
    #${REMOTE_URL}=   Set Variable       https://webhook.site/5ab4354f-7db1-4707-897a-8302e6891807
    
    ${lt_options}    Create Dictionary    platformName=${platformName}    deviceName=${deviceName}    visual=${visual}    console=${console}    network=${network}    devicelog=${devicelog}    isRealMobile=${isRealMobile}    name=LT_iOS_Robot_Web  build=LT_Appium_Robot_Web_Automation    w3c=True
    Open Application  ${REMOTE_URL}    options=${lt_options}    desired_capabilities=${CAPABILITIES}    ${platformName}=iOS
        
Close test app
    Close All Applications