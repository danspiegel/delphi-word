program uNotepad;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {uFrmPrincipal},
  uTexto in 'uTexto.pas' {uFrmTexto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuFrmPrincipal, uFrmPrincipal);
  Application.Run;
end.
