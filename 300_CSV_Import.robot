*** Settings ***
Documentation     Test Suite for CSV Import test cases
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Test Cases ***
300. Import Concepts to the Terminological Vocabulary, related concepts not found from CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary. Check that error message is displayed in
    ...    import confirmation when related, broader and isPartOf concepts are not found from CSV.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${invalid_related_concepts}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page should contain    Tuodaan 4 käsitettä
    Page should contain    4: Viittauksella “broader” ei löydy käsitettä arvolle “joku”
    Page should contain    4: Viittauksella “related” ei löydy käsitettä arvolle “joku”
    Page should contain    4: Viittauksella “isPartOf” ei löydy käsitettä arvolle “joku”
    Page should contain    5: Viittauksella “broader” ei löydy käsitettä arvolle “joku”
    Page should contain    5: Viittauksella “related” ei löydy käsitettä arvolle “joku”
    Page should contain    5: Viittauksella “isPartOf” ei löydy käsitettä arvolle “joku”
    Log to Console    Error message displayed when related, broader and isPartOf concepts are not found from CSV
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

301. Import Concepts to the Terminological Vocabulary, related columns with empty values in CSV
    [Documentation]    Import Concepts to the Terminological Dictionary. Check that import is successful when
    ...    related, broader and isPartOf columns are empty for certain concepts in CSV.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${empty_related_concepts}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page should contain    Tuodaan 1 käsitettä
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Voimassa oleva
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Voimassa oleva
    Log to Console    Import successful when related columns have empty values in CSV
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

302. Import Concepts to the Terminological Vocabulary with empty STATUS values
    [Documentation]    Import Concepts to the Terminological Vocabulary with empty STATUS values.
    ...    Check that import is successful and concept STATUS is Draft after CSV import. Check that Draft STATUS
    ...    is shown in import confirmation as well.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${concepts_with_empty_status}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page should contain    Tuodaan 1 käsitettä
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Luonnos
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Luonnos
    Log to Console    Concept import with empty STATUS values in CSV is successful
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

303. Import Concepts to the Terminological Vocabulary with missing STATUS column
    [Documentation]    Import Concepts to the Terminological Vocabulary with missing STATUS column.
    ...    Check that import is successful and concept STATUS is Draft after CSV import. Check that Draft STATUS
    ...    is shown in import confirmation as well.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${concepts_with_missing_status}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page should contain    Tuodaan 1 käsitettä
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    study
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esimerkki
    Page should contain    Luonnos
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    study
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esimerkki
    Page should contain    Luonnos
    Log to Console    When STATUS column is missing import is successful and concept STATUS is Draft after CSV import
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

304. Import Concepts to the Terminological Vocabulary with invalid column name in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with invalid column name in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${concepts_with_invalid_column}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page should contain    Ominaisuus “definition” täytyy olla määritelty kielen kanssa
    Log to Console    Import is not successful and error message is dispalyed when column name is invalid
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

305. Import Concepts to the Terminological Vocabulary with invalid status value in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with invalid status value in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${concepts_with_invalid_status_value}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page should contain    3: Virheellinen tila “xxxxx”
    log to Console    Import is not successful and error message is dispalyed when status value is invalid
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

306. Import Concepts to the Terminological Vocabulary with duplicate definition columns in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with duplicate definition columns in CSV.
    ...    Check that the values of the second column are taken into use
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${concepts_with_duplicate_definition_columns}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page should contain    systemaattista ja luovaa toimintaa2
    Page should contain    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta2
    Page should contain    henkilö, joka hutkii ammatikseen2
    Page should contain    henkilö, joka hotkii kaiken2
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Sleep    3
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa2
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Voimassa oleva
    log to Console    Import is successful and values of the second column are taken into use when duplicate definition columns are defined in CSV
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

*** Keywords ***
Select Testiautomaatiosanasto2 vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
