object uFrmPrincipal: TuFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Notepad'
  ClientHeight = 328
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object stbStatus: TStatusBar
    Left = 0
    Top = 309
    Width = 495
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 64
    Top = 24
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Novo1: TMenuItem
        Caption = 'Novo'
        OnClick = Novo1Click
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
        OnClick = Salvar1Click
      end
      object Abrir1: TMenuItem
        Caption = 'Abrir'
        OnClick = Abrir1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Caption = 'Fechar'
        OnClick = Fechar1Click
      end
      object FecharTodos1: TMenuItem
        Caption = 'Fechar Todos'
        OnClick = FecharTodos1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Imprimir1: TMenuItem
        Caption = 'Imprimir'
        OnClick = Imprimir1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Formatar1: TMenuItem
      Caption = 'Formatar'
      object Fonte1: TMenuItem
        Caption = 'Fonte'
        OnClick = Fonte1Click
      end
    end
    object Janelas1: TMenuItem
      Caption = 'Janelas'
      object LadoaLado1: TMenuItem
        Caption = 'Lado a Lado'
        object Horizontal1: TMenuItem
          Caption = 'Horizontal'
          OnClick = Horizontal1Click
        end
        object Vertical1: TMenuItem
          Caption = 'Vertical'
          OnClick = Vertical1Click
        end
      end
      object Cascatear1: TMenuItem
        Caption = 'Cascatear'
        OnClick = Cascatear1Click
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object dlgAbrir: TOpenDialog
    DefaultExt = 'txt'
    Filter = 
      'Arquivo Texto|.txt|Documentos do Word|.doc|Texto do OpenDocument' +
      '|.odt|Todos os Arquivos|(*.*)'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 128
    Top = 24
  end
  object dlgSalvar: TSaveDialog
    DefaultExt = 'txt'
    Filter = 
      'Arquivo Texto|.txt|Documentos do Word|.doc|Texto do OpenDocument' +
      '|.odt|Todos os Arquivos|(*.*)'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 192
    Top = 24
  end
  object dlgFonte: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 264
    Top = 24
  end
  object dlgImprimir: TPrintDialog
    Left = 328
    Top = 24
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 400
    Top = 24
  end
end
