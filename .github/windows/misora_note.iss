#define MyAppName "美空笔记"
#define MyAppExeName "misora_note.exe"
#define MyAppVersion GetEnv("VERSION")
#define MyReleaseTag GetEnv("GITHUB_REF_NAME")

#if MyAppVersion == ""
  #error VERSION environment variable is required
#endif

#if MyReleaseTag == ""
  #error GITHUB_REF_NAME environment variable is required
#endif

[Setup]
AppId={{6B30697B-5D89-4E50-A500-160A8F1D8D51}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher=小明信息
DefaultDirName={localappdata}\Programs\MisoraNote
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=..\..\dist
OutputBaseFilename=misora_note_{#MyReleaseTag}_windows_x64_setup
SetupIconFile=..\..\windows\runner\resources\app_icon.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
CloseApplications=force
RestartApplications=no

[Languages]
Name: "chinesesimplified"; MessagesFile: "ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "创建桌面快捷方式"; GroupDescription: "附加快捷方式："; Flags: unchecked

[Files]
Source: "..\..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "运行 {#MyAppName}"; Flags: nowait postinstall skipifsilent
