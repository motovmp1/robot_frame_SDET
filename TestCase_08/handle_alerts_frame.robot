*** Settings ***

Documentation    Input Boxes performance
Library          Collections
Library          Selenium2Library


*** Variables ***

${url}           http://testautomationpractice.blogspot.com
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
    ${ff default caps}             Evaluate                                       sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary              ${ff default caps}                             marionette =${True}
    Create Webdriver               Firefox                                        executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                          3seconds




userandpassword_application
    Sleep                          5
    Click Element                  xpath://button[contains(text(),'Click Me')]
    Sleep                          4
    # handle alert can not see in the list - strange
    #Handle Alert                   accept
    #Dismiss Alert
    Alert Should Be Present        Press a button!




closebrowser_application
# Close all after 1 second
    Sleep                          3seconds
    Close All Browsers