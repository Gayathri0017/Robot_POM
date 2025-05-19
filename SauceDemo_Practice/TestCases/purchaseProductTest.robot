*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Resources/CheckoutDatas.csv    encoding=utf_8    dialect=unix
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/ChcekoutResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    verify the product checkout feature

*** Variables ***
${Firstname}
${Lastname}
${Zipcode}

*** Test Cases ***
verify the product checkout feature with    ${Firstname}    ${Lastname}    ${Zipcode}

*** Keywords ***
verify the product checkout feature
    [Arguments]    ${Firstname}    ${Lastname}    ${Zipcode}           
    Open the browser with url
    Login with Valid Credential    standard_user    secret_sauce
    Add the Products to cart
    check out the products
    Fill the checkout Details    ${Firstname}    ${Lastname}    ${Zipcode}
    complete the Product checkout
    Verify the success Message

