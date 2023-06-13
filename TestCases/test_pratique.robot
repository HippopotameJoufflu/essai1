*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources1.robot

*** Variables ***


*** Test Cases ***
tc01
    se connecter au site imsports
    Afficher le nombre de lignes de la table
    Afficher le nombre de colonnes de la table
    Afficher les données de la table
    Valider que le mot "Angelo Mathews" est affiché dans le tableau
    Valider que la ligne 3 contient 133.33
    Valider que la colonne 2 contient b Shami
    fermer le navigateur

