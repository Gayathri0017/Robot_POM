*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${backpack}    id=add-to-cart-sauce-labs-backpack
${tshirt}    id=add-to-cart-sauce-labs-bolt-t-shirt
${bikelight}    id=add-to-cart-sauce-labs-bike-light
${cartlink}    class=shopping_cart_link
${checkout}    id=checkout
${fn}    id=first-name
${ln}    id=last-name
${zc}    id=postal-code
${continue}    id=continue
${price}    xpath=//div[@class='item_pricebar']
${subtotal}    xpath=//div[@class='summary_subtotal_label']
${tax}    xpath=//div[@class='summary_tax_label']
${total}    xpath=//div[@class='summary_total_label']
${finish}    id=finish
${successmsg}    xpath=//h2[@class='complete-header']

*** Keywords ***
Add the Products to cart
    Click Element    ${backpack}
    Click Element    ${tshirt}
    Click Element    ${bikelight}
    Click Element    ${cartlink}
check out the products
    Click Button    ${checkout}
Fill the checkout Details
    [Arguments]    ${Firstname}    ${Lastname}    ${Zipcode}
    Input Text    ${fn}    ${Firstname}
    Input Text    ${ln}    ${Lastname}
    Input Text    ${zc}    ${Zipcode}
    Click Button    ${continue}
Verify the total of the products is correct
    @{prices}    Get WebElements    ${price}
    ${sum}    Set Variable    0.0
    FOR    ${p}    IN    @{prices}
        ${text}    Get Text    ${p}
        ${pri}    Convert To Number    ${text.replace('$','')}  
        ${sum}=    Evaluate    ${pri}+${sum}
    END
    Element Should Contain    ${subtotal}    ${sum} 

complete the Product checkout
    Click Element    ${finish}

Verify the success Message
    Element Text Should Be    ${successmsg}    Thank you for your order!

      

    

