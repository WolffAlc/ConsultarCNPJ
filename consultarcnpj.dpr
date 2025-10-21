program consultarcnpj;

uses
  Vcl.Forms,
  consultarcnpj.view.principal in 'consultarcnpj.view.principal.pas' {viewPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TviewPrincipal, viewPrincipal);
  Application.Run;
end.
