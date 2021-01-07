unit Uconsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCliente, Vcl.StdCtrls, Vcl.ExtCtrls, Ucadastro,
  Data.DB, Data.Win.ADODB, Vcl.Buttons;

type
  TConsulta = class(TForm)
    btn_consultar: TButton;
    txt_consulta: TEdit;
    cont_painel: TPanel;
    Label1: TLabel;
    btn_novo: TButton;
    cards: TScrollBox;
    refButton: TSpeedButton;
    procedure btn_novoClick(Sender: TObject);
    procedure OnShow(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure OnClose(Sender: TObject; var Action: TCloseAction);
  private
    Count, posX, posY, posXT: integer;
    procedure CarregaTelefone(Sender: TObject);
    procedure EditaCliente(Sender:TObject);



  public
    procedure geraCliente(query : TADOQuery);
    procedure gerarTelefone(query:TADOQuery);
    procedure DelTel(Sender:TObject);
  end;

var
  Consulta: TConsulta;
  cadastro: TCadastro;
  // Card Cliente
  card_cliente: TPanel;
  card_nome: TEdit;
  card_id: TEdit;
  card_cpf: TEdit;
  card_email: TEdit;
  card_nascimento: TEdit;
  card_datahora: TEdit;
  card_editar: TButton;
  // Card Telefone
  telefones: TPanel;
  operadora: TEdit;
  telefone: TEdit;
  deletaTel: TBitBtn;
  // Uclientes
  clientes: TCliente;
  id:Integer;
implementation
     uses UConexao;
{$R *.dfm}

procedure TConsulta.btn_consultarClick(Sender: TObject);
  var Resultado_consulta : TADOQuery;
begin
    UConexao.DataModule1.Consulta(txt_consulta.Text);
    geraCliente(UConexao.DataModule1.ADOConsulta);

end;

procedure TConsulta.btn_novoClick(Sender: TObject);
begin;
  cadastro := TCadastro.Create(Application);
  cadastro.Show;
end;

procedure TConsulta.CarregaTelefone(Sender: TObject);
begin
    id:=StrToInt(TPanel(Sender).Caption);
    UConexao.DataModule1.ADOVW_Telefone.Close;
    UConexao.DataModule1.VW_telefones(id);
    gerarTelefone(UConexao.DataModule1.ADOVW_Telefone);
end;




procedure TConsulta.DelTel(Sender: TObject);
var result:boolean;
begin
 if messagedlg('Remover telefone?',mtconfirmation,mbokcancel,0) = 1 then begin
    UConexao.DataModule1.RemoveTelefone(TBitBtn(Sender).Hint);
    telefones.Destroy;
    UConexao.DataModule1.VW_telefones(id);
    gerarTelefone(UConexao.DataModule1.ADOVW_Telefone);
   end;

end;

procedure TConsulta.EditaCliente(Sender: TObject);

begin

 cadastro:=TCadastro.Create(Application);
 cadastro.gerar(StrToInt(TButton(Sender).Hint));

end;



procedure TConsulta.geraCliente(query: TADOQuery);
  var
  Linha: boolean;
begin
  Count := 0;
  posX := 5;
  posY := 8;
  Linha:=false;
  cards.Destroy;
  cards:=TScrollBox.Create(Self);
  cards.Parent:=Self;
  cards.Left := 8;
  cards.Top := 104 ;
  cards.Width := 633;
  cards.Height := 312;
  cards.TabOrder := 4 ;
  cont_painel.Caption := IntToStr(query.RowsAffected) + ' Registros';
    while not query.Recordset.EOF do
  begin
    Count := Count + 1;
    // Painel
    card_cliente := TPanel.Create(Self);
    card_cliente.Name := 'id' + IntToStr(Count);
    card_cliente.Parent := cards;
    card_cliente.Left := posY;
    card_cliente.Top := posX;
    card_cliente.Width := 297;
    card_cliente.Height := 97;
    card_cliente.Caption := query.Fields.Fields[0].Value;
    card_cliente.TabOrder := 4;
    card_cliente.OnClick := CarregaTelefone;

    // Nome
    card_nome := TEdit.Create(Self);
    card_nome.Parent := card_cliente;
    card_nome.Left := 8;
    card_nome.Top := 8;
    card_nome.Width := 154;
    card_nome.Height := 21;
    card_nome.TabOrder := 0;
    card_nome.Text := query.Fields.Fields[2].Value;
    card_nome.Enabled := false;
    // Cpf
    card_cpf := TEdit.Create(Self);
    card_cpf.Parent := card_cliente;
    card_cpf.Left := 8;
    card_cpf.Top := 35;
    card_cpf.Width := 154;
    card_cpf.Height := 21;
    card_cpf.TabOrder := 1;
    card_cpf.Text := query.Fields.Fields[1].Value;
    card_cpf.Enabled := false;
    // E-mail
    card_email := TEdit.Create(Self);
    card_email.Parent := card_cliente;
    card_email.Left := 8;
    card_email.Top := 62;
    card_email.Width := 194;
    card_email.Height := 21;
    card_email.TabOrder := 2;
    card_email.Text := query.Fields.Fields[4].Value;
    card_email.Enabled := false;
    // Nascimento
    card_nascimento := TEdit.Create(Self);
    card_nascimento.Parent := card_cliente;
    card_nascimento.Left := 168;
    card_nascimento.Top := 8;
    card_nascimento.Width := 115;
    card_nascimento.Height := 21;
    card_nascimento.TabOrder := 3;
    card_nascimento.Enabled := false;
    card_nascimento.Text := query.Fields.Fields[3].Value;
    card_nascimento.Enabled := false;
    // Data Hora
    card_datahora := TEdit.Create(Self);
    card_datahora.Parent := card_cliente;
    card_datahora.Left := 168;
    card_datahora.Top := 35;
    card_datahora.Width := 115;
    card_datahora.Height := 21;
    card_datahora.TabOrder := 4;
    card_datahora.Text := query.Fields.Fields[6].Value;
    card_datahora.Enabled := false;
    // Botao
    card_editar := TButton.Create(Self);
    card_editar.Parent := card_cliente;
    card_editar.Left := 208;
    card_editar.Hint:=query.Fields.Fields[0].Value;
    card_editar.Top := 62;
    card_editar.Width := 75;
    card_editar.Height := 25;
    card_editar.Caption := 'Editar';
    card_editar.TabOrder := 5;
    card_editar.OnClick:=EditaCliente;
    query.Next;
    if Linha = false then
    begin
      posY := 310;
      Linha := true;
    end
    else
    begin
      posX := posX + 108;
      posY := 5;
      Linha := false;
    end;
  end;
  query.Close;
end;



procedure TConsulta.gerarTelefone(query: TADOQuery);
begin
  telefones := TPanel.Create(Self);
  telefones.Parent := Self;
  telefones.Left := 648;
  telefones.Top := 56;
  telefones.Width := 251;
  telefones.Height := 396;
  telefones.ShowCaption:=false;
  telefones.TabOrder := 0;
  posXT := 10;
    while not query.Recordset.EOF do
  begin
    // Numero de telefone
    telefone := TEdit.Create(Self);
    telefone.Parent := telefones;
    telefone.Left := 95;
    telefone.Top := posXT;
    telefone.Width := 114;
    telefone.Height := 21;
    telefone.TabOrder := 0;
    telefone.Text := query.Fields.Fields[0].Value;
    telefone.Enabled := False;
    // Deletar telefone

    deletaTel := TBitBtn.Create(Self);
    deletaTel.Parent := telefones;
    deletaTel.Left := 215;
    deletaTel.Top := posXT;
    deletaTel.Width := 33;
    deletaTel.Height := 21;
    deletaTel.Hint := query.Fields.Fields[0].Value;
    deletaTel.TabOrder := 1;
    deletaTel.Glyph:=refButton.Glyph;
    deletaTel.OnClick:=DelTel;

    // operadora
    operadora := TEdit.Create(Self);
    operadora.Parent := telefones;
    operadora.Left := 8;
    operadora.Top := posXT;
    operadora.Width := 81;
    operadora.Height := 21;
    operadora.TabOrder := 2;
    operadora.Text := query.Fields.Fields[1].Value;;
    operadora.Enabled := false;
    posXT := posXT + 30;
    query.Next;
  end;
  query.Close;
end;

procedure TConsulta.OnClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TConsulta.OnShow(Sender: TObject);

begin
  telefones := TPanel.Create(Self);
  telefones.Parent := Consulta;
  telefones.Left := 648;
  telefones.Top := 56;
  telefones.Width := 251;
  telefones.Height := 396;
  telefones.TabOrder := 0;
  UConexao.DataModule1.VW_cliente;
  geraCliente(UConexao.DataModule1.ADOVW_cliente);
end;


end.
