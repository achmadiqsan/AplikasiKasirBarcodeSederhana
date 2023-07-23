unit URekapitulasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls;

type
  TFRekap = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure bersih;
    procedure Panel5Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure hitungData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRekap: TFRekap;

implementation

uses
  UDataModule;

{$R *.dfm}

procedure TFRekap.bersih;
begin
  DateTimePicker1.Date := Now;
  DateTimePicker2.Date := Now;
  Panel2.Caption := '0';
  Panel3.Caption := 'Rp. 000.000.000.000';
  DM.ADOQdetailTransaksi.Filtered := False;
end;

procedure TFRekap.FormActivate(Sender: TObject);
begin
  bersih;
  DM.ADOQdetailTransaksi.Close;
  DM.ADOQdetailTransaksi.Open;
end;

procedure TFRekap.Panel5Click(Sender: TObject);
begin
  bersih;
end;

procedure TFRekap.Panel4Click(Sender: TObject);
begin
if DM.ADOQdetailTransaksi.IsEmpty then
   MessageDlg('Data Kosong',mtInformation,[mbok],0)
else
if Application.MessageBox('Yakin Filter Tanggal Sudah Sesuai Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
   begin
      DM.ADOQdetailTransaksi.Filtered := False;
      Dm.ADOQdetailTransaksi.Filter :='tgl>= '+Quotedstr(DateToStr(DateTimePicker1.Date))+'And tgl<= '+Quotedstr(DateToStr(DateTimePicker2.Date));
      Dm.ADOQdetailTransaksi.Filtered := True;
      hitungData;
      DM.ADOQdetailTransaksi.Close;
      DM.ADOQdetailTransaksi.Open;
   end;
end;

procedure TFRekap.hitungData;
var
  TotalBarang,NilaiBarangTerjual : Integer;
begin
if DM.ADOQdetailTransaksi.IsEmpty then
  begin
    Panel2.Caption := '0';
    Panel3.Caption := 'Rp. 000.000.000.000';
  end
else
  begin
    //
    TotalBarang := 0;
    NilaiBarangTerjual := 0;
    DM.ADOQdetailTransaksi.First;
    while not DM.ADOQdetailTransaksi.Eof do
    begin
      TotalBarang := TotalBarang + DM.ADOQdetailTransaksi['qty'];
      NilaiBarangTerjual := NilaiBarangTerjual + DM.ADOQdetailTransaksi['totalHarga'];
      DM.ADOQdetailTransaksi.Next;
    end;
    Panel2.Caption := FloatToStr(TotalBarang);
    //
    Panel3.Caption := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',NilaiBarangTerjual);
  end;
end;

end.
