*** Settings ***

Library           DatabaseLibrary
Library           OperatingSystem



# only once to open mysql bank
Suite Setup       Connect To Database           pymysql               ${DBname}                                                                           ${DBuser}    ${DBPass}    ${DBHost}    ${DBPort}

#suite teardow
Suite Teardown    Disconnect From Database


*** Variable ***

# only once to open mysql bank

${DBname}         mydb
${DBuser}         root
${DBPass}         123mudar
${DBHost}         127.0.0.1
${DBPort}         3306

# localhost
# https://franz-see.github.io/Robotframework-Database-Library/api/0.5/DatabaseLibrary.html


*** Test Case ***


#Create Person table
#                 Sleep                         2
#                 ${output}                     Execute SQL String    Create table person (id integer, first_name varchar(20), last_name varchar(20));
#                 log to console                ${output}
#                 Should Be Equal As Strings    ${output}             None



Inserting Data person Table
    # This is a single input
    #Sleep                         2
    #${output}                     Execute SQL String    Insert into person values (101, "vini", "pinho");
    ${output}                     Execute SQL Script    /home/elsys/Documents/vscode_robot_git/robot_frame_SDET/TestCase_020/my_sql_table/insert_to_mydb.sql
    log to console                ${output}
    Should Be Equal As Strings    ${output}             None