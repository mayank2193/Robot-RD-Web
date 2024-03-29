*** Settings ***

Resource  ../Resources/CommonWeb.robot

Test Setup  CommonWeb.Open test app
Test Teardown  CommonWeb.Close test app
 
*** Variables ***
${TIMEOUT}          3000

*** Test Cases ***

Example of connecting to Lambdatest via Robot Framework
	[Timeout]   ${TIMEOUT}
	Go To URL    https://lambdatest.github.io/sample-todo-app/
	Sleep   3s

	Click Element  //input[@name='li1']
	Click Element  //input[@name='li2']
		
	Input text  //input[@id='sampletodotext']  Yey Let's add it to list
	Click Element  //input[@id='addbutton']
	Sleep    5s
