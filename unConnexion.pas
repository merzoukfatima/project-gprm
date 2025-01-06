unit unConnexion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage,

  FireDAC.Comp.Client, System.Hash, System.ImageList, Vcl.ImgList;

type
  TfmConnexion = class(TForm)
    pnPrincipale: TPanel;
    pnBackgroundImage: TPanel;
    imBackgroundImage: TImage;
    lbProject: TLabel;
    lbBienvenue: TLabel;
    imLogo: TImage;
    pnUsername: TPanel;
    lbUsername: TLabel;
    spUsername: TShape;
    edNom: TEdit;
    pnPassword: TPanel;
    lbPassword: TLabel;
    spPassword: TShape;
    edMots_Passe_Crypte: TEdit;
    pnConnecte: TPanel;
    sbValider: TSpeedButton;
    pnAnnuler: TPanel;
    spAnnuler: TShape;
    sbAnnuler: TSpeedButton;
    Label1: TLabel;
    Image1: TImage;
    spFermer: TSpeedButton;
    imMots_Passe_Crypter: TImage;
    procedure spFermerClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edNomDblClick(Sender: TObject);
    procedure edNomKeyPress(Sender: TObject; var Key: Char);
    procedure edMots_Passe_CrypteDblClick(Sender: TObject);
    procedure edMots_Passe_CrypteKeyPress(Sender: TObject; var Key: Char);
    procedure sbAnnulerClick(Sender: TObject);
    procedure sbValiderClick(Sender: TObject);
    procedure imMots_Passe_CrypterMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imMots_Passe_CrypterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    qrTest_Utilisateur : TFDQuery;
  end;

var
  fmConnexion: TfmConnexion;

implementation

uses unDonnees, unFonction_Procedure, unPrincipale;
{$R *.dfm}

procedure TfmConnexion.edMots_Passe_CrypteDblClick(Sender: TObject);
begin
fmConnexion.edMots_Passe_Crypte.Text := '0000';
end;

procedure TfmConnexion.edMots_Passe_CrypteKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13
then fmConnexion.sbValiderClick(Sender);
end;

procedure TfmConnexion.edNomDblClick(Sender: TObject);
begin
fmConnexion.edNom.Text := 'ADMINISTRATEUR';
end;

procedure TfmConnexion.edNomKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [#3,#22,#24,#13,#8,'A'..'z'])
then key := #0;
if key = #13
then fmConnexion.edMots_Passe_Crypte.SetFocus;
end;

procedure TfmConnexion.FormResize(Sender: TObject);
begin
//pnPrincipale.Top:=round(fmConnexion.Height/2 - pnPrincipale.Height/2);
//pnPrincipale.Left:=round(fmConnexion.Width/2 - pnPrincipale.Width/2);
end;

procedure TfmConnexion.imMots_Passe_CrypterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
fmConnexion.edMots_Passe_Crypte.PasswordChar := #0;
end;

procedure TfmConnexion.imMots_Passe_CrypterMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
fmConnexion.edMots_Passe_Crypte.PasswordChar := '*';
end;

procedure TfmConnexion.sbAnnulerClick(Sender: TObject);
begin
fmConnexion.ModalResult := mrCancel;
end;

procedure TfmConnexion.sbValiderClick(Sender: TObject);
var Cle, Crypte :String;
begin
if fmConnexion.edNom.Text = ''
then begin
          Application.MessageBox('Veuillez saisir Nom utilisateur !','Message GPRM', MB_ICONEXCLAMATION);
          fmConnexion.edNom.SetFocus;
          Exit;
     end;

if fmConnexion.edMots_Passe_Crypte.Text = ''
then begin
          Application.MessageBox('Veuillez saisir Mots de passe !','Message GPRM', MB_ICONEXCLAMATION);
          fmConnexion.edMots_Passe_Crypte.SetFocus;
          Exit;
     end;

fmConnexion.qrTest_Utilisateur := TFDQuery.Create(Self);
fmConnexion.qrTest_Utilisateur.Connection := dmDonnees.coDB_GPRM;

fmConnexion.qrTest_Utilisateur.Close;
fmConnexion.qrTest_Utilisateur.SQL.Text:=
'SELECT *, FORMAT (GETDATE(), ''dd/MM/yyyy'') AS Date_Serveur' + sLineBreak +
'FROM Utilisateur' + sLineBreak +
'WHERE (Nom = :Nom) AND (Supprimer = 0)';
fmConnexion.qrTest_Utilisateur.ParamByName('Nom').AsString := fmConnexion.edNom.Text;
fmConnexion.qrTest_Utilisateur.Open;

if fmConnexion.qrTest_Utilisateur.IsEmpty
then begin
          Application.MessageBox('Nom utilisateur incorrect !','Message GPRM', MB_ICONERROR);
          fmConnexion.edNom.SetFocus;
          Exit;
     end;

Cle := fmConnexion.qrTest_Utilisateur['Mots_Passe_Cle'];
Crypte := THashSHA2.GetHashString(fmConnexion.edMots_Passe_Crypte.Text + Cle, THashSHA2.TSHA2Version.SHA256);

if Crypte <> fmConnexion.qrTest_Utilisateur['Mots_Passe_Crypte']
then begin
          Application.MessageBox('Mots de passe incorrect !','Message GPRM', MB_ICONERROR);
          fmConnexion.edMots_Passe_Crypte.SetFocus;
          Exit;
     end;

fmConnexion.ModalResult := mrOk;
end;

procedure TfmConnexion.spFermerClick(Sender: TObject);
begin
Application.Terminate;
end;

end.
