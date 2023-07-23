unit UReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, jpeg, QRCtrls;

type
  TFReport = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel30: TQRLabel;
    procedure QuickRep1AfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReport: TFReport;

implementation

uses
  UDataModule, UMenu;

{$R *.dfm}

procedure TFReport.QuickRep1AfterPreview(Sender: TObject);
begin
    DM.ADOQTempDetilTransakasi.Close;
    DM.ADOQTempDetilTransakasi.SQL.Clear;
    DM.ADOQTempDetilTransakasi.SQL.Add('DELETE FROM tempDetailTransaksi');
    DM.ADOQTempDetilTransakasi.ExecSQL;
    //
    DM.ADOQTempDetilTransakasi.Close;
    DM.ADOQTempDetilTransakasi.SQL.Clear;
    DM.ADOQTempDetilTransakasi.SQL.Add('SELECT * FROM tempDetailTransaksi');
    DM.ADOQTempDetilTransakasi.Open;
end;

end.
