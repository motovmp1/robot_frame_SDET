*** Settings ***

Documentation    Resources Files commom keywords
Library          Collections
Library          Selenium2Library




*** Keywords ***


openbrowserpath_application
    [Arguments]                ${app_browser}        ${app_url}
    ${ff default caps}         Evaluate              sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary          ${ff default caps}    marionette =${True}
    Create Webdriver           ${app_browser}        executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                      3seconds
    Go To                      ${app_url}
    Sleep                      2
    ${locat}                   Get Location
    Log                        ${locat}
    ${title_page}              Get Title
    Log                        ${title_page}
    [Return]                   ${title_page}
