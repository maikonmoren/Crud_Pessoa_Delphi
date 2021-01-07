unit UTelefone;

interface
  uses Vcl.Dialogs;
  type TTelefone = class
    private
    Fnumero : String;
    FclienteId: Integer;
    FoperadoraId: Integer;
    Fremovido : boolean;
    procedure SetclienteId(const Value: Integer);
    procedure Setnumero(const Value: String);
    procedure SetoperadoraId(const Value: Integer);
    procedure Setremovido(const Value: boolean);
    public
    constructor Create();
    property numero : String read Fnumero write Setnumero;
    property clienteId : Integer read FclienteId write SetclienteId;
    property operadoraId: Integer read FoperadoraId write SetoperadoraId;
    property removido : boolean read Fremovido write Setremovido;
    function pode_salvar:boolean;
    procedure salvar_telefone;
    destructor tel_destruir;
  end;
implementation
  uses UConexao;
{ TTelefone }

constructor TTelefone.Create;
begin

end;

function TTelefone.pode_salvar: boolean;
var valid:boolean;
begin
  valid:=true;
  if Self.Fnumero = '' then valid:=false;
  if Self.operadoraId = 0 then valid:=false;
  Result:=valid;
end;

procedure TTelefone.salvar_telefone;
begin
    UConexao.DataModule1.AdicionarTelefone(Self.numero,Self.operadoraId,self.clienteId);
end;

procedure TTelefone.SetclienteId(const Value: Integer);
begin
  FclienteId := Value;
end;

procedure TTelefone.Setnumero(const Value: String);
begin
  if Length(Value) = 11 then begin
      if UConexao.DataModule1.F_TemTelefone(Value)=false then begin
          Fnumero := Value;
      end else begin ShowMessage('Número já utilizado') end;
  end else begin ShowMessage('Número inválido') end;

end;

procedure TTelefone.SetoperadoraId(const Value: Integer);
begin
  if Value=0 then begin
    ShowMessage('Selecione uma operadora');
    Exit;
  end;
  FoperadoraId := Value;
end;

procedure TTelefone.Setremovido(const Value: boolean);
begin
  Fremovido := Value;
end;

destructor TTelefone.tel_destruir;
begin

end;

end.
