*** Settings ***

Documentation    Resources Files and Keywords
Library          Collections
Library          Selenium2Library


*** Variables ***

${url}           http://www.newtours.demoaut.com/
${browser}       Firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


Open Browser
    # This is allow to check the speed of every action on RF Test
    ${page_title_main}             openbrowserpath_application        ${browser}                                                                                   ${url}
    Log                            ${page_title_main}

Commands inside the browser
    # Here call all commands that you need
    userandpassword_application


Close all navigator
    closebrowser_application


*** Keywords ***


openbrowserpath_application
    [Arguments]                    ${app_browser}                     ${app_url}
    ${ff default caps}             Evaluate                           sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary              ${ff default caps}                 marionette =${True}
    Create Webdriver               ${app_browser}                     executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                          3seconds
    Go To                          ${app_url}
    Sleep                          2
    ${locat}                       Get Location
    Log                            ${locat}
    ${title_page}                  Get Title
    Log                            ${title_page}
    [Return]                       ${title_page}



userandpassword_application

    # click mouse twice fast to do action in the page
    Input Text                     xpath://input[@name='userName']    mercury
    Input Text                     xpath://input[@name='password']    mercury




closebrowser_application
# Close all after 1 second
    Sleep                          5seconds
    Close All Browsers