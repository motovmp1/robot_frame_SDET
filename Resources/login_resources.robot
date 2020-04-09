*** Settings ***

Documentation    Resources Files commom keywords
Library          Collections
Library          Selenium2Library



*** Variable ***


${url}           https://admin-demo.nopcommerce.com
${browser}       Firefox





*** Keywords ***


openbrowserpath_application
    [Arguments]                ${app_browser}                                   ${app_url}
    ${ff default caps}         Evaluate                                         sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Set To Dictionary          ${ff default caps}                               marionette =${True}
    Create Webdriver           ${app_browser}                                   executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window
    Sleep                      3seconds
    Go To                      ${app_url}
    Sleep                      2
    Set Selenium Speed         0.1
    ${locat}                   Get Location
    Log                        ${locat}
    ${title_page}              Get Title
    Log                        ${title_page}
    [Return]                   ${title_page}


Open Browser
    # This is allow to check the speed of every action on RF Test
    ${page_title_main}         openbrowserpath_application                      ${browser}                                                                                   ${url}
    Log                        ${page_title_main}



close_browser_application
    Sleep                      3
    Close All Browsers


input_username_application
    [Arguments]                ${username}
    Input Text                 id:Email                                         ${username}


input_password_application

    [Arguments]                ${password}
    Input Text                 id:Password                                      ${password}

click_login_application

    Click Element              xpath://input[@class='button-1 login-button']


click_logout_link

    Click Link                 xpath://a[contains(text(),'Logout')]

Error_message_login_application

    Page Should Contain        Login was unsuccessful

dashboard_succes_application

    Page Should Contain        Dashboard
