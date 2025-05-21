*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/SortingResources.robot

*** Test Cases ***
Verify the product sorting from Z - A
    Open the browser with url
    Login with Valid Credential    standard_user    secret_sauce
    select the sort option    Name (Z to A)
    Verify Product Order Descending 
    close the broswer session

Verify the product sorting from A-Z
    Open the browser with url
    Login with Valid Credential    standard_user    secret_sauce
    select the sort option    Name (A to Z)
    Verify Product Order Ascending

Verify the product sorting from High price to Low
    Open the browser with url
    Login with Valid Credential    standard_user    secret_sauce
    select the sort option    Price (high to low)
    Verify Product Price Order Ascending

Verify Product Price Order Descending
    Open the browser with url
    Login with Valid Credential    standard_user    secret_sauce
    select the sort option    Price (low to high)
    Verify Product Price Order Ascending


    
    