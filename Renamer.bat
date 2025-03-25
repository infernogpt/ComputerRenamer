@echo off
setlocal

:: Display banner with big letters
echo  ____  _____ _   _  ____  __  __ _____ ____  
echo |  _ \| ____| \ | |/ ___||  \/  | ____|  _ \ 
echo | |_) |  _| |  \| | |  _ | |\/| |  _| | |_) |
echo |  _ <| |___| |\  | |_| || |  | | |___|  _ < 
echo |_| \_\_____|_| \_|\____||_|  |_|_____|_| \_\
echo.
echo Welcome to the Inferno Computer Renamer Script!
echo.

:: Prompt for the new computer name
set /p newComputerName=Enter the new computer name: 

:: Confirm the rename action
set /p confirm=Are you sure you want to rename the computer to "%newComputerName%"? (Y/N): 

:: Check user input and proceed accordingly
if /i "%confirm%" neq "Y" (
    echo Operation cancelled.
    exit /b 0
)

:: Rename the computer
wmic computersystem where name="%COMPUTERNAME%" call rename name="%newComputerName%"

:: Check if the rename command was successful
if %errorlevel% neq 0 (
    echo Failed to rename the computer. Please try again.
    exit /b %errorlevel%
)

:: Restart the computer to apply the changes
shutdown /r /t 0

endlocal
