unit uWTFO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TWTFOForm = class(TForm)
    lblAreYouKidding: TLabel;
    btnYes: TButton;
    btnNo: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TWTFOForm.FormCreate(Sender: TObject);
begin
  btnYes.Caption := 'I am not kidding.  I am serious.  I really do want to turn the CapsLock key back on.';
  btnNo.Caption := 'No, you are right -- what could I possibly have been thinking?';
end;

end.
