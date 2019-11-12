unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, printers,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TuFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    dlgAbrir: TOpenDialog;
    dlgSalvar: TSaveDialog;
    dlgFonte: TFontDialog;
    dlgImprimir: TPrintDialog;
    Arquivo1: TMenuItem;
    Formatar1: TMenuItem;
    Janelas1: TMenuItem;
    Ajuda1: TMenuItem;
    Novo1: TMenuItem;
    Salvar1: TMenuItem;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    FecharTodos1: TMenuItem;
    N2: TMenuItem;
    Imprimir1: TMenuItem;
    N3: TMenuItem;
    Sair1: TMenuItem;
    Fonte1: TMenuItem;
    LadoaLado1: TMenuItem;
    Cascatear1: TMenuItem;
    Horizontal1: TMenuItem;
    Vertical1: TMenuItem;
    Timer1: TTimer;
    stbStatus: TStatusBar;
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Fechar1Click(Sender: TObject);
    procedure FecharTodos1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Fonte1Click(Sender: TObject);
    procedure Cascatear1Click(Sender: TObject);
    procedure Horizontal1Click(Sender: TObject);
    procedure Vertical1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmPrincipal: TuFrmPrincipal;
  Janelas : integer = 1; //Variável global

implementation

{$R *.dfm}

uses uTexto;

procedure TuFrmPrincipal.Abrir1Click(Sender: TObject);
begin
  if (dlgAbrir.Execute) then
  begin
    with uFrmTexto.Create(Self) do
    begin
      //Carrega o arquivo de texto para o memo
      Memo1.Lines.LoadFromFile(dlgAbrir.FileName);
      //Coloca o nome do arquivo no caption
      Caption := ExtractFileName(dlgAbrir.FileName);
      //Fala que o arquivo não foi modificado
      Memo1.Modified := false;
    end;
   end;
end;

procedure TuFrmPrincipal.Cascatear1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TuFrmPrincipal.Fechar1Click(Sender: TObject);
begin
  ActiveMDIChild.Close;
end;

procedure TuFrmPrincipal.FecharTodos1Click(Sender: TObject);
var
  i: integer;
begin
  for i:= MDIChildCount -1 downto 0 do
    MDIChildren[i].Close;
end;

procedure TuFrmPrincipal.Fonte1Click(Sender: TObject);
begin
  if (dlgFonte.Execute) then
    TuFrmTexto(ActiveMDIChild).Memo1.Font := dlgFonte.Font;
end;

procedure TuFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmPrincipal:= nil;
end;

procedure TuFrmPrincipal.Horizontal1Click(Sender: TObject);
begin
  TileMode := tbHorizontal;
    Tile;
end;

procedure TuFrmPrincipal.Imprimir1Click(Sender: TObject);
var
texto: TextFile;
i: integer;
begin
  //Executa o dialogo para imprimir
  if (dlgImprimir.Execute) then
  begin
    //Selecione a janela MDI que esta aberta no momento
    with TuFrmTexto(ActiveMDIChild) do
    begin
      //Associa a variável texto a impressão
      assignprn(texto);
      Rewrite(texto);

      //Fala que a fonte que vai ser usada na impressão é a mesma do memo
      Printer.Canvas.Font := Memo1.Font;

      //Escreve os conteudos do memo no arquivo para impressão
      for i := 0 to Memo1.Lines.Count -1 do
      begin
        writeln(texto, Memo1.Lines[i]);
      end;

      //Fecha o arquivo de impressão
      CloseFile(texto);
    end;
  end;
end;

procedure TuFrmPrincipal.Novo1Click(Sender: TObject);
var
  Texto: TuFrmTexto;
begin
  //Application.CreateForm(TuFrmTexto, uFrmTexto);
  Texto:= TuFrmTexto.Create(Self);
  Texto.Show;
  Texto.Caption:= 'Documento ' + IntToStr(Janelas);
  inc(Janelas);
end;

procedure TuFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TuFrmPrincipal.Salvar1Click(Sender: TObject);
begin
  //Pega a janela MDI aberta no momento
  with TuFrmTexto(ActiveMDIChild) do
  begin
    //se o nome do arquivo estiver vazio grava o nome da janela
    if (dlgSalvar.FileName = '') then
      dlgSalvar.FileName := Caption;
    //Manda executar o dialogo para salvar
    if (dlgSalvar.Execute) then
    begin
      //Pega as linhas e salva em um arquivo de texto
      Memo1.Lines.SaveToFile(dlgSalvar.FileName);

      //Mostra no caption do form o nome salvo
      Caption := ExtractFileName(dlgSalvar.FileName);

      //Fala que o texto ainda não foi modificado
      Memo1.Modified := false;
    end;
  end;
end;

procedure TuFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  Fechar1.Enabled      := MDIChildCount > 0;
  FecharTodos1.Enabled := MDIChildCount > 0;
  Salvar1.Enabled      := MDIChildCount > 0;
  Imprimir1.Enabled    := MDIChildCount > 0;
  Formatar1.Enabled    := MDIChildCount > 0;
  Horizontal1.Enabled  := MDIChildCount > 0;
  Vertical1.Enabled    := MDIChildCount > 0;
  Cascatear1.Enabled   := MDIChildCount > 0;
  stbStatus.Panels[0].Text := TimeToStr(now);
end;

procedure TuFrmPrincipal.Vertical1Click(Sender: TObject);
begin
  TileMode := tbVertical;
    Tile;
end;

end.
