unit uReboot;

interface

uses
   Forms, StdCtrls, Controls, uStrings, Classes;

type
  TRebootForm = class(TForm)
    lblMessage: TLabel;
    btnReboot: TButton;
    btnNoReboot: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


procedure TRebootForm.FormCreate(Sender: TObject);
begin
  btnReboot.Caption := rsGoAheadReboot;
  btnNoReboot.Caption := rsNoIWillWait;
end;

end.
