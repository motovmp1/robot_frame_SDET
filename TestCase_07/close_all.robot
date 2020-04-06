*** Settings ***

Documentation    Input Boxes performance
Library          Collections
Library          Selenium2Library


*** Variables ***

${url}           http://demowebshop.tricentis.com/register
${url2}          https://google.com
${browser}       firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


LoginTest
    # This is allow to check the speed of every action on RF Test
    openbrowserpath_application
    Go To                          ${url}
    Sleep                          2
    #userandpasswordapplication

    openbrowserpath_application
    Go To                          ${url2}
    Sleep                          2

    closebrowser_application


*** Keywords ***

openbrowserpath_application
    ${ff default caps}             Evaluate                      sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary              ${ff default caps}            marionette =${True}
    Create Webdriver               Firefox                       executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                          3seconds




userandpassword_application

    Select Radio Button            Gender                        M
    Input Text                     name:FirstName                Vinicius Miranda de
    # This is will waiting for 10 seconds if not found this is go to error

    Set Selenium Implicit Wait     10second
    ${implicit_wait}               Get Selenium Implicit Wait
    Input Text                     name:LastName                 Pinho
    # ---------------------------------------------------------------------
    # Implicit wait will be apply to all elements in the page
    Input Text                     name:Email                    vinicius.mpinho@gmail.com
    Input Text                     name:Password                 123mudar
    Input Text                     name:ConfirmPassword          123mudar
    # This is the second check that allow to check the speed after setup set selenium speed
    # This is a property that allow to print inside the report all elements
    Log                            ${magic}
    Log To Console                 ${implicit_wait}
    Log                            ${implicit_wait}


closebrowser_application
# Close all after 1 second
    Sleep                          2second
    Close All Browsers