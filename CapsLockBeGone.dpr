program CapsLockBeGone;

uses
  Forms,
  uMainCapsLock in 'uMainCapsLock.pas' {MainForm},
  uWTFO in 'uWTFO.pas' {WTFOForm},
  uAbout in 'uAbout.pas' {AboutBox},
  uReboot in 'uReboot.pas' {RebootForm},
  uStrings in 'uStrings.pas',
  NixUtils in 'C:\Documents and Settings\nhodges\My Documents\nixutils\NixUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
