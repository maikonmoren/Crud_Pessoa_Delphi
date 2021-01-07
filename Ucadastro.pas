unit Ucadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, UCliente,
  Vcl.WinXPickers, Data.DB, Data.Win.ADODB , UConexao, Vcl.DBCtrls, Vcl.Buttons;

type
  TCadastro = class(TForm)
    telefones: TPanel;
    txt_numero: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    txt_nome: TEdit;
    txt_cpf: TEdit;
    txt_email: TEdit;
    txt_cod: TEdit;
    txt_data_hora: TEdit;
    Removido: TCheckBox;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    data_nas: TDatePicker;
    ADOSalvar: TADOQuery;
    ADOCliente: TADOQuery;
    ADOoperadora: TADOQuery;
    Operadoras: TComboBox;
    BitBtn1: TBitBtn;
    ADOtel: TADOQuery;
    ADOaddTel: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Onshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure txt_numeroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_cpfKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure gerar(cod:Integer);
    procedure gerarTelefone(query:TADOQuery);
    procedure delTel(Sender:TObject);
  end;

var
  Cadastro: TCadastro;
  cliente: TCliente;
  //Card telefone
  telefones: TPanel;
  operadora: TEdit;
  telefone: TEdit;
  deletaTel: TBitBtn;
  // ID
  id_cliente:Integer;

implementation

{$R *.dfm}

uses Uconsulta;



procedure TCadastro.BitBtn1Click(Sender: TObject);
begin
  cliente:=TCliente.Create(id_cliente);
  cliente.telefone.numero:=txt_numero.Text;
  cliente.telefone.operadoraId:=(Operadoras.ItemIndex+1);
  if cliente.telefone.pode_salvar=true then begin
    cliente.Salvar_Telefone;
  end;
  UConexao.DataModule1.VW_telefones(id_cliente);
  gerarTelefone(UConexao.DataModule1.ADOVW_Telefone);
end;

procedure TCadastro.Button1Click(Sender: TObject);
begin
  cliente:=TCliente.Create(StrToInt(txt_cod.Text));
  cliente.nome:=txt_nome.Text;
  cliente.cpf:=txt_cpf.Text;
  cliente.email:=txt_email.Text;
  cliente.nascimento:= data_nas.Date;
  cliente.removido:=removido.Checked;
  if cliente.Pode_salvar=true then begin
    if cliente.Salvar_Cliente>0 then begin
    UConexao.DataModule1.Consulta('');
    Uconsulta.Consulta.geraCliente(UConexao.DataModule1.ADOConsulta);
    cliente.destruir_cliente;
    Self.Destroy;
    end else begin cliente.destruir_cliente;end ;
  end else begin cliente.destruir_cliente;end ;

  end;



procedure TCadastro.delTel(Sender: TObject);
begin
 if messagedlg('Remover telefone?',mtconfirmation,mbokcancel,0) = 1 then begin
    UConexao.DataModule1.RemoveTelefone(TBitBtn(Sender).Hint);
    TBitBtn(Sender).Enabled:=false;
   end;
     UConexao.DataModule1.VW_telefones(id);
     gerarTelefone(UConexao.DataModule1.ADOVW_Telefone);
end;

procedure TCadastro.gerar(cod: Integer);
begin
      Self.Show;
      id_cliente:=cod;
      telefones.Visible:=true;
      txt_cod.Text:=IntToStr(cod);
      UConexao.DataModule1.ClienteUnico(cod);
      txt_nome.Text:=UConexao.DataModule1.ADOClienteUnico.Fields.Fields[2].Value;
      txt_cpf.Text:=UConexao.DataModule1.ADOClienteUnico.Fields.Fields[1].Value;
      txt_email.Text:=UConexao.DataModule1.ADOClienteUnico.Fields.Fields[4].Value;
      data_nas.Date:=UConexao.DataModule1.ADOClienteUnico.Fields.Fields[3].Value;
      Removido.Enabled:=True;
      txt_cpf.Enabled:=False;
      txt_data_hora.Text:=UConexao.DataModule1.ADOClienteUnico.Fields.Fields[6].Value;
      UConexao.DataModule1.ADOClienteUnico.Close;
      UConexao.DataModule1.VW_telefones(cod);
      gerarTelefone(UConexao.DataModule1.ADOVW_Telefone);

end;

procedure TCadastro.gerarTelefone(query: TADOQuery);
var posXT:Integer;
begin
  posXT := 40;
  while not query.Recordset.EOF do
  begin
    // Numero de telefone
    telefone := TEdit.Create(Self);
    telefone.Parent := telefones;
    telefone.Left := 95;
    telefone.Top := posXT;
    telefone.Width := 130;
    telefone.Height := 21;
    telefone.TabOrder := 0;
    telefone.Text := query.Fields.Fields[0].Value;
    telefone.ReadOnly := true;
    // Deletar telefone
    deletaTel := TBitBtn.Create(Self);
    deletaTel.Parent := telefones;
    deletaTel.Left := 231;
    deletaTel.Top := posXT;
    deletaTel.Width := 33;
    deletaTel.Height := 21;
    deletaTel.Hint := query.Fields.Fields[0].Value;
    deletaTel.TabOrder := 1;
    deletaTel.Glyph:=Consulta.refButton.Glyph;
    deletaTel.OnClick:= DelTel;
    if query.Fields.Fields[3].Value = 1 then deletaTel.Enabled:=false;
    // operadora
    operadora := TEdit.Create(Self);
    operadora.Parent := telefones;
    operadora.Left := 8;
    operadora.Top := posXT;
    operadora.Width := 81;
    operadora.Height := 21;
    operadora.TabOrder := 2;
    operadora.Text := query.Fields.Fields[1].Value;;
    operadora.ReadOnly := true;
    posXT := posXT + 30;
    query.Next;
  end;
    query.Close;
end;


procedure TCadastro.Onshow(Sender: TObject);
begin

      data_nas.Date:=Date;
      ADOoperadora.Open;
      ADOoperadora.ExecSQL;
      while not ADOoperadora.Recordset.EOF do
      begin
        Operadoras.Items.Add(ADOoperadora.Fields.Fields[1].Value);
        ADOoperadora.Next;
      end;
      ADOoperadora.Close;

end;

procedure TCadastro.txt_cpfKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Length(txt_cpf.Text)>10 then  txt_cpf.ReadOnly:=True;
if Key=VK_BACK then
begin
txt_cpf.ReadOnly:=False;
txt_cpf.Text:=copy(txt_numero.Text,0,9);
txt_cpf.SelStart:=Length(txt_cpf.Text);
end;
end;

procedure TCadastro.txt_numeroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Length(txt_numero.Text)>10 then  txt_numero.ReadOnly:=True;
if Key=VK_BACK then
begin
txt_numero.ReadOnly:=False;
txt_numero.Text:=copy(txt_numero.Text,0,10);
txt_numero.SelStart:=Length(txt_numero.Text);
end;

end;

end.
