unit consultarcnpj.view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.JSON, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls, REST.Client, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.ComCtrls, Vcl.ExtCtrls, acPNG, ShellAPI,
  Vcl.Menus;

type
  TviewPrincipal = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    pnlConsulta: TPanel;
    btConsultarCnpj: TButton;
    pnlDadosEmpresa: TPanel;
    edtData: TEdit;
    edtPorte: TEdit;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtNome: TEdit;
    edtNomeFantasia: TEdit;
    edtNatJuridica: TEdit;
    GroupBox4: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtRua: TEdit;
    edtNumRua: TEdit;
    edtBairro: TEdit;
    edtCep: TEdit;
    edtCidade: TEdit;
    edtUf: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label17: TLabel;
    Label18: TLabel;
    cStatus: TLabel;
    Label20: TLabel;
    cSituacao: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label1: TLabel;
    edtCnpj1: TEdit;
    Label2: TLabel;
    edtCnpj: TEdit;
    edtResponsavel: TEdit;
    Image3: TImage;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    mmAtPrincipal: TMemo;
    Label5: TLabel;
    mmAtSecundaria: TMemo;
    Button1: TButton;
    MainMenu1: TMainMenu;
    S1: TMenuItem;
    I1: TMenuItem;
    pnlSobre: TPanel;
    Button2: TButton;
    LinkLabel1: TLinkLabel;
    Image5: TImage;
    Image4: TImage;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lkMeuGit: TLinkLabel;
    Image6: TImage;
    S2: TMenuItem;
    procedure btConsultarCnpjClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtCnpjKeyPress(Sender: TObject; var Key: Char);
    procedure I1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lkMeuGitLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure S2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const
    _URL_CONSULTA_CNPJ = 'https://receitaws.com.br/v1/cnpj/%s';


var
  viewPrincipal: TviewPrincipal;

implementation

{$R *.dfm}

procedure TviewPrincipal.btConsultarCnpjClick(Sender: TObject);
var
  LCNPJ, LrespostaConsultaCNPJ: string;
  LJSONObj, LObj: TJSONobject;
  LJSONArr : TJSONArray;
  LJSONValue : TJSONValue;

begin
  if edtCnpj.Text = '' then
    begin
      MessageDlg('Para consultar é necessário inserir um CNPJ!',mtWarning, [mbOK],0);
      abort
    end;

  if cSituacao.Caption <> 'ATIVA' then
    begin
      Csituacao.Font.Color := clRed;
    end;

  LCNPJ := trim(edtCnpj.text);

  restclient1.baseURL := format(_URL_CONSULTA_CNPJ, [LCNPJ]);

  restrequest1.Method := rmGET;
  restrequest1.Execute;

  LrespostaConsultaCNPJ := RESTResponse1.Content;
  LJSONObj:= RestRequest1.Response.JSONValue as TJSONObject;

  cSituacao.Caption :=
  LJSONObj.Values['situacao'].Value;
  cStatus.Caption :=
  LJSONObj.Values['status'].Value;
  edtData.text :=
  LJSONObj.Values['abertura'].Value;
  edtNome.Text :=
  LJSONObj.Values['nome'].Value;
  edtNomeFantasia.Text :=
  LJSONObj.Values['fantasia'].Value;
  edtPorte.Text :=
  LJSONObj.Values['porte'].Value;
  edtNatJuridica.Text :=
  LJSONObj.Values['natureza_juridica'].Value;
  edtRua.Text :=
  LJSONObj.Values['logradouro'].Value;
  edtNumRua.Text :=
  LJSONObj.Values['numero'].Value;
  edtCidade.Text :=
  LJSONObj.Values['municipio'].Value;
  edtBairro.Text :=
  LJSONObj.Values['bairro'].Value;
  edtCep.Text :=
  LJSONObj.Values['cep'].Value;
  edtUf.Text :=
  LJSONObj.Values['uf'].Value;
  edtTelefone.Text :=
  LJSONObj.Values['telefone'].Value;
  edtEmail.Text :=
  LJSONObj.Values['email'].Value;
  edtCnpj1.Text :=
  LJSONObj.Values['cnpj'].Value;

   LJSONArr := LJSONObj.Values['qsa'] as TJSONArray;


  if LJSONArr.Count > 0 then
    begin
       LObj := LJSONArr.Items[0] as TJSONObject;
       edtResponsavel.text :=
       LObj.Values['nome'].Value + ' - ' +
      LObj.Values['qual'].Value;
    end;

  LJSONArr := LJSONObj.Values['atividade_principal'] as TJSONArray;

    mmAtPrincipal.Lines.Clear;

  for LJSONValue in LJSONArr do
    begin
      LObj := LJSONValue as TJSONObject;
      mmAtPrincipal.Lines.Add(
          Format('%s (%s)', [
           (LJSONValue As TJSONObject).Values['code'].value,
           (LJSONValue As TJSONObject).Values['text'].value
          ]
        )
     );
    end;

  LJSONArr := LJSONObj.Values['atividades_secundarias'] as TJSONArray;

    mmAtSecundaria.Lines.Clear;

  for LJSONValue in LJSONArr do
    begin
      LObj := LJSONValue as TJSONObject;
      mmAtSecundaria.Lines.Add(
          Format('%s (%s)', [
           (LJSONValue As TJSONObject).Values['code'].value,
           (LJSONValue As TJSONObject).Values['text'].value
          ]
        )
     );
    end;

  pnlConsulta.Visible := False;
  pnlDadosEmpresa.Visible := true;

end;

procedure TviewPrincipal.Button1Click(Sender: TObject);
begin
   pnlConsulta.Visible := true;
   pnlDadosEmpresa.Visible := False;
   edtCnpj.Text := '';
   edtData.Text := '';
   edtNome.Text := '';
   edtNomeFantasia.Text := '';
   edtNatJuridica.Text := '' ;
   edtRua.Text := '';
   edtNumRua.Text := '';
   edtBairro.text := '' ;
   edtCep.Text := '';
   edtUf.Text := '' ;
   edtEmail.Text := '';
   edtTelefone.Text := '';
   edtCidade.Text := '' ;
end;

procedure TviewPrincipal.Button2Click(Sender: TObject);
begin
   pnlSobre.Visible := false;
end;

procedure TviewPrincipal.edtCnpjKeyPress(Sender: TObject; var Key: Char);
begin
  edtCnpj.MaxLength := 14;
  if Key = #13 then
    begin
      Key := #0;
      btConsultarCnpjClick(Sender);
      Exit;
    end;

  if not (Key in ['0'..'9', #8, #22]) then
    begin
      MessageDlg('Apenas números são permitidos!',mtWarning, [mbOK],0);
      Key := #0;
    end;
end;

procedure TviewPrincipal.FormShow(Sender: TObject);
begin
  pnlConsulta.Visible := true;
  pnlDadosEmpresa.Visible := False;
  pnlSobre.Visible := false;

  lkMeuGit.Caption:='<a href="https://github.com/WolffAlc">Acesse aqui o meu GitHub!</a>';
end;

procedure TviewPrincipal.I1Click(Sender: TObject);
begin
  pnlSobre.Visible := true;
end;

procedure TviewPrincipal.lkMeuGitLinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
end;

procedure TviewPrincipal.S2Click(Sender: TObject);
begin
 Application.Terminate;
end;

end.
