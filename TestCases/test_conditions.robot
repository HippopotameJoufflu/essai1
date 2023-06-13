*** Settings ***

*** Variables ***
${user}=    admin
${salaire}=    100000
${age}=    40
${nombre1}=    10
${nombre2}=    15
${nombre3}=    5

*** Test Cases ***
tc01 le bloc IF
#operates like IF...ELSE, however treats ELSE as empty
#normally neither IF nor ELSE can have a blank statement following them
    #IF    $var_in_py_expr1 == $var_in_py_expr2
    #    Call Keyword
    #ELSE
    #    
    #END
    IF    "${user}" == "admin"
        Log To Console    condition : passed
    END

tc02 le bloc IF...ELSE
    IF    ${nombre1} != ${nombre2}
        Log To Console    condition : passed
    ELSE
        Log To Console    condition : fail 
    END

tc03 le bloc IF...ELSE
    IF    ${nombre1} != ${nombre2} and ${nombre1} < ${age} and ${nombre2} > 200
        Log To Console    condition : passed
    ELSE
        Log To Console    condition : fail 
    END

*** Keywords ***