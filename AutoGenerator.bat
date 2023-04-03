@echo off

set /p PROJECT_NAME=Enter project name: 
set /p PACKAGE_NAME=Enter package name: 
set /p LANGUAGE=Enter programing language: 

echo MESSAGE: Creating %PROJECT_NAME% project at this direction...

echo EXEC COMMAND: cocos new %PROJECT_NAME% -p %PACKAGE_NAME% -l %LANGUAGE% -d .

call cocos new %PROJECT_NAME% -p %PACKAGE_NAME% -l %LANGUAGE% -d .
call cd %PROJECT_NAME%/proj.win32
call cmake .. -G"Visual Studio 16 2019" -A Win32

if errorlevel 1 goto error

call echo MESSAGE: Project created successfully.

goto end

:error
echo An error occurred during project creation.
