@echo off
color 0a

echo. -------------------------------------
echo.     Troid Register v 2.0
echo. -------------------------------------


@REM >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
@REM if '%errorlevel%' NEQ '0' (
@REM     echo Requesting administrative privileges...
@REM     goto UACPrompt
@REM ) else ( goto gotAdmin )

@REM :UACPrompt
@REM     echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
@REM     echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
@REM     "%temp%\getadmin.vbs"
@REM     exit /B

@REM :gotAdmin
@REM     if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
@REM     pushd "%CD%"
@REM     CD /D "%~dp0"


set JAVA=bin\runtime\bin\java.exe
if exist %JAVA% goto :runinst

if defined JAVA_HOME (set base="%JAVA_HOME%\bin") else (set base="%SystemRoot%\System32")
set JAVA=%base%\java.exe

if exist %JAVA% goto :runinst
for /F "delims=" %%i in ('where java') do set JAVA="%%i"
if exist %JAVA% goto :runinst
echo Troid requires a Java JRE or JDK version 8 or above. Recommended version: 8.191
echo It is also recommended to set JAVA_HOME and JRE_HOME environment variables to point to your JDK
echo.
echo Press enter to continue
pause > nul
exit

:runinst

echo. 
echo. 
echo. Deleting old regiter entaries ...
echo. -------------------------------------
reg add "HKCR\.apk" /f /ve /t REG_SZ /d ""
reg delete "HKEY_CLASSES_ROOT\Folder\shell\Troid" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f >nul 2>&1
@REM reg delete "HKCU\Software\Classes\.apk" /f >nul 2>&1
@REM reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.apk" /f >nul 2>&1
@REM reg delete "HKCR\jarfile\shell\decompile" /f >nul 2>&1
@REM reg delete "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f >nul 2>&1


echo. 
echo. 
echo. Regitering apk extention ...
echo. -------------------------------------
reg add "HKLM\SOFTWARE\Classes\.apk" /f /ve /t REG_SZ /d "APKFile"
reg add "HKLM\SOFTWARE\Classes\APKFile" /f /ve /t REG_SZ /d "Android App"
reg add "HKLM\SOFTWARE\Classes\APKFile" /f /v "FriendlyTypeName" /t REG_SZ /d "Android App"


::: Folder context menu
echo. 
echo. 
echo. Adding context menu for folders 1/2 ...
echo. -------------------------------------
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid" /f /v "SubCommands" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid" /f /v "MUIVerb" /t REG_SZ /d "Troid"
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid" /f /v "Icon" /t REG_SZ /d "\"%~dp0Troid.ico\"

reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compress" /f /v "MUIVerb" /t REG_SZ /d "Compress as APK"
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compress" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compress\command" /f /ve /t REG_SZ /d "\"%~dp0Compress_APK.bat\" \"%%1\""

::: Folder build sub context menu
@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build" /f /v "SubCommands" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build" /f /v "MUIVerb" /t REG_SZ /d "Recompile"
@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build" /f /v "Icon" /t REG_SZ /d ""

reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build" /f /v "MUIVerb" /t REG_SZ /d "Recompile"
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build\command" /f /ve /t REG_SZ /d "\"%~dp0Recompile.bat\" \"%%1\""

@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build\shell\debug" /f /v "MUIVerb" /t REG_SZ /d "debuggable"
@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build\shell\debug" /f /v "Icon" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build\shell\debug\command" /f /ve /t REG_SZ /d "\"%~dp0Recompile.bat\" \"%%1\""

@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build\shell\nodebug" /f /v "MUIVerb" /t REG_SZ /d "force-all"
@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build\shell\nodebug" /f /v "Icon" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\build\shell\nodebug\command" /f /ve /t REG_SZ /d "\"%~dp0Recompile.bat\" \"%%1\""


::: Apk context menu
echo. 
echo. 
echo. Adding context menu for apk 2/2 ...
echo. -------------------------------------
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f /v "SubCommands" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f /v "MUIVerb" /t REG_SZ /d "Troid"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f /v "Icon" /t REG_SZ /d "\"%~dp0Troid.ico\"

@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Extract" /f /v "MUIVerb" /t REG_SZ /d "Extract"
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Extract" /f /v "Icon" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Extract\command" /f /ve /t REG_SZ /d "\"%~dp07za.exe\" e -o %%1 _extract  \"%%1\""

@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Install" /f /v "MUIVerb" /t REG_SZ /d "Install"
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Install" /f /v "Icon" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Install\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe"

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\JD" /f /v "MUIVerb" /t REG_SZ /d "Open with JD-GUI"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\JD" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\JD\command" /f /ve /t REG_SZ /d "\"%~dp0decompile.cmd\" \"%%1\""

@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Signdebug" /f /v "MUIVerb" /t REG_SZ /d "Sign with debug-key"
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Signdebug" /f /v "Icon" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Signdebug\command" /f /ve /t REG_SZ /d "\"%~dp0Sign.bat\" \"%%1\""

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Sign" /f /v "MUIVerb" /t REG_SZ /d "Sign with testkey"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Sign" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Sign\command" /f /ve /t REG_SZ /d "\"%~dp0Sign.bat\" \"%%1\""


::: Decomplie sub context menu
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile" /f /v "SubCommands" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile" /f /v "MUIVerb" /t REG_SZ /d "Decompile"
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile" /f /v "Icon" /t REG_SZ /d ""

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile" /f /v "MUIVerb" /t REG_SZ /d "Decompile"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile\command" /f /ve /t REG_SZ /d "\"%~dp0Decompile.bat\" \"%%1\""

@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile\shell\resources" /f /v "MUIVerb" /t REG_SZ /d "no-res"
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile\shell\resources" /f /v "Icon" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile\shell\resources\command" /f /ve /t REG_SZ /d "\"%~dp0Decompile.bat\" \"%%1\""

@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile\shell\source" /f /v "MUIVerb" /t REG_SZ /d "no-src"
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile\shell\source" /f /v "Icon" /t REG_SZ /d ""
@REM reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile\shell\source\command" /f /ve /t REG_SZ /d "\"%~dp0Decompile.bat\" \"%%1\""


echo. 
echo. 
echo. Register other tools ...
echo. -------------------------------------
echo %PROCESSOR_IDENTIFIER% | FIND /i "x86"

set FRAMEWORK=%windir%\Microsoft.NET\Framework
set DOTNETVERSION=v4.0.30319
IF %ERRORLEVEL%==1 (
  set FRAMEWORK=%FRAMEWORK%64
)
set REGASM="%FRAMEWORK%\%DOTNETVERSION%\regasm.exe"
%REGASM% /codebase "%~dp0\apkshellext2.dll"

