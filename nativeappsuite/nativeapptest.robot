*** Settings ***
Library    AppiumLibrary




*** Test Cases ***
InstallAppTest
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2    app=${EXECDIR}${/}app${/}Khan Academy_v6.2.1_apkpure.com.apk
    Click Element    //*[@text='Profile']
    Wait Until Page Contains Element    //*[@text='Sign in']    
    Click Element    //*[@text='Sign in']
    Wait Until Page Contains Element    //*[@text='Enter an e-mail address or username']   
    Input Text    //*[@text='Enter an e-mail address or username']    text123
    Input Password    //*[@text='Password']    text123
    Hide Keyboard
    Sleep    2s     
    Wait Until Page Contains Element    //*[@content-desc='Sign in'] 
    Click Element    //*[@content-desc='Sign in']
    Wait Until Page Contains    Invalid password    
    Page Should Contain Text    Invalid password   
    ${msg}    Get Text    //*[contains(@text,'Invalid password')]
    Log To Console    ${msg}  
    
SignUpAppTest
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2    app=${EXECDIR}${/}app${/}Khan Academy_v6.2.1_apkpure.com.apk
    Click Element    //*[@text='Profile']
    Wait Until Page Contains Element    //*[@text='Sign up with email']
    Click Element    //*[@text='Sign up with email']
    Wait Until Page Contains Element    //*[@text='First name']    
    Input Text    //*[@text='First name']    Kavya
    Input Text    //*[@text='Last name']    Reddy
    Input Text    //*[@text='Email address']    ananthulakavya8kavya@gmail.com
    Input Text    //*[@text='Password']    kavya@123
    Click Element    //*[@text='Birthday']
    Wait Until Page Contains Element    //*[@text='Jun']    
    Click Element    //*[@text='Jun']
    Clear Text    //*[@text='Jun']
    Wait Until Page Contains Element    //*[@resource-id='android:id/numberpicker_input']    
    Input Text    //*[@resource-id='android:id/numberpicker_input']    Apr
    Wait Until Page Contains Element    //*[@text='01'] 
    Click Element    //*[@text='01']
    Clear Text    //*[@text='01']
    Sleep    2s    
    Input Text    xpath=(//*[@resource-id='android:id/numberpicker_input'])[2]    25
    Wait Until Page Contains Element    //*[@text='2000'] 
    Click Element    //*[@text='2000']
    Clear Text    //*[@text='2000']
    Input Text    xpath=(//*[@resource-id='android:id/numberpicker_input'])[3]    1998
    Click Element    //*[@text='OK']
    Wait Until Page Contains Element    //*[@text='CREATE']    
    Click Element    //*[@text='CREATE']
    
SwipeTest
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2    app=${EXECDIR}${/}app${/}Khan Academy_v6.2.1_apkpure.com.apk
    Wait Until Page Contains Element    //*[@text="Profile"]   
    FOR    ${i}    IN RANGE    1    100
        ${temp}    Run Keyword And Ignore Error    Get Webelement    //*[@text='Science']
        Exit For Loop If    '${temp}[0]'=='PASS'
        #Swipe    891    1089    887    711    1000   
        Swipe By Percent    50    75    50    25    1000              
    END
    Click Element    //*[@text="Science"]
    

OpenExistingApplication
     Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2 
    ...    appPackage=org.khanacademy.android    appActivity=org.khanacademy.android.ui.library.MainActivity
    ...    noReset=true
    Set Appium Timeout    10s
    Sleep    10s    
    Execute Adb Shell    input touchscreen swipe 500 900 500 400    

    
FetchAppTest
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2    app=${EXECDIR}${/}app${/}Fetch Pet Care_v4.1.6_apkpure.com.apk
    Wait Until Page Contains Element    //*[@text='Email Address']    
    Input Text    //*[@text='Email Address']    Kavya
    Input Text    //*[@text='Password']    Kavya
    Click Element     //*[@elementId='1f25f2e8-3e5b-4aa0-ba07-78982545d7a6']
    
WindowsApp
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=windows    deviceName=pixel 2    app=C:\\Windows\\system32\\notepad.exe
    
    



      