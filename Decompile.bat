
@echo off
color 0a
cd /d "%~dp0"

set APK=%1
set CurrentDir="%cd%"

goto Decompile
echo.
echo. [1] : Compile
echo. [2] : Decompile
echo.
echo. ============================
echo.
echo.
echo.
echo.
set /p _ok= Enter your choice: 


IF %_ok%==1 goto Compile
IF %_ok%==2 goto Decompile



:: ============================================================================================
:Decompile
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set dayname2=%%d
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set day2=%%f
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set month2=%%e
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set year2=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set hour2=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set min2=%%h
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set sec2=%%i
cls





set Out="%APK:~1,-5%"
title Troid : Decompiling 



echo.
echo.Decompiling : %1
echo. 

echo.Started : %day2%-%month2%-%year2% %hour2%:%min2%:%sec2%
echo. 
color 0b
java -jar "%cd%\apktool.jar" if %APK%
:::java -jar "%cd%\apktool.jar" d -f -p "%cd%\Frameworks" -o %Out% %APK%
java -jar "%cd%\apktool.jar" d -f -o %Out% %APK%
echo.
echo. Complete : Yes
echo.



if exist %Out%\apktool.yml (GOTO DecompileFile_3)
color 0c
echo. Success : No
echo.
echo. Ended : %day2%-%month2%-%year2% %hour2%:%min2%:%sec2%
echo.
echo.
log.txt
pause

:DecompileFile_3
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set dayname=%%d
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set day=%%f
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set month=%%e
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set year=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set hour=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set min=%%h
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set sec=%%i
echo. Success : Yes
echo.
echo. Ended : %day%-%month%-%year% %hour%:%min%:%sec%
timeout 3 > nul
exit
