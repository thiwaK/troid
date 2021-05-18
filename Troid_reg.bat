@echo off
color 0a

echo. -------------------------------------
echo.     Troid Register v 1.0
echo. -------------------------------------

echo. 
echo. 
echo. Deleting old regiter entaries ...
echo. -------------------------------------
reg add "HKCR\.apk" /f /ve /t REG_SZ /d ""
reg delete "HKCU\Software\Classes\.apk" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.apk" /f >nul 2>&1
reg delete "HKCR\jarfile\shell\decompile" /f >nul 2>&1

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
echo. Adding context menu 1/2 ...
echo. -------------------------------------
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid" /f /v "SubCommands" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid" /f /v "MUIVerb" /t REG_SZ /d "Troid"
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid" /f /v "Icon" /t REG_SZ /d ""

reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compile" /f /v "MUIVerb" /t REG_SZ /d "Compile as APK"
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compile" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compile\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe"

reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compress" /f /v "MUIVerb" /t REG_SZ /d "Compress as APK"
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compress" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\Folder\shell\Troid\shell\Compress\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe"




::: Apk context menu
echo. 
echo. 
echo. Adding context menu 2/2 ...
echo. -------------------------------------
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f /v "SubCommands" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f /v "MUIVerb" /t REG_SZ /d "Troid"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f /v "Icon" /t REG_SZ /d ""

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Compile" /f /v "MUIVerb" /t REG_SZ /d "Compile"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Compile" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Compile\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe /K echo \"%%1\""

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile" /f /v "MUIVerb" /t REG_SZ /d "Decompile"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Decompile\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe"

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Extract" /f /v "MUIVerb" /t REG_SZ /d "Extract"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Extract" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Extract\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe"

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Install" /f /v "MUIVerb" /t REG_SZ /d "Install"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Install" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Install\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe"

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\JD" /f /v "MUIVerb" /t REG_SZ /d "Open with JD-GUI"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\JD" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\JD\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe"

reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Sign" /f /v "MUIVerb" /t REG_SZ /d "Sign with testkey"
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Sign" /f /v "Icon" /t REG_SZ /d ""
reg add "HKEY_CLASSES_ROOT\APKFile\shell\Troid\shell\Sign\command" /f /ve /t REG_SZ /d "%SystemRoot%\system32\cmd.exe"



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

pause