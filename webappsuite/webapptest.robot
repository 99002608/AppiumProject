*** Settings ***
Library    AppiumLibrary   
 

*** Test Cases ***
FBInValidCredentialTest
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2    browserName=chrome
    ...    chromedriverExecutable=${EXECDIR}${/}driver${/}chromedriver.exe 
    Go To Url    url=https://m.facebook.com/
    Input Text    //*[@id="m_login_email"]    8888884546
    Input Password    //*[@id="m_login_password"]    8888884546
    Sleep    2s    
    Click Element    //button[@name="login"]
    Sleep    5s    
    Page Should Contain Text    Invalid username or password       
    
MagentoValidCredentialTest
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2    browserName=chrome
    ...    chromedriverExecutable=${EXECDIR}${/}driver${/}chromedriver.exe 
    Go To Url    url=https://magento.com/
    Click Element    //button[@class="nav-menu-button js-menu-button visible-xs visible-sm"]
    Wait Until Element Is Visible    //*[text()='My Account']    
    Click Element    //*[text()='My Account']
    Wait Until Page Contains Element    //input[@id='email']    
    Input Text    //input[@id='email']    balaji0017@gmail.com
    Wait Until Page Contains Element    //input[@id='pass']     
    Input Password    //input[@id='pass']    welcome@12345  
    Wait Until Page Contains Element   //button[@id="send2"]   
    Click Element    //button[@id="send2"]
    Click Element    //button[@id="send2"]
    Sleep    2s 
    Wait Until Element Is Visible    //a[contains(text(),'Log Out')]    
    Page Should Contain Element    //a[contains(text(),'Log Out')]
    Sleep    2s  
    Close Application 
    

     
    
    