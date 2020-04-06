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
    ${speed_selenium}             Get Selenium Speed
    Log To Console                ${speed_selenium}
    openbrowserpathapplication
    Go To                         ${url}
    userandpasswordapplication

*** Keywords ***

openbrowserpathapplication
    ${ff default caps}            Evaluate                sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary             ${ff default caps}      marionette =${True}
    Create Webdriver              Firefox                 executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                         3seconds
    Set Selenium Speed            0.35seconds


userandpasswordapplication

    Select Radio Button           Gender                  M
    Input Text                    name:FirstName          Vinicius Miranda de
    Input Text                    name:LastName           Pinho
    Input Text                    name:Email              vinicius.mpinho@gmail.com
    Input Text                    name:Password           123mudar
    Input Text                    name:ConfirmPassword    123mudar
    # This is the second check that allow to check the speed after setup set selenium speed
    # This is a property that allow to print inside the report all elements
    ${speed_selenium}             Get Selenium Speed
    Log To Console                ${speed_selenium}
    Log                           ${speed_selenium}
    Log                           ${magic}


# Close all after 1 second
    Sleep                         2second
    Close Browser
