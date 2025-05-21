*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${sortoptions}    class=product_sort_container
${productName}    class=inventory_item_name 
${itemPrice}    class=inventory_item_price

*** Keywords ***
select the sort option
    [Arguments]    ${option}
    Select From List By Label    ${sortoptions}    ${option}

*** Keywords ***
Get Product Names
    [Arguments]    ${elements}
    @{product_names}=    Create List
    FOR    ${ele}    IN    @{elements}
        ${text}=    Get Text    ${ele}
        Append To List    ${product_names}    ${text}
    END
    [Return]    ${product_names}

Get Product Prices
    [Arguments]    ${elements}
    @{prices}=    Create List
    FOR    ${ele}    IN    @{elements}
        ${text}=    Get Text    ${ele}
        ${price}=    Convert To Number    ${text.replace('$','')}
        Append To List    ${prices}    ${price}
    END
    [Return]    ${prices}

Verify Product Order Descending
    ${elements}=    Get WebElements    ${productName}
    ${act}=    Get Product Names    ${elements}
    ${ex}=    Copy List    ${act}
    Sort List    ${ex}
    Reverse List    ${ex}
    Lists Should Be Equal    ${ex}    ${act}

Verify Product Order Ascending
    ${elements}=    Get WebElements    ${productName}
    ${act}=    Get Product Names    ${elements}
    ${ex}=    Copy List    ${act}
    Sort List    ${ex}
    Lists Should Be Equal    ${ex}    ${act}
    
Verify Product Price Order Ascending
    ${elements}=    Get WebElements    ${itemPrice}
    ${act}=    Get Product Prices    ${elements}
    ${ex}=    Copy List    ${act}
    # Sort List    ${ex}
    Lists Should Be Equal    ${ex}    ${act}

Verify Product Price Order Descending
    ${elements}=    Get WebElements    ${itemPrice}
    ${act}=    Get Product Prices    ${elements}
    ${ex}=    Copy List    ${act}
    Sort List    ${ex}
    Reverse List    ${ex}
    Lists Should Be Equal    ${ex}    ${act}




    
    