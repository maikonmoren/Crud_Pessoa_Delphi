object Cadastro: TCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 442
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = Onshow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 242
    Top = 16
    Width = 180
    Height = 25
    Caption = 'Cadastro de cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object telefones: TPanel
    Left = 405
    Top = 64
    Width = 276
    Height = 370
    ShowCaption = False
    TabOrder = 0
    Visible = False
    object txt_numero: TEdit
      Left = 95
      Top = 9
      Width = 130
      Height = 21
      Hint = 'N'#250'mero de telefone'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'Telefone'
      OnKeyUp = txt_numeroKeyUp
    end
    object Operadoras: TComboBox
      Left = 8
      Top = 9
      Width = 81
      Height = 21
      Hint = 'Operadora'
      TabOrder = 1
      TextHint = 'Operadora'
    end
    object BitBtn1: TBitBtn
      Left = 231
      Top = 7
      Width = 33
      Height = 25
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000810000008100000000000000000000000000FF0000FF
        0000FF000000000000B8000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000B8000000FF0000009100000091000000FF00000058000000580000
        00580000005800000058000000580000005800000058000000FF000000910000
        0091000000FF000000FF0000005800000058000000FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF000000580000
        0058000000FF000000FF0000005800000058000000FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF000000580000
        0058000000FF000000FF0000005800000058000000FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF000000580000
        0058000000FF000000FF0000005800000051000000FF000000A8000000A80000
        00A8000000A8000000A8000000A8000000A8000000A8000000FF000000510000
        0058000000FF000000FF000000580000000A00000091000000A8000000A80000
        00A8000000A8000000A8000000A8000000A8000000A8000000910000000A0000
        0058000000FF000000FF00000058FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0058000000FF000000FF00000058FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0058000000FF000000FF000000580000000A00000091000000A8000000A80000
        00A8000000A8000000A8000000A200000032FFFFFF00FFFFFF00FFFFFF000000
        0058000000FF000000FF0000005800000051000000FF000000FF000000FF0000
        00EB000000A8000000A8000000EB000000A2FFFFFF00FFFFFF00FFFFFF000000
        005B000000FC000000FF0000005800000058000000FF000000FF000000FF0000
        00A8FFFFFF00FFFFFF00000000A8000000A8FFFFFF00FFFFFF00000000060000
        00BC000000C5000000FF0000005800000058000000FF000000FF000000FF0000
        00A8FFFFFF00FFFFFF00000000A8000000A8FFFFFF0000000006000000B10000
        00F000000030000000FF0000005800000058000000FF000000FF000000FF0000
        00A8FFFFFF00FFFFFF00000000A8000000A800000006000000B1000000F00000
        0037FFFFFF00000000FF0000009100000091000000FF000000FF000000FF0000
        00CF0000005800000058000000CF000000C9000000BC000000F000000037FFFF
        FF00FFFFFF00000000B8000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FC000000C500000030FFFFFF00FFFF
        FF00FFFFFF00}
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 64
    Width = 385
    Height = 370
    Caption = 'Panel2'
    Color = clInactiveBorder
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 7
      Width = 44
      Height = 19
      Caption = 'Cod. :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 65
      Width = 53
      Height = 19
      Caption = 'Nome :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 123
      Width = 33
      Height = 19
      Caption = 'CPF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 181
      Width = 51
      Height = 19
      Caption = 'E-mail:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 239
      Width = 145
      Height = 19
      Caption = 'Data de nascimento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 216
      Top = 7
      Width = 80
      Height = 19
      Caption = 'Data hora :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object txt_nome: TEdit
      Left = 24
      Top = 90
      Width = 329
      Height = 27
      Hint = 'Nome  do cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'Nome'
    end
    object txt_cpf: TEdit
      Left = 24
      Top = 148
      Width = 329
      Height = 27
      Hint = 'Campo para Cpf'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      OnKeyUp = txt_cpfKeyUp
    end
    object txt_email: TEdit
      Left = 24
      Top = 206
      Width = 329
      Height = 27
      Hint = 'E-mail do cliente'
      ParentCustomHint = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object txt_cod: TEdit
      Left = 24
      Top = 32
      Width = 154
      Height = 27
      Hint = 'C'#243'digo do cliente'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '0'
    end
    object txt_data_hora: TEdit
      Left = 216
      Top = 32
      Width = 137
      Height = 27
      Hint = 'Data de cadastro'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object Removido: TCheckBox
      Left = 24
      Top = 322
      Width = 97
      Height = 17
      Hint = 'Cliente removido '
      Caption = 'Removido'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object Button1: TButton
      Left = 286
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
    object data_nas: TDatePicker
      Left = 24
      Top = 264
      Date = 44200.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 7
    end
  end
  object ADOSalvar: TADOQuery
    Connection = DataModule1.Conexao
    Parameters = <>
    Left = 24
    Top = 16
  end
  object ADOCliente: TADOQuery
    Connection = DataModule1.Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'select * from VW_clientes where cliente_id =:id')
    Left = 88
    Top = 16
  end
  object ADOoperadora: TADOQuery
    Connection = DataModule1.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from tabela_operadora')
    Left = 648
    Top = 16
  end
  object ADOtel: TADOQuery
    Connection = DataModule1.Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from VW_Telefone where cliente_id= :id order By removid' +
        'o')
    Left = 592
    Top = 16
  end
  object ADOaddTel: TADOQuery
    Connection = DataModule1.Conexao
    Parameters = <
      item
        Name = 'operadora'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'cliente'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'numero'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'call P_Telefone(:operadora,:cliente,:numero);')
    Left = 536
    Top = 16
  end
end
