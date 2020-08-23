unit uAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

resourcestring
  strVersion = 'Version';

implementation

{$R *.dfm}

uses
        NixUtils
      ;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  Copyright.Caption := MakeCopyrightNotice('Nick Hodges');
  Version.Caption := VersionString(strVersion, False)
end;

end.
 
