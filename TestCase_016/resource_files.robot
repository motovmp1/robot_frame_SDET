*** Settings ***

Documentation    Resources Files and Keywords
Library          Collections
Library          Selenium2Library


*** Variables ***

${url}           http://www.newtours.demoaut.com/
${browser}       firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


Open Browser
    # This is allow to check the speed of every action on RF Test
    openbrowserpath_application
    Go To                          ${url}
    Sleep                          2

    ${locat}                       Get Location
    Log                            ${locat}


Commands inside the browser
    # Here call all commands that you need
    userandpassword_application


Close all navigator
    closebrowser_application


*** Keywords ***


openbrowserpath_application
    ${ff default caps}             Evaluate                           sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary              ${ff default caps}                 marionette =${True}
    Create Webdriver               Firefox                            executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                          3seconds




userandpassword_application

    # click mouse twice fast to do action in the page
    Input Text                     xpath://input[@name='userName']    mercury
    Input Text                     xpath://input[@name='password']    mercury




closebrowser_application
# Close all after 1 second
    Sleep                          5seconds
    Close All Browsers