@ECHO OFF


@REM reg del "HKLM\SOFTWARE\Classes\.apk" /f /ve /t REG_SZ /d "APKFile"
@REM reg del "HKLM\SOFTWARE\Classes\APKFile" /f /ve /t REG_SZ /d "Android App"
@REM reg del "HKLM\SOFTWARE\Classes\APKFile" /f /v "FriendlyTypeName" /t REG_SZ /d "Android App"

reg delete "HKEY_CLASSES_ROOT\Folder\shell\Troid" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\APKFile\shell\Troid" /f >nul 2>&1


echo %PROCESSOR_IDENTIFIER% | FIND /i "x86"

set FRAMEWORK=%windir%\Microsoft.NET\Framework
set DOTNETVERSION=v4.0.30319
IF %ERRORLEVEL%==1 (
  set FRAMEWORK=%FRAMEWORK%64
)
set REGASM="%FRAMEWORK%\%DOTNETVERSION%\regasm.exe"
%REGASM% /unregister "%~dp0\apkshellext2.dll"

