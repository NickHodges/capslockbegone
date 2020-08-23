unit uMainCapsLock;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, System.UITypes;

type
  TArrayOfTwentyBytes = array[0..19] of Byte;
  TArrayOfTwentyFourBytes = array[0..23] of Byte;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    ChooserGroup: TRadioGroup;
    btnDoIt: TButton;
    btnQuit: TButton;
    btnAbout: TButton;
    procedure GoodbyeCapslockClick(Sender: TObject);
    procedure ChooserGroupClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDoItClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
  private
    procedure WriteByteArrayToRegistry(aArray: TArrayOfTwentyBytes); overload;
    procedure WriteByteArrayToRegistry(aArray: TArrayOfTwentyFourBytes); overload;
    procedure MakeCapsLockKeyDoNothing;
    procedure CapsLockKeyIsShiftKey;
    procedure EverythingBackToNormal;
    procedure SwapControlKeyAndCapslockKey;
    procedure Reboot;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  Registry, uWTFO, uAbout, uReboot, NixUtils, uStrings;

const
  KeyName = 'SYSTEM\CurrentControlSet\Control\Keyboard Layout\';
  ScanCodeMap = 'Scancode Map';

  // These are just binary bit patterns that Windows uses to do things to your
  // keyboard.  They get written out to the registry.
  CapsLockGone: TArrayOfTwentyBytes               = (0,0,0,0,0,0,0,0,2,0,0,0,0,0,$3A,0,0,0,0,0);
  CapsLockBack: TArrayOfTwentyBytes               = (0,0,0,0,0,0,0,0,2,0,0,0,$3A,0,$3A,0,0,0,0,0);
  CapsLockToShift: TArrayOfTwentyBytes            = (0,0,0,0,0,0,0,0,2,0,0,0,$2A,0,$3A,0,0,0,0,0);
  SwapCapsLockAndControl: TArrayOfTwentyFourBytes = (0,0,0,0,0,0,0,0,3,0,0,0,$3A,0,$1D,0,$1D,0,$3A,0,0,0,0,0);


procedure TMainForm.MakeCapsLockKeyDoNothing;
begin
  WriteByteArrayToRegistry(CapsLockGone);
end;

procedure TMainForm.ChooserGroupClick(Sender: TObject);
var
  WTFOForm: TWTFOForm;
  DlgResult: TModalResult;
begin
  if ChooserGroup.ItemIndex = 3 then
  begin
    WTFOForm := TWTFOForm.Create(Self);
    DlgResult := WTFOForm.ShowModal;
    if DlgResult = mrOk then
    begin
      MessageDlg(rsOkayWhatever, mtInformation, [mbOk], 0);
    end else
    begin
      MessageDlg(rsExcellentChoice, mtInformation, [mbOk], 0);
      ChooserGroup.ItemIndex := 0;
    end;
  end;

  Assert(ChooserGroup.Items.Count = 4, rsTheRadioGroupHasMore);
  case ChooserGroup.ItemIndex of
    0: begin
         btnDoIt.Caption := rsDisable;
       end;
    1: begin
         btnDoIt.Caption := rsMakeShift;
       end;
    2: begin
        btnDoIt.Caption := rsMakeControl;
       end;
    3: begin
         btnDoIt.Caption := rsBackToNormal;
       end;
  else
    Assert(False, rsAnImpossibleEvent);
  end;
end;

procedure TMainForm.btnAboutClick(Sender: TObject);
var
  AboutBox: TAboutBox;
begin
  AboutBox := TAboutBox.Create(Self);
  try
    AboutBox.ShowModal;
  finally
    AboutBox.Free;
  end;
end;

procedure TMainForm.btnDoItClick(Sender: TObject);
begin
  Assert(ChooserGroup.Items.Count = 4, rsTheRadioGroupHasMore);
  case ChooserGroup.ItemIndex of
    0: begin
         MakeCapsLockKeyDoNothing;
       end;
    1: begin
         CapsLockKeyIsShiftKey;
       end;
    2: begin
         SwapControlKeyAndCapslockKey;
       end;
    3: begin
         EverythingBackToNormal;
       end;
  else
    Assert(False, rsAnImpossibleEvent);
  end;
  Reboot;
end;

procedure TMainForm.Reboot;
var
  RebootForm: TRebootForm;
begin
  RebootForm := TRebootForm.Create(Self);
  try
    if RebootForm.ShowModal = mrOk then
    begin
      WindowsExit(EWX_REBOOT or EWX_FORCE) ;
    end;
  finally
    RebootForm.Free;
  end;
end;

procedure TMainForm.btnQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.CapsLockKeyIsShiftKey;
begin
  WriteByteArrayToRegistry(CapsLockToShift);
end;

procedure TMainForm.EverythingBackToNormal;
begin
  WriteByteArrayToRegistry(CapsLockBack);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  btnDoIt.Caption := rsDisable;
end;

procedure TMainForm.SwapControlKeyAndCapslockKey;
begin
  WriteByteArrayToRegistry(SwapCapsLockAndControl);
end;

procedure TMainForm.GoodbyeCapslockClick(Sender: TObject);
begin
  MakeCapsLockKeyDoNothing;
end;

procedure TMainForm.WriteByteArrayToRegistry(aArray: TArrayOfTwentyFourBytes);
var
  RegEntry: TRegistry;
begin
  RegEntry := TRegistry.Create;
  try
    RegEntry.RootKey := HKEY_LOCAL_MACHINE;
    RegEntry.OpenKey(KeyName, True);
    RegEntry.WriteBinaryData(ScanCodeMap, aArray, SizeOf(aArray));
  finally
    RegEntry.Free;
  end;
end;

procedure TMainForm.WriteByteArrayToRegistry(aArray: TArrayOfTwentyBytes);
var
  RegEntry: TRegistry;
begin
  RegEntry := TRegistry.Create;
  try
    RegEntry.RootKey := HKEY_LOCAL_MACHINE;
    RegEntry.OpenKey(KeyName, True);
    RegEntry.WriteBinaryData(ScanCodeMap, aArray, SizeOf(aArray));
  finally
    RegEntry.Free;
  end;
end;

end.
