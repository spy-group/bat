@echo off
:: Set paths
set "sourceFile=C:\path\to\Antivirus.exe"
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "targetFile=%startupFolder%\Antivirus.exe"

:CheckFile
if not exist "%targetFile%" (
    echo File missing. Restoring...
    if exist "%sourceFile%" (
        copy "%sourceFile%" "%targetFile%" /Y
        echo File restored to the Startup folder.
    ) else (
        echo Source file not found. Please check the source file path.
    )
) else (
    echo File exists in the Startup folder.
)

:: Wait for 30 seconds before checking again
timeout /t 30 >nul
goto CheckFile
