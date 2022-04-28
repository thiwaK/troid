
@echo off
color 0a
cd /d "%~dp0"

set APK=%1
set CurrentDir="%cd%"


echo.
echo. [1] : Resources + Source
echo. [2] : Resources Only
echo. [3] : Source Only
echo. [4] : Resources Only. Match original
echo. [5] : Source Only. Match original
echo.
echo. ============================
echo.
echo.
echo.
echo.
set /p _ok= Enter your choice: 


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


IF %_ok%==1 goto Decompile1
IF %_ok%==2 goto Decompile2
IF %_ok%==3 goto Decompile3
IF %_ok%==4 goto Decompile4
IF %_ok%==5 goto Decompile5


:Decompile1
java -jar "%cd%\apktool.jar" d -f -o %Out% %APK%
goto last

:Decompile2
java -jar "%cd%\apktool.jar" d -f -s -o %Out% %APK%
goto last

:Decompile3
java -jar "%cd%\apktool.jar" d -f -r -o %Out% %APK%
goto last

:Decompile4
java -jar "%cd%\apktool.jar" d -f -s -m -o %Out% %APK%
goto last

:Decompile5
java -jar "%cd%\apktool.jar" d -f -r -m -o %Out% %APK%
goto last

:last
echo.
echo. Complete : Yes
echo.

if exist %Out%\apktool.yml (GOTO Success)
color 0c
echo. Success : No
echo.
echo. Ended : %day2%-%month2%-%year2% %hour2%:%min2%:%sec2%
echo.
echo.
log.txt
pause

:Success
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
