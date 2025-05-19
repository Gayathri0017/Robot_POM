*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Resources/CheckoutDatas.csv    encoding=utf_8    dialect=unix
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/ChcekoutResources.robot
Resource    SauceDemoLogin.robot
Test Template    verify total
   
*** Variables ***
${Firstname}
${Lastname}
${Zipcode}

*** Test Cases ***
Verify the total is correct after adding the product to cart with     ${Firstname}     ${Lastname}     ${Zipcode}

*** Keywords ***
verify total
    [Arguments]    ${Firstname}    ${Lastname}    ${Zipcode}
    Open the browser with url
    Login with Valid Credential    standard_user    secret_sauce
    Add the Products to cart
    check out the products
    Fill the checkout Details    ${Firstname}    ${Lastname}    ${Zipcode}
    Verify the total of the products is correct
    close the broswer session
