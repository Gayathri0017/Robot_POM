*** Settings ***
Library    SeleniumLibrary
Test Setup    open the browser with url
Test Teardown    close the browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/DashboardResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/ForgetPasswordResoure.robot

*** Test Cases ***
validate Reset Password functionality
    [Tags]    smoke
    LoginResources.Go to Forget your password page
    ForgetPasswordResoure.Verify Forgot Your Password Page Opens
    ForgetPasswordResoure.Fill the Forgot Password Page
    ForgetPasswordResoure.Verify the message

validate cancel functionality
    [Tags]    smoke
    LoginResources.Go to Forget your password page
    ForgetPasswordResoure.Verify Forgot Your Password Page Opens
    ForgetPasswordResoure.Cancel the Reset Password
    ForgetPasswordResoure.Verify that Login Page is displayed
