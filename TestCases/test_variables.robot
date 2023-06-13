*** Settings ***
Documentation

*** Variables ***
#variables scalaires
${valeur1} =     2
${valeur2} =     4
${valeur3} =     4.5
${navigateur} =     gc
${url} =     https://www.google.com
#variables de type liste
@{liste_ville}=    montreal    laval    tunis    longueuil
#variable de type dictionnaire
&{dict_login}=    user=Admin    password=admin123


*** Test Cases ***
tc01 test des variables
    Log    ${valeur1}
    Log    ${valeur2}
    Log    ${valeur3}
    Log    ${navigateur}
    Log    ${url}
    Log To Console    ${valeur1}
    Log To Console    ${valeur2}
    Log To Console    ${navigateur}
    Log To Console    ${url}

tc02 test des listes
#pour faire une variable type liste, il faut @ (chaque parametre separe par TAB)
#liste = plusieurs variables scalaires
# donc pour afficher contenu, utiliser $ et non @
    Log    ${liste_ville}[0]
    Log    ${liste_ville}[1]
    Log    ${liste_ville}[2]
    Log    ${liste_ville}[3]
    Log To Console    ${liste_ville}[0]
    Log To Console    ${liste_ville}[1]
    Log To Console    ${liste_ville}[2]
    Log To Console    ${liste_ville}[3]

tc03 test dictionnaires
#variable de type dictionnaire
    Log    ${dict_login}[user]
    Log    ${dict_login}[password]
    Log    ${dict_login.user}
    Log    ${dict_login.password}
    Log To Console    ${dict_login}[user]
    Log To Console    ${dict_login}[password]

*** Keywords ***