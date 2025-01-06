unit unPrincipale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  FireDAC.Comp.Client, Vcl.Themes, Vcl.Styles, IdSNTP, FireDAC.DApt,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList;

type
  TfmPrincipale = class(TForm)
    stbPrincipale: TStatusBar;
    ilPrincipale: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Vision_Globale: Integer;
  public
    { Public declarations }
  end;

var
  fmPrincipale: TfmPrincipale;

implementation

uses unDonnees, unFonction_Procedure, unConnexion;

{$R *.dfm}

procedure TfmPrincipale.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Application.MessageBox('Etes-vous sûr de vouloir quitter GPRM ?','Message GPRM', MB_ICONQUESTION + MB_YESNO) = IDYES
then Application.Terminate
else Application.Run;
end;

procedure TfmPrincipale.FormCreate(Sender: TObject);
var //Fichier_INI: TSecureMemIniFile;
    Reception: Boolean;
    Date_Internet: TDatetime;
begin
try
   dmDonnees.coDB_GPRM.Connected := True;
except
      Application.MessageBox('Impossible de se connecter au serveur !','Message GPRM', MB_ICONERROR);
      Application.Terminate;
      Exit;
end;

fmConnexion := TfmConnexion.Create(Self);

if fmConnexion.ShowModal = mrCancel
then begin
          Application.Terminate;
          Exit;
     end;

FormatSettings.ThousandSeparator := ' ';
FormatSettings.DecimalSeparator := ',';
FormatSettings.DateSeparator := '/';
FormatSettings.ShortDateFormat := 'dd/MM/yyyy';

TStyleManager.SetStyle(fmConnexion.qrTest_Utilisateur['Apparence']);

//Date_Internet := fncDate_Internet(Reception);
//if Reception = True
//then vpDate_Jour := DateToStr(Date_Internet)
//else
vpDate_Jour := fmConnexion.qrTest_Utilisateur['Date_Serveur'];

vpID_Utilisateur := fmConnexion.qrTest_Utilisateur['ID_Utilisateur'];
vpNom_Utilisateur := fmConnexion.qrTest_Utilisateur['Nom'];

fmPrincipale.stbPrincipale.Panels[0].Text := '   Serveur BDD : ' + dmDonnees.coDB_GPRM.Params.Values['Server'];
fmPrincipale.stbPrincipale.Panels[1].Text := '   Date : ' + vpDate_jour;
fmPrincipale.stbPrincipale.Panels[2].Text := '   Utilisateur : ' + vpNom_Utilisateur;

fmConnexion.Free;
end;
end.
