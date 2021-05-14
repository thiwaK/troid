@echo off
color 0a

reg add "HKCR\.apk" /f /ve /t REG_SZ /d ""
reg delete "HKCU\Software\Classes\.apk" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.apk" /f >nul 2>&1
reg delete "HKCR\jarfile\shell\decompile" /f >nul 2>&1

::: Reg apk extention for dubble click install
reg add "HKLM\SOFTWARE\Classes\.apk" /f /ve /t REG_SZ /d "APKFile"
reg add "HKLM\SOFTWARE\Classes\APKFile" /f /ve /t REG_SZ /d "Android App"
reg add "HKLM\SOFTWARE\Classes\APKFile" /f /v "FriendlyTypeName" /t REG_SZ /d "Android App"
reg add "HKLM\SOFTWARE\Classes\APKFile" /f /v "EditFlags" /t REG_DWORD /d "00000002"
reg add "HKLM\SOFTWARE\Classes\APKFile\shell" /f /ve /t REG_SZ /d "open"
reg add "HKLM\SOFTWARE\Classes\APKFile\shell\open\command" /f /ve /t REG_SZ /d "cmd.exe /c color 1b  && echo.&& echo ================================ && echo installing && echo ================================ &&  echo.&&  echo. &&  echo. &&  echo. && adb install \"%%1\" && ping localhost -n 2 >nul"


::: Open with list add

reg add "HKLM\SOFTWARE\Classes\APKFile\shell\decompile" /f /ve /t REG_SZ /d "Open Classes.dex by JD-GUI"
reg add "HKLM\SOFTWARE\Classes\APKFile\shell\decompile\command" /f /ve /t REG_SZ /d "\"%~dp0decompile.cmd\" \"%%1\""

reg add "HKLM\SOFTWARE\Classes\APKFile\shell\Sign" /f /ve /t REG_SZ /d "Sign Apk With Test-key"
reg add "HKLM\SOFTWARE\Classes\APKFile\shell\Sign\command" /f /ve /t REG_SZ /d "\"%~dp0Sign.bat\" \"%%1\""


reg add "HKCR\folder\shell\recompile" /f /ve /t REG_SZ /d "Recompile"
reg add "HKCR\folder\shell\recompile\command" /f /ve /t REG_SZ /d "\"%~dp0Recompile.bat\" \"%%1\""

reg add "HKCR\folder\shell\Compress" /f /ve /t REG_SZ /d "Compress APK with Sign"
reg add "HKCR\folder\shell\Compress\command" /f /ve /t REG_SZ /d "\"%~dp0Compress_APK.bat\" \"%%1\""

reg add "HKLM\SOFTWARE\Classes\APKFile\shell\disassemble" /f /ve /t REG_SZ /d "Decompile"
reg add "HKLM\SOFTWARE\Classes\APKFile\shell\disassemble\command" /f /ve /t REG_SZ /d "\"%~dp0Decompile.bat\" \"%%1\""


echo %PROCESSOR_IDENTIFIER% | FIND /i "x86"

set FRAMEWORK=%windir%\Microsoft.NET\Framework
set DOTNETVERSION=v4.0.30319
IF %ERRORLEVEL%==1 (
  set FRAMEWORK=%FRAMEWORK%64
)
set REGASM="%FRAMEWORK%\%DOTNETVERSION%\regasm.exe"
%REGASM% /codebase "%~dp0\apkshellext2.dll"

pause