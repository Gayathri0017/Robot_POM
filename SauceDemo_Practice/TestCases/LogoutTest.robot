*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/GenericResources.robot

*** Test Cases ***
Verify the logout feature
    Open the browser with url
    fill the login form    standard_user    secret_sauce
    verify the dash board Page
    click Logout Button and verify the logout
    close the broswer session