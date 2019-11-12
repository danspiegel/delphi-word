unit uTexto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TuFrmTexto = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmTexto: TuFrmTexto;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TuFrmTexto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Memo1.Modified) then
  begin
    if MessageBox(handle, pChar('Deseja salvar alterações feitas em ' + caption + '?' ), 'Atenção', MB_ICONQUESTION +  MB_YESNO) = mrYes then
    begin
      uFrmPrincipal.Salvar1.Click;
    end;
  end;

  Action   := caFree;
  uFrmTexto := nil;
end;

end.
