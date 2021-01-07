program Ajx_teste;

uses
  Vcl.Forms,
  Uconsulta in 'Uconsulta.pas' {Consulta},
  UConexao in 'UConexao.pas' {DataModule1: TDataModule},
  Ucadastro in 'Ucadastro.pas' {Cadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConsulta, Consulta);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TCadastro, Cadastro);
  Application.Run;
end.
