; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Troid"
#define MyAppVersion "1.0"
#define MyAppURL "https://github.com/thiwaK/troid"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E462AD1E-B240-42E5-9D71-E2FCAAC0757C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=C:\Users\TK\Desktop\tools\licence.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=mysetup
SetupIconFile=C:\Users\TK\Desktop\tools\Troid.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\TK\Desktop\tools\7za.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\ApkShellext2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\apktool.jar"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\Compress_APK.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\debug.keystore"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\Decompile.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\decompile.cmd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\licence.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\Recompile.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\Sign.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\signapk.jar"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\testkey.pk8"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\testkey.x509.pem"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\Troid.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\Troid_reg.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\uninstall.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\TK\Desktop\tools\zipalign.exe"; DestDir: "{app}"; Flags: ignoreversion

Source: "C:\Users\TK\Desktop\tools\es-ES\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\TK\Desktop\tools\Frameworks\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\TK\Desktop\tools\dex2jar\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\TK\Desktop\tools\jd-gui\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\Troid_reg.bat";

[UninstallRun]
Filename: "{app}\uninstall.bat"; RunOnceId: "Clear registery"



