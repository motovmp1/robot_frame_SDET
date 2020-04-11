*** Settings ***

Documentation     Resources Files and Keywords
Library           Collections
Library           Selenium2Library
Resource          /home/elsys/Documents/vscode_robot_git/robot_frame_SDET/Resources/login_resources.robot
Library           DataDriver                                                                                 /home/elsys/Documents/vscode_robot_git/robot_frame_SDET/Test_Data/admin_file.csv

Suite Setup       Open Browser

Suite Teardown    close_browser_application

Test Template     Invalid login


*** Test Case ***
# take car with this line

LoginTestwithExcel using ${username} and ${password}



*** Keywords ***

Invalid login
    [Arguments]                        ${username}    ${password}
    input_username_application         ${username}
    input_password_application         ${password}
    click_login_application
    Error_message_login_application








