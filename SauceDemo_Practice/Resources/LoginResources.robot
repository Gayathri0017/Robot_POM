*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${un}    name=user-name
${pw}    name=password
${loginbtn}    id=login-button
${dashText}    xpath=//div[@class='app_logo']
${Error}    xpath=//h3
${menu}    id=react-burger-menu-btn 
${logout}    id=logout_sidebar_link

*** Keywords ***
fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    ${un}    ${Username}
    Input Password    ${pw}    ${Password}
    Click Button    ${loginbtn}
    Sleep    5

Login with Valid Credential
    [Arguments]    ${username}    ${password}
    fill the login form    ${username}    ${password}
    verify the dash board Page

click Logout Button and verify the logout
    Click Element    ${menu}
    Click Element    ${logout}
    Location Should Be    https://www.saucedemo.com/
    

verify the dash board Page
    Element Text Should Be    ${dashText}    Swag Labs
verify locked out error
    Element Text Should Be    ${Error}    Epic sadface: Sorry, this user has been locked out.
verify username required error
    Element Text Should Be    ${Error}    Epic sadface: Username is required
verify password required error
    Element Text Should Be    ${Error}    Epic sadface: Password is required
verify invalid username and password
    Element Text Should Be    ${Error}    Epic sadface: Username and password do not match any user in this service
        