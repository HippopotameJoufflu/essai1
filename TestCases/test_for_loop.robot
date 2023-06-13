*** Settings ***

*** Variables ***
@{ANIMAUX}=    hippo    ferret    panda
@{ids}=    001    002    003    004

*** Test Cases ***
tc01 le FOR...IN loop
    #FOR    ${element}    IN    @{ELEMENTS}
    #    INSTRUCTION    ${element}
    #END

    FOR    ${animal}    IN    @{ANIMAUX}
        Log To Console    ${animal}
    END

tc02 le FOR...IN loop
    #FOR    ${element}    IN    @{ELEMENTS}
    #    INSTRUCTION    ${element}
    #END

    FOR    ${id}    IN    @{ids}
        Log To Console    ${id}
    END

tc03 le FOR...IN RANGE loop
#IN RANGE PARAMETERS = START, END, JUMP_AMOUNT (default JUMP = 1)
    FOR    ${element}    IN RANGE    1    11
        Log To Console    ${element}
    END

tc04 le FOR...IN RANGE loop
#IN RANGE PARAMETERS = START, END, JUMP_AMOUNT
    FOR    ${element}    IN RANGE    1    11    2
        Log To Console    ${element}
    END

tc05 le FOR...IN RANGE loop with Exit For Loop If
#IN RANGE PARAMETERS = START, END, JUMP_AMOUNT
    FOR    ${element}    IN RANGE    0    12    2
        Log To Console    ${element}
        Exit For Loop If    ${element}==4
    END

tc06 le FOR...IN RANGE loop with Exit For Loop If
#IN RANGE PARAMETERS = START, END, JUMP_AMOUNT
    FOR    ${animal}    IN    @{ANIMAUX}
        Log To Console    ${animal}
        IF    "${animal}"=="panda"    BREAK
    END

*** Keywords ***