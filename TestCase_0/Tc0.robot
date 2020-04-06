*** Settings ***

Documentation    Open a Web Page using Lenovo VSCODE
Library          Collections
Library          Selenium2Library



*** Variable ***

${url}           https://demo.nopcommerce.com/
${browser}       firefox



*** Test Case ***

LoginTestCase
    # only works with Firefox
    openbrowserpathapplication
    Go To                         ${url}
    sleep                         5s
    Close Browser






*** Keywords ***

openbrowserpathapplication
    ${ff default caps}            Evaluate              sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys,selenium.webdriver
    Set To Dictionary             ${ff default caps}    marionette=${True}
    Create Webdriver              Firefox               executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window


