*** Settings ***

Documentation    Input Boxes performance
Library          Collections
Library          Selenium2Library




*** Variables ***


${url}           https://demo.nopcommerce.com/
${browser}       firefox

*** Test Cases ***


LoginTest

    openbrowserpathapplication
    Go To                         ${url}
    sleep                         5s
    userandpasswordapplication




*** Keywords ***

openbrowserpathapplication
    ${ff default caps}            Evaluate                                         sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys,selenium.webdriver
    Set To Dictionary             ${ff default caps}                               marionette=${True}
    Create Webdriver              Firefox                                          executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window

userandpasswordapplication
    click link                    xpath://a[@class='ico-login']
    input text                    id:Email                                         vinicius.mpinho@gmail.com
    sleep                         3s
    input password                id:Password                                      Test@123
    click element                 xpath://input[@class='button-1 login-button']
    sleep                         3s
    click link                    xpath://a[@class='ico-account']
    sleep                         3s
    close browser


    ti