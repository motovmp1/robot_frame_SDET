*** Settings ***

Documentation    Input Boxes performance
Library          Collections
Library          Selenium2Library


*** Variables ***

${url}           https://opensource-demo.orangehrmlive.com/
${browser}       firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


LoginTest
    # This is allow to check the speed of every action on RF Test
    openbrowserpath_application
    Go To                           ${url}
    Sleep                           2

    ${locat}                        Get Location
    Log To Console                  ${locat}
    Log                             ${locat}

    # Here call all commands that you need
    userandpassword_application



    closebrowser_application


*** Keywords ***


openbrowserpath_application
    ${ff default caps}              Evaluate                          sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary               ${ff default caps}                marionette =${True}
    Create Webdriver                Firefox                           executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                           3seconds




userandpassword_application

    # Insert element inside the page
    Clear Element Text              id:txtUsername
    Sleep                           0.2
    Input Text                      id:txtUsername                    Admin
    Sleep                           3
    Clear Element Text              id:txtPassword
    Sleep                           0.2
    Input Text                      id:txtPassword                    admin123
    Sleep                           3

    capture element screenshot      //div[@id='logInPanelHeading']
    Capture Page Screenshot         page_web.png
    Current Frame Should Contain    LOGIN Panel



closebrowser_application
# Close all after 1 second
    Sleep                           5seconds
    Close All Browsers