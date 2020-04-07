*** Settings ***

Documentation    Resources Files and Keywords
Library          Collections
Library          Selenium2Library


*** Variables ***

${url}           http://192.168.10.254/index.html?link
${browser}       Firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


Open Browser
    # This is allow to check the speed of every action on RF Test
    ${page_title_main}                    openbrowserpath_application              ${browser}                                                                                   ${url}
    Log                                   ${page_title_main}


Commands inside the browser
    # Here call all commands that you need
    userandpassword_application


Status do sistema - tipo da antena3g
    statusdosistemaeantena_application



Close all navigator
    closebrowser_application


*** Keywords ***


openbrowserpath_application
    [Arguments]                           ${app_browser}                           ${app_url}
    ${ff default caps}                    Evaluate                                 sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary                     ${ff default caps}                       marionette =${True}
    Create Webdriver                      ${app_browser}                           executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                                 3seconds
    Go To                                 ${app_url}
    Sleep                                 2
    ${locat}                              Get Location
    Log                                   ${locat}
    ${title_page}                         Get Title
    Log                                   ${title_page}
    [Return]                              ${title_page}



userandpassword_application

    # click mouse twice fast to do action in the page
    ${title_page_one}                     Get Title
    Log                                   ${title_page_one}
    Title Should Be                       Elsys - AmpliMAX
    Select From List By Label             antena3g                                 Interna
    Element Should Contain                xpath://select[@name='antena3g']         Interna
    Element Should Contain                xpath://select[@name='antena3g']         Externa


statusdosistemaeantena_application
    #click no status da pagina e verifica a antena
    Sleep                                 1
    Click Element                         id:menu_status
    Sleep                                 4
    Element Should Contain                xpath://span[@class='tipo_de_antena']    Interna
    Element Should Contain                xpath://span[@class='banda']             900 MHz
    Element Should Contain                xpath://span[@class='freq_3G']           932.4 MHz
    ${nivel_de_sinal}                     Get Webelement                           xpath://span[contains(text(),'Nível de Sinal:')]
    Log To Console                        ${nivel_de_sinal.text}
    ${nivel_de_sinal2}                    Get Webelement                           xpath://span[@class='titulo_azul nivel_sinal_quality']
    Log To Console                        ${nivel_de_sinal2.text}
    ${nivel_de_sinal3}                    Get Webelement                           xpath://span[@class='titulo_azul nivel-3g-percent']
    ${mytext}                             Get Text                                 ${nivel_de_sinal3}
    Log To Console                        ${mytext[0:2]}
    Should Be True                        ${mytext[0:2]} > ${60}
    Log                                   ${mytext[0:2]}
    Page Should Contain Image             assets/img/icon_3g_on.png







closebrowser_application
# Close all after 1 second
    Sleep                                 5seconds
    Close All Browsers