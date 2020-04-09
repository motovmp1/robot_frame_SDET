*** Settings ***

Documentation            Resources Files and Keywords
Library                  Collections
Library                  Selenium2Library
Resource                 /home/elsys/Documents/vscode_robot_git/robot_frame_SDET/Resources/login_resources.robot

# only once in the begin
Suite Setup              Open Browser
# only once the final test
Suite Teardown           close_browser_application
# only once test template
Test Template            Invalid login

*** Variables ***

${magic}                 Lenovo New report LOG test


*** Test Cases ***       username                                                                                   password

Right user empty pass    admin@yourstore.com                                                                        ${EMPTY}
Right user wrong pass    admin@yourstore.com                                                                        xyz
wrong user right pass    admin@yourstore1.com                                                                       admin
wrong user empty pass    admin@yourstore1.com                                                                       ${EMPTY}
wrong user wrong pass    admin@yourstore1.com                                                                       admin1


*** Keywords ***

Invalid login
    [Arguments]                        ${username}    ${password}
    input_username_application         ${username}
    input_password_application         ${password}
    click_login_application
    Error_message_login_application





