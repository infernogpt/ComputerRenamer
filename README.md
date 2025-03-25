# Inferno Computer Renamer

## Overview

The Inferno Computer Renamer is a script designed to help you easily rename your computer. The script is simple and user-friendly, ensuring that you can rename your machine with minimal effort.
- If Windows Prompts You Will A Blue Screen Saying "Windows Protected Your PC" Dont Worry, Its Because the Application Is Not Signed. It Is Completely Safe. 
## Features

- Prompts the user for a new computer name.
- Asks for confirmation before proceeding with the rename.
- Renames the computer using the provided name.
- Restarts the computer to apply the changes.

## Getting Started

### Prerequisites

- Administrator privileges are required to run the script.
- Windows operating system.

### Usage

1. Download the `RenameComputer.bat` script.
2. Run the script with administrative privileges.
3. Follow the on-screen prompts to enter the new computer name and confirm the rename action.

### Script Details

```batch
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
```

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or issues, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Thanks to the open-source community for providing the tools and resources that made this project possible.
