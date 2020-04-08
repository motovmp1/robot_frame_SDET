*** Settings ***

Documentation    Resources Files and Keywords
Library          Collections
Library          Selenium2Library
Resource         /home/elsys/Documents/vscode_robot_git/robot_frame_SDET/Resources/resources_parent.robot



*** Variables ***

${url}           http://www.newtours.demoaut.com/
${browser}       Firefox
${magic}         Lenovo New report LOG test


*** Test Cases ***


Open Browser
    # This is allow to check the speed of every action on RF Test
    ${page_title_main}    openbrowserpath_application        ${browser}    ${url}
    Log                   ${page_title_main}



userandpassword_application

    # click mouse twice fast to do action in the page
    Input Text            xpath://input[@name='userName']    mercury
    Input Text            xpath://input[@name='password']    mercury




closebrowser_application
# Close all after 1 second
    Sleep                 5seconds
    Close All Browsers