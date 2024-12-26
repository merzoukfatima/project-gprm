unit unFonction_Procedure;

interface

//***Déclaration unités système***//

uses FireDAC.Comp.Client, Vcl.Dialogs, Vcl.Forms, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
     Winapi.Windows, Data.DB, ComObj, System.Variants, IdSNTP, Vcl.Menus, System.SysUtils,
     FireDAC.Comp.DataSet, ActiveX, System.Types; //, frxClass;

//***Déclaration Procedures***//

//procedure prcAutorisation(const Nom_Menu: string; Fiche: TForm);

//procedure prcEffacement_Tout_Editeur(Form: TForm);

//procedure prcExporter_Excel(const DBGrid1: TDBGrid; DBGrid2: TDBGrid; Titre: string);

//procedure prcExporter_Excel_Maitre_Detail(DBGrid1, DBGrid2: TDBGrid; Titre: string);

//procedure prcExporter_Excel_Utilisateur(dgUtilisateur, dgMenu, dgOperation: TDBGrid);

//procedure prcAffichage_Rapport(frxRapport : TfrxReport);

//procedure prcFiltre_Trie_Ordre_Rafraichissement_Total_Ligne_Journalisation(const qrSelect: TFDQuery; Parametre_Macro, Colonne: String; Editeur: TEdit; Menu: TMenuItem; Form: TForm; Titre: String; Initialiser_Parametre: Boolean);

//procedure prcRecuperer(Table, Colonne_SELECT, Colonne_WHERE, Valeur_Colonne_WHERE, Colonne_SET, Valeur_Colonne_SET: String);

//procedure prcDetail_Modification(qrSelect: TFDQuery; Colonne_SELECT, Table, Colonne_WHERE, Valeur_Colonne_WHERE: String);

//***Déclaration Fonctions***//

//function fncExistance_Donnees(qrSelect: TFDDataSet; Operation: string): Boolean;

//function fncLigne_Type_MAJ(qrSelect: TFDQuery; Type_MAJ: String): Boolean;

//function fncDate_Internet(var Reception: Boolean): TDateTime;

//***Déclaration Variables***//

var vpID_Utilisateur, vpNom_Utilisateur, vpDate_Jour, vpApparence: String;
    vpApplication_Terminate: Boolean;

implementation

uses unDonnees;

end.
