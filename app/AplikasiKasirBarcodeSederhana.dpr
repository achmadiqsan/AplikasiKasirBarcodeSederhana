program AplikasiKasirBarcodeSederhana;

uses
  Forms,
  UMenu in 'UMenu.pas' {FMenu},
  ULogin in 'ULogin.pas' {FLogin},
  USettingUser in 'USettingUser.pas' {FUser},
  USettingPeriode in 'USettingPeriode.pas' {FPeriode},
  UCariBarang in 'UCariBarang.pas' {FCariBarang},
  URekapitulasi in 'URekapitulasi.pas' {FRekap},
  UDataBarang in 'UDataBarang.pas' {FBarang},
  USatuan in 'USatuan.pas' {FSatuan},
  UReport in 'UReport.pas' {FReport},
  UPreviewBarang in 'UPreviewBarang.pas' {FPreviewBarang},
  UDataModule in 'UDataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TFUser, FUser);
  Application.CreateForm(TFPeriode, FPeriode);
  Application.CreateForm(TFCariBarang, FCariBarang);
  Application.CreateForm(TFRekap, FRekap);
  Application.CreateForm(TFBarang, FBarang);
  Application.CreateForm(TFSatuan, FSatuan);
  Application.CreateForm(TFReport, FReport);
  Application.CreateForm(TFPreviewBarang, FPreviewBarang);
  Application.Run;
end.
