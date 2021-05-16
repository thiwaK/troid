@echo off
title Compiling
color 0a
set abc=%1
set cde="%abc:~1,-1%.apk"
set Folder=%cde%
set Out2="%Folder:~1,-5%_Sign.apk"

del %cde% >nul
del %Out2% >nul



:Start
cls
title Troid : Compressing APK
echo.============================================
echo.      Compressing ... 
echo.============================================
echo.
echo.
echo.
echo.


"%~dp07za.exe" a -tzip %cde% "%abc%\*" -mx9 -aoa

IF ERRORLEVEL 1 (
  color 0c
  ECHO.
  ECHO  ***************************** Compressing Faild *****************************
  ECHO.
  ECHO.                          
  ECHO.
  pause
  exit
)  


:Start
cls
ping localhost -n 3 >nul
title Troid : Signing APK with Testkey
echo.============================================
echo.      Signing ... 
echo.============================================
echo.
echo.
echo.
echo.


java -jar "%~dp0signapk.jar" -w "%~dp0testkey.x509.pem" "%~dp0testkey.pk8" %Folder% %Out2%

IF ERRORLEVEL 1 (
  color 0c
  ECHO.
  ECHO  ***************************** Compressing Faild *****************************
  ECHO.
  ECHO.                          
  ECHO.
  pause
  exit
)  

set "reply=y"
set /p "reply=Do you want to install your apk now [y|n]: "
if /i not "%reply%" == "y" goto :eof
if /i not "%reply%" == "Y" goto :eof


cls
title Troid : Installing APK
ping localhost -n 3 >nul

echo. ============================================
echo.      Installing ...
echo. ============================================
echo.
echo.
echo.
echo.

adb install -r %cde%
ping localhost -n 5 >nul
exit
IF ERRORLEVEL 1 (
  color 0c
  ECHO.
  ECHO  ***************************** Installing Faild *****************************
  ECHO.
  ECHO                         
  ECHO.
  pause
  exit
  
)

