
@echo off
color 0a

cd /d "%~dp0"
set Folder=%1
set Out2="%Folder:~1,-1%_unsign.apk"
set Out3="%Folder:~1,-1%_sign.apk"

echo.
echo. [1] : With debuginfo. Skip changes detection
echo. [2] : With debuginfo
echo. [3] : Copy original. Disable crunching of resource
echo. [4] : Skip changes detection
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


title Troid : Compiling APK


IF EXIST %Out2% echo. && echo.Deleting Old APK ... && del %Out2% >nul
IF %errorlevel% EQU 1 cls && echo. && color 0c && echo. Error Deleting Old File ! %Out2% && pause && exit

IF EXIST %Out3% echo. && echo.Deleting Old APK ... && del %Out3% >nul
IF %errorlevel% EQU 1 cls && echo. && color 0c && echo. Error Deleting Old File ! %Out3% && pause && exit

echo.
echo.Started : %day2%-%month2%-%year2% %hour2%:%min2%:%sec2%
echo.
echo.
color 0e

echo.
echo. Compiling ...

IF %_ok%==1 goto Compiling1
IF %_ok%==2 goto Compiling2
IF %_ok%==3 goto Compiling3
IF %_ok%==4 goto Compiling4



:Compiling1
java -jar apktool.jar b -f -d -p "%cd%\Frameworks" -o %Out2% %Folder% 
goto sign

:Compiling2
java -jar apktool.jar b -d -p "%cd%\Frameworks" -o %Out2% %Folder% 
goto sign

:Compiling3
java -jar apktool.jar b -nc -c -p "%cd%\Frameworks" -o %Out2% %Folder% 
goto sign

:Compiling4
java -jar apktool.jar b -f -p "%cd%\Frameworks" -o %Out2% %Folder% 
goto sign

:sign
set A=Yes
if %errorlevel% == 1 set A=No && color 0c && goto end
echo.
echo. Complete Compiling : Yes
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
echo. Complete Singning : Yes
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