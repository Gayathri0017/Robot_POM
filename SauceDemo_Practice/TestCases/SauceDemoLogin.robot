*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Resources/SauceDemoDatas.xlsx    sheet_name=Sheet1  
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    Validate Successful and UnSuccessful Login  

*** Variables *** 
${Username}
${Password}

*** Test Cases ***
Verify Login Feature    ${Username}    ${Password}


*** Keywords ***
Validate Successful and UnSuccessful Login
    [Arguments]    ${Username}    ${Password}
    Open the browser with url
    fill the login form    ${Username}    ${Password}
    IF    '${Username}'=='locked_out_user'
        verify locked out error
    ELSE IF    '${Username}'=='abc'
        verify invalid username and password
    ELSE IF    '${Username}'==''
        verify username required error
    ELSE IF    '${Password}'==''
        verify password required error
    ELSE    
        verify the dash board Page    
    END
    close the broswer session



    