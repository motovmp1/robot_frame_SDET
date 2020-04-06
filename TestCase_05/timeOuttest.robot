*** Settings ***

Documentation    Input Boxes performance
Library          Collections
Library          Selenium2Library


*** Variables ***


${url}           http://demowebshop.tricentis.com/register
${browser}       firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


LoginTest
    # This is allow to check the speed of every action on RF Test
    openbrowserpathapplication
    Go To                                    ${url}
    Sleep                                    2
    userandpasswordapplication

*** Keywords ***

openbrowserpathapplication
    ${ff default caps}                       Evaluate                                 sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary                        ${ff default caps}                       marionette =${True}
    Create Webdriver                         Firefox                                  executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                                    3seconds




userandpasswordapplication
    # This is have a 5 seconds timeout as default
    Set Selenium Timeout                     15seconds
    Wait Until Page Contains                 Register
    # ---------------------------------------------
    # End the timeout setup
    Select Radio Button                      Gender                                   M
    Input Text                               name:FirstName                           Vinicius Miranda de
    Input Text                               name:LastName                            Pinho
    Input Text                               name:Email                               vinicius.mpinho@gmail.com
    Input Text                               name:Password                            123mudar
    Input Text                               name:ConfirmPassword                     123mudar
    # This is the second check that allow to check the speed after setup set selenium speed
    # This is a property that allow to print inside the report all elements
    Log                                      ${magic}
    ${timeout_selenium_variable_Register}    Get Selenium Timeout
    Log To Console                           ${timeout_selenium_variable_Register}
    Log                                      ${timeout_selenium_variable_Register}


# Close all after 1 second
    Sleep                                    2second
    Close Browser
