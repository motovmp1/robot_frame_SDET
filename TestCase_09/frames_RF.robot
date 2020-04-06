*** Settings ***

Documentation    Input Boxes performance
Library          Collections
Library          Selenium2Library


*** Variables ***

${url}           https://www.selenium.dev/selenium/docs/api/java/index
${browser}       firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


LoginTest
    # This is allow to check the speed of every action on RF Test
    openbrowserpath_application
    Go To                          ${url}
    Sleep                          2
    userandpasswordapplication
    closebrowser_application




*** Keywords ***

openbrowserpath_application
    ${ff default caps}             Evaluate                                   sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary              ${ff default caps}                         marionette =${True}
    Create Webdriver               Firefox                                    executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                          3seconds




userandpassword_application

    Select Frame                   xpath://frame[@name='packageListFrame']
    Click Link                     xpath://li[5]//a[1]
    Unselect Frame
    Sleep                          2


    Select Frame                   packageFrame
    Click Link                     WebDriver
    Unselect Frame
    Sleep                          2

    Select Frame                   classFrame
    Click Link                     Index
    Unselect Frame
    Sleep                          2


closebrowser_application
# Close all after 1 second
    Sleep                          3seconds
    Close All Browsers