
@echo off
color 0a

cd /d "%~dp0"
set Folder=%1
set Out2="%Folder:~1,-1%_unsign.apk"
set Out3="%Folder:~1,-1%_sign.apk"


:Compile
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set dayname2=%%d
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set day2=%%f
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set month2=%%e
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do set year2=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set hour2=%%g
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set min2=%%h
for /f "tokens=1-5 delims=: " %%g in ("%time%") do set sec2=%%i
cls


title Troid : Compiling APK


IF EXIST %Out2% echo. && echo.Deleting Old APK ... && del %Out2% >nul
IF %errorlevel% EQU 1 cls && echo. && color 0c && echo. Error Deleting Old File ! 

IF EXIST %Out3% echo. && echo.Deleting Old APK ... && del %Out3% >nul
IF %errorlevel% EQU 1 cls && echo. && color 0c && echo. Error Deleting Old File ! 

echo.
echo.Started : %day2%-%month2%-%year2% %hour2%:%min2%:%sec2%
echo.
echo.
color 0e

java -jar apktool.jar b -f -p "%cd%\Frameworks" -o %Out2% %Folder% 
set A=Yes
if %errorlevel% == 1 set A=No && color 0c && goto end
echo.
echo. Complete : Yes
echo.

echo.
echo. Signing ...
echo.
echo.
java -jar signapk.jar -w testkey.x509.pem testkey.pk8 %Out2% %Out3%
set A=Yes
if %errorlevel% == 1 set A=No && color 0c
:end
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
echo.
echo. Success : %A%
echo.

echo. Ended : %day%-%month%-%year% %hour%:%min%:%sec%

pause > nul
exit