*** Settings ***

Documentation                           Input Boxes performance
Library                                 Collections
Library                                 Selenium2Library


*** Variables ***


${url}                                  https://practiceselenium.com/practice-form.html
${browser}                              firefox

*** Test Cases ***


LoginTest

    openbrowserpathapplication
    Go To                          ${url}
    sleep                          5s
    userandpasswordapplication

*** Keywords ***

openbrowserpathapplication
    ${ff default caps}             Evaluate              sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary              ${ff default caps}    marionette =${True}
    Create Webdriver               Firefox               executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Set Selenium Speed             1seconds


userandpasswordapplication

# Send first name and last name inside the box

    Input Text                     name=firstname        Vinicius Miranda
    Input Text                     name=lastname         Pinho


# name / id and value for button must be here
    Select Radio Button            sex                   Female
    Select Radio Button            exp                   5

# Select the checkbox and black tea use name as parameter
    Select Checkbox                BlackTea
    Unselect Checkbox              BlackTea
    Select Checkbox                BlackTea
    Select Checkbox                RedTea

# select from list by label drop_box    by Id and options
    Select From List By Label      continents            Asia
    Sleep                          4
    Select From List By Index      continents            5


# list box that we can choose more than on item

    Select From List By Label      selenium_commands     Switch Commands
    Select From List By Label      selenium_commands     Browser Commands
    Unselect From List By Label    selenium_commands     Switch Commands

# Close all after 1 second
    Sleep                          1second
    Close Browser
