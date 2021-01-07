object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 398
  Width = 442
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=sistema;D' +
      'ata Source=conexao;Initial Catalog=ajx_teste'
    DefaultDatabase = 'ajx_teste'
    LoginPrompt = False
    Left = 392
    Top = 24
  end
  object ADOF_TemCpf: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'cpf'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'select F_TemCpf(:cpf)')
    Left = 296
    Top = 24
  end
  object ADOSalvarCliente: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'cpf'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'nome'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'nascimento'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'email'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'Insert into tabela_cliente values '
      '(null,:cpf,:nome,:nascimento,:email,false,null);')
    Left = 32
    Top = 80
  end
  object ADOEditarCliente: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'nome'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'nascimento'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'email'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'removido'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
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
      
        'UPDATE tabela_cliente set  nome= :nome ,data_nascimento = :nasci' +
        'mento ,email= :email ,removido= :removido ,data_hora = Current_t' +
        'imestamp where cliente_id= :id')
    Left = 32
    Top = 136
  end
  object ADOVW_cliente: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from VW_clientes order by nome')
    Left = 32
    Top = 24
  end
  object ADOVW_Telefone: TADOQuery
    Connection = Conexao
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
      'select * from VW_Telefone where cliente_id= :id ')
    Left = 176
    Top = 136
  end
  object ADORemoveTelefone: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'telefone'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'update VW_telefone set removido=True where telefone = :telefone;')
    Left = 176
    Top = 80
  end
  object ADOConsulta: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'nome'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'cpf'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'Select * from VW_clientes where nome like :nome or cpf like :cpf')
    Left = 32
    Top = 192
  end
  object ADOOperadora: TADOQuery
    Parameters = <>
    Left = 176
    Top = 24
  end
  object ADOClienteUnico: TADOQuery
    Connection = Conexao
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
      'Select * from VW_clientes where cliente_id = :id')
    Left = 32
    Top = 248
  end
  object ADOAdicionarTelefone: TADOQuery
    Connection = Conexao
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
      'call P_Telefone( :operadora , :cliente , :numero )')
    Left = 176
    Top = 192
  end
  object ADOF_TemTelefone: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'telefone'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 180
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'select  F_TemTelefone( :telefone )')
    Left = 296
    Top = 80
  end
  object ADOF_TemEmail: TADOQuery
    Connection = Conexao
    Parameters = <
      item
        Name = 'email'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 96
        Precision = 255
        Size = 255
      end>
    SQL.Strings = (
      'select F_TemEmail( :email )')
    Left = 296
    Top = 144
  end
end
