*** Keywords ***
Loop
    FOR FOR    ${i}    IN RANGE    1    5
        Run Keyword If    ${i}    name    
    END



*** Test Cases ***