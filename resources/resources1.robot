*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
#variables scalaires
${url}=    https://imsports.rediff.com/score/in_asa_1081672.html
${browser}=    gc

*** Keywords ***
se connecter au site imsports
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    4

trouver la table
    Page Should Contain    //table[@id="bat-board"]

Afficher le nombre de lignes de la table
    ${numberOfRows}=    Get Element Count    //table[@id="bat-board"]//tbody//tr
    Log    ${numberOfRows}
    Log To Console    ${numberOfRows}
    
    
    #FOR    ${cell}    IN    @{numberOfCells}
    #    Log To Console    ${cell}
    #END
Afficher le nombre de colonnes de la table
    ${numberOfColumns}=    Get Element Count    //table[@id="bat-board"]//tbody//tr[1]//td
    Log    ${numberOfColumns}
    Log To Console    ${numberOfColumns}
Afficher les données de la table
    @{cellContent}=    Get WebElements    //table[@id="bat-board"]//tbody//tr//td    
    FOR    ${text}    IN    @{cellContent}
        ${text}=    Get Text    ${text}
        Log    ${text}
        Log To Console    ${text}
    END
Valider que le mot "Angelo Mathews" est affiché dans le tableau
    @{cellContent}=    Get WebElements    //table[@id="bat-board"]//tbody//tr//td    
    FOR    ${text}    IN    @{cellContent}
        ${text}=    Get Text    ${text}
        Log    ${text}
        Log To Console    ${text}
        IF    "${text}" == "Angelo Mathews"
            Log    condition : passed
            Log To Console    condition : passed
            Exit For Loop If    "${text}" == "Angelo Mathews"
        ELSE
            Log    condition : failed
            Log To Console    condition : failed
        END
    END
Valider que la ligne 3 contient 133.33
    @{cellContent}=    Get WebElements    //table[@id="bat-board"]//tbody//tr[4]//td    
    FOR    ${text}    IN    @{cellContent}
        ${text}=    Get Text    ${text}
        Log    ${text}
        Log To Console    ${text}
        IF    "${text}"=="133.33"
            Log    condition : passed
            Log To Console    condition : passed
        ELSE
            Log    condition : failed
            Log To Console    condition : failed
        END
    END
    
Valider que la colonne 2 contient b Shami
    @{cellContent}=    Get WebElements    //table[@id="bat-board"]//tbody//tr//td[2]  
    FOR    ${text}    IN    @{cellContent}
        ${text}=    Get Text    ${text}
        Log To Console    ${text}
        IF    "${text}" == "b Shami"
            Log To Console    condition : passed
        ELSE
            Log To Console    condition : failed
        END
    END
fermer le navigateur
    Sleep    2
    Close Browser