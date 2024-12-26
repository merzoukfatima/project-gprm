program ProjectGPRM;

uses
  Vcl.Forms,
  unPrincipale in 'unPrincipale.pas' {fmPrincipale},
  unConnexion in 'unConnexion.pas' {fmConnexion},
  unDonnees in 'unDonnees.pas' {dmDonnees: TDataModule},
  unFonction_Procedure in 'unFonction_Procedure.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDonnees, dmDonnees);
  Application.CreateForm(TfmPrincipale, fmPrincipale);
  Application.Run;
end.
