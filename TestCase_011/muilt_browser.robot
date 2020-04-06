*** Settings ***

Documentation    Input Boxes performance
Library          Collections
Library          Selenium2Library


*** Variables ***

${url2}          https://www.bing.com
${url}           http://demo.automationtesting.in/Windows.html
${browser}       firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


LoginTest
    # This is allow to check the speed of every action on RF Test
    openbrowserpath_application
    Go To                          ${url}
    Sleep                          2


    openbrowserpath_application
    Go To                          ${url2}
    Sleep                          2

    Switch Browser                 1
    ${title}                       Get Title
    Log To Console                 ${title}

    Switch Browser                 2
    ${title2}                      Get Title
    Log To Console                 ${title2}

    closebrowser_application


*** Keywords ***






openbrowserpath_application
    ${ff default caps}             Evaluate                                                                              sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary              ${ff default caps}                                                                    marionette =${True}
    Create Webdriver               Firefox                                                                               executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                          3seconds




userandpassword_application

    # Title of the page or url to change to next multi browser
    Click Button                   xpath://div[@id='Tabbed']//button[@class='btn btn-info'][contains(text(),'click')]
    Sleep                          15
    Select Window                  title=Sakinalium | Home
    Sleep                          3
    Click Element                  xpath://ul[@class='nav navbar-nav navbar-right']//a[contains(text(),'Contact')]


closebrowser_application
# Close all after 1 second
    Sleep                          5seconds
    Close All Browsers