unit UCliente;

interface
  uses UTelefone,Vcl.Dialogs,UConexao, Data.DB, Data.Win.ADODB,  System.Variants,System.SysUtils;
  var telefone : TTelefone;

  type TCliente = class
    private
    Fcod: Integer ;
    Fnome : String;
    Fcpf :String;
    Femail : String;
    Fnascimento : TDate;
    FdataHora: TDate  ;
    Fremovido:boolean;
    Ftelefone : TTelefone;
    procedure Setcod(const Value: Integer);
    procedure Setcpf(const Value: String);
    procedure SetdataHora(const Value: Tdate);
    procedure Setemail(const Value: String);
    procedure Setnascimento(const Value: TDate);
    procedure Setnome(const Value: String);
    procedure Settelefone(const Value: TTelefone);
    procedure Setremovido(const Value: boolean);
    public
    constructor Create(val : integer);
    property cod: Integer read Fcod write Setcod;
    property nome : String read Fnome write Setnome;
    property cpf : String read Fcpf write Setcpf;
    property email: String read Femail write Setemail;
    property nascimento : TDate read Fnascimento write Setnascimento;
    property dataHora : Tdate read FdataHora write SetdataHora;
    property removido : boolean read Fremovido write Setremovido;
    property telefone :TTelefone read Ftelefone write Settelefone;
    //------------------------------
    function Pode_salvar:boolean;
    function Salvar:String;
    function Salvar_Cliente:Integer;
    procedure Salvar_Telefone;
    destructor destruir_cliente;
  end;
implementation

  var
  DataModule: TDataModule1;
{ TCliente }


constructor TCliente.Create(val: integer);
begin
if val > 0 then
begin Setcod(val); end else begin
Setcod(0);
end;
telefone:=TTelefone.Create();
end;

destructor TCliente.destruir_cliente;
begin
telefone.tel_destruir;
end;
var valid:boolean;
function TCliente.Pode_salvar: boolean;
begin
valid:=true;
if Self.cod = 0 then if Self.cpf='' then valid:= false;
if Self.nome='' then valid:=false;
if Self.email='' then valid:=false;
if Self.nascimento = 0 then   valid:=false;

Result:=valid;
end;


function TCliente.Salvar: String;
begin

end;

function TCliente.Salvar_Cliente:Integer;
var data_nasc:String;
begin
 data_nasc:=FormatDateTime('yyyy-mm-dd',Self.nascimento);
 Result:=UConexao.DataModule1.SalvarCliente(Self.cod,Self.nome, Self.cpf, data_nasc,
  Self.email ,Self.removido);
end;

procedure TCliente.Salvar_Telefone;
begin
UConexao.DataModule1.AdicionarTelefone(Self.telefone.numero,Self.telefone.operadoraId,self.cod);
end;

procedure TCliente.Setcod(const Value: Integer);
begin
  Fcod := Value;
end;

procedure TCliente.Setcpf(const Value: String);
  var ver:boolean;
begin
 if self.cod = 0 then begin
   if Length(Value)>10 then begin
     if UConexao.DataModule1.F_TemCpf(Value)=false then begin
        Fcpf := Value;
     end else begin ShowMessage('Cpf já utilizado') end;
  end else begin  ShowMessage('Cpf curto') end;
 end else begin Fcpf := Value; end;


end;

procedure TCliente.SetdataHora(const Value: Tdate);
begin
  FdataHora := Value;
end;

procedure TCliente.Setemail(const Value: String);
begin
  if Pos('@',Value) > 0 then begin
    if Self.cod = 0 then begin
      if UConexao.DataModule1.F_TemEmail(Value)=false then begin
            Femail := Value;
      end else begin ShowMessage('Email já utilizado') end;
    end else begin Femail := Value end;
  end else begin ShowMessage('Email deve conter @') end;



end;

procedure TCliente.Setnascimento(const Value: TDate);
begin
  if DateToStr(Value) = DateToStr(Date) then
  begin
  ShowMessage('Data inválida');
  Exit;
  end else begin Fnascimento := Value; end;

end;

procedure TCliente.Setnome(const Value: String);
begin
  if Length(Value)<5 then begin
    ShowMessage('Nome muito curto');
    Exit;
  end;
  Fnome := Value;
end;

procedure TCliente.Setremovido(const Value: boolean);
begin
  if Value=true then  begin
    if messagedlg('Deseja desativar cliente',mtconfirmation,mbokcancel,0) = 1 then begin
      Fremovido := Value;
    end else begin Fremovido:= true end;
   end else begin Fremovido:=Value;end;


end;

procedure TCliente.Settelefone(const Value: TTelefone);
begin
  Ftelefone := Value;
end;

end.
