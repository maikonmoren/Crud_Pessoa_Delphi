unit UConexao;

interface

uses
  System.SysUtils, System.Classes,Vcl.Dialogs, Data.DB, Data.Win.ADODB;

type
  TDataModule1 = class(TDataModule)
    Conexao: TADOConnection;
    ADOF_TemCpf: TADOQuery;
    ADOSalvarCliente: TADOQuery;
    ADOEditarCliente: TADOQuery;
    ADOVW_cliente: TADOQuery;
    ADOVW_Telefone: TADOQuery;
    ADORemoveTelefone: TADOQuery;
    ADOConsulta: TADOQuery;
    ADOOperadora: TADOQuery;
    ADOClienteUnico: TADOQuery;
    ADOAdicionarTelefone: TADOQuery;
    ADOF_TemTelefone: TADOQuery;
    ADOF_TemEmail: TADOQuery;
  private
  
  public
    constructor Create;
    procedure Consulta(campo:String);
    procedure ClienteUnico(id:integer);
    procedure VW_cliente;
    procedure VW_telefones(id : Integer);
    procedure RemoveTelefone(numero:String);
    procedure AdicionarTelefone(numero:String;operadora:integer;cliente:integer);
    function SalvarCliente(cod:integer;nome:String;cpf:String;nascimento:String;email:String;removido:boolean):integer;
    function F_TemCpf(val:String):boolean;
    function F_TemEmail(val:String):boolean;
    function F_TemTelefone(val:String):boolean;
  end;

var
  DataModule1: TDataModule1;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.AdicionarTelefone(numero:String;operadora:integer;cliente:integer);
begin
      ADOAdicionarTelefone.Parameters.ParamByName('operadora').Value:=operadora;
      ADOAdicionarTelefone.Parameters.ParamByName('cliente').Value:=cliente;
      ADOAdicionarTelefone.Parameters.ParamByName('numero').Value:=numero;
      ADOAdicionarTelefone.ExecSQL ;
      ShowMessage('Número Cadastrado');

end;

procedure TDataModule1.ClienteUnico(id: integer);
begin
     ADOClienteUnico.Parameters.ParamByName('id').Value:=id;
     ADOClienteUnico.Open;
end;

procedure TDataModule1.Consulta(campo: String);
begin
      ADOConsulta.Parameters.ParamByName('nome').Value:='%'+campo+'%';
      ADOConsulta.Parameters.ParamByName('cpf').Value:='%'+campo+'%';
      ADOConsulta.Open;
      ADOConsulta.ExecSQL;
end;

constructor TDataModule1.Create;
begin

end;

function TDataModule1.F_TemCpf(val: String): boolean;
begin
    ADOF_TemCpf.Parameters.ParamByName('cpf').Value:=val;
    ADOF_TemCpf.Open;
    Result:=ADOF_TemCpf.Fields.Fields[0].Value;
    ADOF_TemCpf.Close;
end;


function TDataModule1.F_TemEmail(val: String): boolean;
begin
  ADOF_TemEmail.Parameters.ParamByName('email').Value:=val;
  ADOF_TemEmail.Open;
  Result:=ADOF_TemEmail.Fields.Fields[0].Value;
  ADOF_TemEmail.Close;

end;

function TDataModule1.F_TemTelefone(val: String): boolean;
begin
  ADOF_TemTelefone.Parameters.ParamByName('telefone').Value:=val;
  ADOF_TemTelefone.Open;
  Result:=ADOF_TemTelefone.Fields.Fields[0].Value;
  ADOF_TemTelefone.Close;
end;

procedure TDataModule1.RemoveTelefone(numero: String);
begin
ADORemoveTelefone.Parameters.ParamByName('telefone').Value:=numero;
ADORemoveTelefone.ExecSQL;
ShowMessage('Removido');
end;
function  TDataModule1.SalvarCliente(cod: integer; nome, cpf, nascimento,
  email: String; removido: boolean):integer;
begin
if cod=0then
begin
   ADOSalvarCliente.Parameters.ParamByName('cpf').Value:=cpf;
   ADOSalvarCliente.Parameters.ParamByName('nome').Value:=nome;
   ADOSalvarCliente.Parameters.ParamByName('nascimento').Value:=nascimento;
   ADOSalvarCliente.Parameters.ParamByName('email').Value:=email;
   ADOSalvarCliente.ExecSQL;
  if ADOSalvarCliente.RowsAffected>0 then begin
   ShowMessage('Cliente Cadastrado');
  end else begin
   ShowMessage('Erro ao Cadastrado');
  end;
  Result:=ADOSalvarCliente.RowsAffected;

end else begin
   ADOEditarCliente.Parameters.ParamByName('nome').Value:=nome;
   ADOEditarCliente.Parameters.ParamByName('nascimento').Value:=nascimento;
   ADOEditarCliente.Parameters.ParamByName('email').Value:=email;
   ADOEditarCliente.Parameters.ParamByName('removido').Value:=removido;
   ADOEditarCliente.Parameters.ParamByName('id').Value:=cod;
   ADOEditarCliente.ExecSQL;
   if ADOEditarCliente.RowsAffected>0 then begin
     ShowMessage('Cliente Editado');
   end else begin
     ShowMessage('Cliente Editado');
   end;
   Result:=ADOEditarCliente.RowsAffected;
end;

end;

procedure TDataModule1.VW_cliente;
begin
   ADOVW_cliente.Open;
   ADOVW_cliente.ExecSQL;
end;




procedure TDataModule1.VW_telefones(id: Integer);
begin
ADOVW_Telefone.Parameters.ParamByName('id').Value:=id;
ADOVW_Telefone.Open;
end;

end.
