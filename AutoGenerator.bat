@echo off

set /p PROJECT_NAME=Enter project name: 
set /p PACKAGE_NAME=Enter package name: 
set /p LANGUAGE=Enter programing language: 

echo Creating new project %PROJECT_NAME% at this direction...

echo cocos new %PROJECT_NAME% -p %PACKAGE_NAME% -l %LANGUAGE% -d .

set FILENAME=%PROJECT_NAME%_auto_cmake

#echo @echo off > %FILENAME%.bat
#echo cd %PROJECT_NAME%/proj.win32 >> %FILENAME%.bat
#echo cmake .. -G"Visual Studio 16 2019" -A Win32 >> %FILENAME%.bat

call cocos new %PROJECT_NAME% -p %PACKAGE_NAME% -l %LANGUAGE% -d .
call cd %PROJECT_NAME%/proj.win32
call cmake .. -G"Visual Studio 16 2019" -A Win32

if errorlevel 1 goto error

echo Project created successfully.

goto end

:error
echo An error occurred during project creation.

@echo off 

cd %PROJECT_NAME%/proj.win32
cmake .. -G"Visual Studio 16 2019" -A Win32