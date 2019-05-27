*** Settings ***
Documentation     Test Suite for basic functionality of Terminology application
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Wait until page contains element    id=information_link    timeout=20
    Click element    id=information_link
    Wait until page contains    Tietoa Sanastoista
    Wait until page contains    Sanastot-työkalu on tarkoitettu
    Wait until page contains    Sanastot-työkalulla
    Wait until page contains    Hyödyt käyttäjille
    Wait until page contains    Miten voin liittyä työkalun käyttäjäksi?
    Wait until page contains    Katso myös
    Wait until page contains    Ota yhteyttä
    Log to Console    Information about the service page opened
    Go back to Sanastot frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Wait until page contains element    id=license_link    timeout=20
    Click element    id=license_link
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Log to Console    EUPL-1.2 license page opened
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Sanastot

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    sanastot
    [Setup]    Test Case Setup
    Wait until page contains element    id=description_of_file_link    timeout=20
    Click element    id=description_of_file_link
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Log to Console    Description of file page opened
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Sanastot

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_EN}
    Wait until page contains    All organizations    timeout=20
    Wait until page contains    Search terminologies    timeout=20
    Wait until page contains    Filter with information domain
    Log to Console    User interface language changed
    [Teardown]    Restore Finnish language

104. Search for DRAFT vocabulary
    [Documentation]    Search for DRAFT vocabulary with frontpage search function.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_2}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_2}")]
    Wait until page contains    ${VOCABULARY_2}    timeout=30
    Wait until page contains element    ${TERMINOLOGY_TAB}    timeout=30
    Wait until page contains element    ${ADD_NEW_CONCEPT_BTN}    timeout=30
    Log to Console    Terminology found
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

105. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test
    [Setup]    Test Case Setup
    Select navigation menu link    Käyttäjätiedot
    Wait until page contains    Käyttäjätiedot    timeout=60
    Wait until page contains    Nimi    timeout=60
    Wait until page contains    Testi Admin    timeout=60
    Wait until page contains    Sähköposti    timeout=60
    Wait until page contains    Organisaatiot ja roolit    timeout=60
    Wait until page contains    Lähetä käyttöoikeuspyyntö    timeout=60
    Select navigation menu link    yhteentoimiva.suomi.fi
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Wait until page contains    Yhteentoimivuusalusta ja -menetelmä    timeout=60
    Close Window
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Sanastot
    Select navigation menu link    Suomi.fi-koodistot
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Koodistot
    Wait until page contains    Koodistot    timeout=40
    Wait until page contains    Hae koodistoa    timeout=40
    Wait until page contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Sanastot
    Select navigation menu link    Suomi.fi-tietomallit
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Tietomallit
    Wait until page contains    Tietomallit    timeout=40
    Wait until page contains    Hae tietomallia    timeout=40
    Wait until page contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Sanastot
    Close All Browsers

*** Keywords ***
Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_FI}
    Wait until page contains    Kaikki organisaatiot    timeout=20
    Wait until page contains    Rajaa tietoalueella    timeout=20
    Close All Browsers

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Wait until page contains element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
