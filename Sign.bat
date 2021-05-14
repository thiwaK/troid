
@echo off
color 0a

cd /d "%~dp0"
set Folder=%1
set Out2="%Folder:~1,-5%_Sign.apk"

:Compile
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set dayname2=%%d
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set day2=%%f
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set month2=%%e
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set year2=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set hour2=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set min2=%%h
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set sec2=%%i
cls


title Troid : Signing


IF EXIST %Out2% echo. && echo. Deleting Old APK ... && del "%Out2%" >nul
IF %errorlevel% EQU 1 cls && echo. && color 0c && echo. Error Deleting Old File ! 

echo.
echo. Started : %day2%-%month2%-%year2% %hour2%:%min2%:%sec2%
echo.
echo.
echo. Signing : %Folder:~1,-1%
echo.
echo.
color 0e

java -jar signapk.jar -w testkey.x509.pem testkey.pk8 %Folder% %Out2%
set A=Yes
if %errorlevel% == 1 set A=No && color 0c
echo.
echo. Complete : Yes
echo.


for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set dayname=%%d
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set day=%%f
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set month=%%e
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set year=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set hour=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set min=%%h
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set sec=%%i


echo. Success : %A%
echo.
echo.
echo.
echo.
echo. Ended : %day%-%month%-%year% %hour%:%min%:%sec%
pause > nul
exit