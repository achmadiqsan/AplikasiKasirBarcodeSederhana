unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Grids, DBGrids, StdCtrls, TeeProcs, TeEngine,
  Chart, Series, Menus, ComCtrls;

type
  TFMenu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Image1: TImage;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Image8: TImage;
    Image6: TImage;
    Image7: TImage;
    Chart1: TChart;
    Chart2: TChart;
    Chart3: TChart;
    Label1: TLabel;
    Label2: TLabel;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TLineSeries;
    Panel14: TPanel;
    Panel15: TPanel;
    Image9: TImage;
    Label3: TLabel;
    Image10: TImage;
    Label4: TLabel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label5: TLabel;
    Panel18: TPanel;
    Panel19: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Panel20: TPanel;
    Label8: TLabel;
    Panel21: TPanel;
    Label9: TLabel;
    Panel23: TPanel;
    Label10: TLabel;
    Panel24: TPanel;
    Panel25: TPanel;
    Edit1: TEdit;
    Panel26: TPanel;
    Image11: TImage;
    Panel27: TPanel;
    Image12: TImage;
    Panel28: TPanel;
    Image13: TImage;
    Panel29: TPanel;
    Image14: TImage;
    MainMenu1: TMainMenu;
    MASTER1: TMenuItem;
    DATABARANG1: TMenuItem;
    LAPORAN1: TMenuItem;
    LAPORANPENJUALAN1: TMenuItem;
    SETTING1: TMenuItem;
    SETTINGUSER1: TMenuItem;
    SETTINGPERIODE1: TMenuItem;
    EXIT1: TMenuItem;
    IDAK1: TMenuItem;
    YA1: TMenuItem;
    Edit2: TEdit;
    DATASATUAN1: TMenuItem;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure SETTINGUSER1Click(Sender: TObject);
    procedure SETTINGPERIODE1Click(Sender: TObject);
    procedure YA1Click(Sender: TObject);
    procedure exitApp;
    procedure Panel10Click(Sender: TObject);
    procedure DATASATUAN1Click(Sender: TObject);
    procedure DATABARANG1Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure LAPORANPENJUALAN1Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel26Click(Sender: TObject);
    procedure Panel27Click(Sender: TObject);
    procedure baru;
    procedure Image12Click(Sender: TObject);
    procedure kodeTransaksi;
    procedure Panel28Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure hapusTransaksi;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure hitungDataTempDetailTransaksi;
    procedure Edit2Change(Sender: TObject);
    procedure Panel29Click(Sender: TObject);
    procedure cetak;
    procedure Image14Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure databaru;
    procedure Image4Click(Sender: TObject);
    procedure refreshdata;
    procedure dataTotalJual;
    procedure bersihGrafik1;
    procedure bersihGrafik2;
    procedure tampilDataGrafik1;
    procedure tampilDataGrafik2;
    procedure dataAhad;
    procedure bersihGrafik3;
    procedure tampilDataGrafik3;
    procedure hitungtotaljualAhad;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;
  id,datakodeTransaksi,dataStok,kodeTransaksi2,kodeBarang2 : string;
  TotalQty,TotalHarga,TotalDiskon,TotalBayar : real;

implementation

uses
  USettingUser, USettingPeriode, UDataModule, ULogin, URekapitulasi, UDataBarang,
  USatuan, UReport, UPreviewBarang, UCariBarang;


function Ribuan(Edit:TEdit):string;
var
  NilaiRupiah : string;
  AngkaRupiah : Currency;
begin
  if Edit.Text='' then Exit;
  NilaiRupiah := Edit.Text;
  NilaiRupiah := StringReplace(NilaiRupiah,',','',[rfReplaceAll,rfIgnoreCase]);
  NilaiRupiah := StringReplace(NilaiRupiah,'.','',[rfReplaceAll,rfIgnoreCase]);
  AngkaRupiah := StrToCurrDef(NilaiRupiah,0);
  Edit.Text := FormatCurr('#,###',AngkaRupiah);
  Edit.SelStart := Length(Edit.Text)
end;

function HapusFormat(Nilai:TEdit):Integer;
var
  hasil : String;
begin
  hasil := Nilai.text;
  hasil := StringReplace(hasil,',','',[rfReplaceAll,rfIgnoreCase]);
  hasil := StringReplace(hasil,'.','',[rfReplaceAll,rfIgnoreCase]);
  Result := StrToInt(hasil);
end;

{$R *.dfm}

procedure TFMenu.FormCreate(Sender: TObject);
// code untuk disable close button pada form :
var
  hSysMenu:HMENU;
begin
  hSysMenu:=GetSystemMenu(Self.Handle,False);
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu,SC_CLOSE,MF_BYCOMMAND or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
end;

procedure TFMenu.SETTINGUSER1Click(Sender: TObject);
begin
  FUser.Show;
end;

procedure TFMenu.SETTINGPERIODE1Click(Sender: TObject);
begin
  FPeriode.Show;
end;

procedure TFMenu.YA1Click(Sender: TObject);
begin
  //
  exitApp;
end;

procedure TFMenu.exitApp;
begin
  // membersihkan temp peridoe :
  DM.ADOQTempPeriode.Edit;
  DM.ADOQTempPeriode['periode'] := '-';
  DM.ADOQTempPeriode.Post;
  // tutup menu dan show login kembali :
  FMenu.Hide;
  FLogin.Show;
end;

procedure TFMenu.Panel10Click(Sender: TObject);
begin
  //
  exitApp;
end;

procedure TFMenu.DATASATUAN1Click(Sender: TObject);
begin
  FSatuan.Show;
end;

procedure TFMenu.DATABARANG1Click(Sender: TObject);
begin
  FBarang.Show;
end;

procedure TFMenu.Panel7Click(Sender: TObject);
begin
  FBarang.Show;
end;

procedure TFMenu.LAPORANPENJUALAN1Click(Sender: TObject);
begin
  FRekap.Show;
end;

procedure TFMenu.Panel8Click(Sender: TObject);
begin
  FRekap.Show;
end;

procedure TFMenu.Panel9Click(Sender: TObject);
begin
  //
  refreshdata;
end;

procedure TFMenu.Panel26Click(Sender: TObject);
begin
  FCariBarang.Show;
end;

procedure TFMenu.Panel27Click(Sender: TObject);
begin
  //
  baru;
end;

procedure TFMenu.baru;
begin
  Panel26.Enabled := True;
  Image11.Enabled := True;
  Edit1.Enabled := True;
  Panel28.Enabled := True;
  Image13.Enabled := True;
  Panel29.Enabled := True;
  Image14.Enabled := True;
  //
  databaru;
  //
  MessageDlg('New Data Berhasil Di Buat',mtInformation,[mbok],0)
end;

procedure TFMenu.Image12Click(Sender: TObject);
begin
  //
  baru;
end;

procedure TFMenu.kodeTransaksi;
begin
    // coding untuk memilih kode dengan nomor yg paling terbesar :
  DM.ADOQKode.Close;
  DM.ADOQKode.SQL.Clear;
  DM.ADOQKode.SQL.Add('SELECT TOP 1 headerTransaksi.kodeTransaksi FROM headerTransaksi');
  DM.ADOQKode.SQL.Add('ORDER BY headerTransaksi.kodeTransaksi DESC');
  DM.ADOQKode.Open;

  // coding untuk mengcopy nilai yang di seleksi :
  id := Copy(DM.ADOQKode.Fields[0].AsString, 4, 7);

  // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
  if id <> '' then id := FormatFLoat('0000000', StrtoInt(id) + 1)
  else id := '0000001';

  // coding melakukan pengabungan kode string dan integer :
  datakodeTransaksi := 'KT-' + id;
end;

procedure TFMenu.Panel28Click(Sender: TObject);
begin
//
hapusTransaksi;
hitungDataTempDetailTransaksi;
end;

procedure TFMenu.Image13Click(Sender: TObject);
begin
//
hapusTransaksi;
hitungDataTempDetailTransaksi;
end;

procedure TFMenu.hapusTransaksi;
begin
if DM.ADOQTempDetilTransakasi.IsEmpty then
   MessageDlg('Data Kosong',mtInformation,[mbok],0)
else
if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
   begin
    //dataStok := DM.ADOQBarang['stok'] + DM.ADOQTempDetilTransakasi['qty'];
    dataStok := DM.ADOQTempDetilTransakasi['stok'];
    kodeTransaksi2 := DM.ADOQTempDetilTransakasi['kodeTransaksi'];
    kodeBarang2 := DM.ADOQTempDetilTransakasi['kodeBarang'];
    DM.ADOQBarang.Close;
    DM.ADOQBarang.SQL.Clear;
    DM.ADOQBarang.SQL.Add('UPDATE dataBarang SET stok = "'+dataStok+'" WHERE kodeBarang = "'+kodeBarang2+'"');
    DM.ADOQBarang.ExecSQL;
    //Dm.ADOQTempDetilTransakasi.Delete;
    DM.ADOQTempDetilTransakasi.Close;
    DM.ADOQTempDetilTransakasi.SQL.Clear;
    DM.ADOQTempDetilTransakasi.SQL.Add('DELETE FROM tempDetailTransaksi WHERE kodeTransaksi = "'+kodeTransaksi2+'" AND kodeBarang = "'+kodeBarang2+'"');
    DM.ADOQTempDetilTransakasi.ExecSQL;
    //
    DM.ADOQTempDetilTransakasi.Close;
    DM.ADOQTempDetilTransakasi.SQL.Clear;
    DM.ADOQTempDetilTransakasi.SQL.Add('SELECT * FROM tempDetailTransaksi');
    DM.ADOQTempDetilTransakasi.Open;
    //
    DM.ADOQBarang.Close;
    DM.ADOQBarang.SQL.Clear;
    DM.ADOQBarang.SQL.Add('SELECT * FROM dataBarang');
    DM.ADOQBarang.Open;
    if DM.ADOQTempDetilTransakasi.IsEmpty then
    begin
      FMenu.Label11.Caption := 'Label11';
    end;
    Edit2.Text := '0';
   end;
   Edit2.SetFocus;
end;

procedure TFMenu.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFMenu.FormActivate(Sender: TObject);
begin
//
  DateTimePicker1.Date := Now;
  Edit1.Clear;
  //
  DM.ADOQTempPeriode.Close;
  DM.ADOQTempPeriode.Open;
  Label16.Caption := 'Periode : ' + DM.ADOQTempPeriode['periode'];
  //
  dataAhad;
  //
  bersihGrafik1;
  tampilDataGrafik1;
  bersihGrafik2;
  tampilDataGrafik2;
  bersihGrafik3;
  tampilDataGrafik3;
  hitungtotaljualAhad;
  //
  hitungDataTempDetailTransaksi;
  //
  dataTotalJual;
end;

procedure TFMenu.hitungDataTempDetailTransaksi;
begin
if DM.ADOQTempDetilTransakasi.IsEmpty then
  begin
    Panel18.Caption := '0';
    Panel19.Caption := 'Rp. 00.000.000.000';
    Panel20.Caption := 'Rp. 00.000.000.000';
    Panel21.Caption := 'Rp. 00.000.000.000';
    Edit2.Text := '0';
    Panel23.Caption := 'Rp. 00.000.000.000';
    Label11.Caption := 'label11';
    Label12.Caption := 'label12';
    Label13.Caption := 'label13';
    Label14.Caption := 'label14';
    Label15.Caption := 'label15';
  end
else
  begin
    //
    TotalQty := 0;
    TotalHarga := 0;
    TotalDiskon := 0;
    TotalBayar := 0;
    DM.ADOQTempDetilTransakasi.First;
    while not DM.ADOQTempDetilTransakasi.Eof do
    begin
      TotalQty := TotalQty + DM.ADOQTempDetilTransakasi['qty'];
      TotalHarga := TotalHarga + DM.ADOQTempDetilTransakasi['totalHarga'];
      TotalDiskon := TotalDiskon + DM.ADOQTempDetilTransakasi['diskonRupiah'];
      DM.ADOQTempDetilTransakasi.Next;
    end;
    Panel18.Caption := FloatToStr(TotalQty);
    //
    Label12.Caption := FloatToStr(TotalHarga);
    Panel19.Caption := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',TotalHarga);
    //
    Label13.Caption := FloatToStr(TotalDiskon);
    Panel20.Caption := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',TotalDiskon);
    //
    TotalBayar := TotalHarga - TotalDiskon;
    Label14.Caption := FloatToStr(TotalBayar);
    Panel21.Caption := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',TotalBayar);
  end;
end;

procedure TFMenu.Edit2Change(Sender: TObject);
var
  bayar,kembalian : Real;
begin
//
Ribuan(Edit2);
if Edit2.Text <> '' then
  begin
    bayar := HapusFormat(Edit2);
    kembalian := bayar - TotalBayar;
    Panel23.Caption := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',kembalian);
    Label15.Caption := FloatToStr(kembalian);
  end;
end;

procedure TFMenu.Panel29Click(Sender: TObject);
begin
//
cetak;
end;

procedure TFMenu.cetak;
var
  k : Integer;
begin
//
if HapusFormat(Edit2) >= TotalBayar then
  begin
    //MessageDlg('Data Bayar OK',mtInformation,[mbok],0);
    if Application.MessageBox('Yakin Cetak Struk ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
    begin
        //
        FReport.QRLabel5.Caption := FMenu.Label11.Caption;
        FReport.QRLabel8.Caption := FMenu.Panel19.Caption;
        FReport.QRLabel11.Caption := FMenu.Panel21.Caption;
        FReport.QRLabel14.Caption := FormatDateTime('dd-mmm-yyyy',Now);
        FReport.QRLabel23.Caption := FMenu.Panel20.Caption;
        FReport.QRLabel22.Caption := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',HapusFormat(Edit2));;
        FReport.QRLabel21.Caption := FMenu.Panel23.Caption;
        //
        DM.ADOQheaderTransaksi.Append;
        DM.ADOQheaderTransaksi['kodeTransaksi'] := Label11.Caption;
        DM.ADOQheaderTransaksi['tgl'] := Now;
        DM.ADOQheaderTransaksi['totalHarga'] := Label12.Caption;
        DM.ADOQheaderTransaksi['totalBayar'] := Label14.Caption;
        DM.ADOQheaderTransaksi['totalDiskon'] := Label13.Caption;
        DM.ADOQheaderTransaksi['bayar'] := HapusFormat(Edit2);
        DM.ADOQheaderTransaksi['kembalian'] := Label15.Caption;
        DM.ADOQheaderTransaksi.Post;
        //
        for k := 1 to DM.ADOQTempDetilTransakasi.RecordCount do
        DM.ADOQTempDetilTransakasi.First;
        while DM.ADOQTempDetilTransakasi.Eof = False do
        begin
          DM.ADOQdetailTransaksi.Append;
          DM.ADOQdetailTransaksi['kodeTransaksi'] := DM.ADOQTempDetilTransakasi['kodeTransaksi'];
          DM.ADOQdetailTransaksi['tgl'] := DM.ADOQTempDetilTransakasi['tgl'];
          DM.ADOQdetailTransaksi['kodeBarang'] := DM.ADOQTempDetilTransakasi['kodeBarang'];
          DM.ADOQdetailTransaksi['namaBarang'] := DM.ADOQTempDetilTransakasi['namaBarang'];
          DM.ADOQdetailTransaksi['satuan'] := DM.ADOQTempDetilTransakasi['satuan'];
          DM.ADOQdetailTransaksi['hargaSatuan'] := DM.ADOQTempDetilTransakasi['hargaSatuan'];
          DM.ADOQdetailTransaksi['stok'] := DM.ADOQTempDetilTransakasi['stok'];
          DM.ADOQdetailTransaksi['qty'] := DM.ADOQTempDetilTransakasi['qty'];
          DM.ADOQdetailTransaksi['diskon'] := DM.ADOQTempDetilTransakasi['diskon'];
          DM.ADOQdetailTransaksi['diskonRupiah'] := DM.ADOQTempDetilTransakasi['diskonRupiah'];
          DM.ADOQdetailTransaksi['totalHarga'] := DM.ADOQTempDetilTransakasi['totalHarga'];
          DM.ADOQdetailTransaksi['bulan'] := DM.ADOQTempDetilTransakasi['bulan'];
          DM.ADOQdetailTransaksi['tahun'] := DM.ADOQTempDetilTransakasi['tahun'];
          DM.ADOQdetailTransaksi.Post;
          DM.ADOQTempDetilTransakasi.Next;
        end;
        FReport.QuickRep1.Preview;
    end
    else if HapusFormat(Edit2) < TotalBayar then
    begin
      MessageDlg('Silahkan Masukkan Data Bayar Yang Benar',mtInformation,[mbok],0);
    end;
  end;
end;

procedure TFMenu.Image14Click(Sender: TObject);
begin
cetak;
end;

procedure TFMenu.Edit1Change(Sender: TObject);
begin
  if Edit1.Text = '' then
       begin
        Dm.ADOQBarang.Filtered := False;
       end
  else
      begin
         Dm.ADOQBarang.Filtered := False;
         Dm.ADOQBarang.Filter :='kodeBarang = '+Quotedstr(Edit1.Text);
         Dm.ADOQBarang.Filtered := True;
       end;
end;

procedure TFMenu.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
  begin
    FPreviewBarang.Edit7.Text := Dm.ADOQBarang['kodeBarang']  ;
    FPreviewBarang.Edit8.Text := Dm.ADOQBarang['namaBarang']  ;
    FPreviewBarang.Edit10.Text := Dm.ADOQBarang['satuan']  ;
    FPreviewBarang.Edit11.Text:= Dm.ADOQBarang['hargaJual'] ;
    FPreviewBarang.Edit1.Text := DM.ADOQBarang['stok'] ;
    FPreviewBarang.Show;
  end;
end;

procedure TFMenu.databaru;
var
  k : Integer;
begin
  if DM.ADOQTempDetilTransakasi.IsEmpty = False then
  begin
    for k := 1 to DM.ADOQTempDetilTransakasi.RecordCount do
        DM.ADOQTempDetilTransakasi.First;
        while DM.ADOQTempDetilTransakasi.Eof = False do
        begin
          dataStok := DM.ADOQTempDetilTransakasi['stok'];
          kodeBarang2 := DM.ADOQTempDetilTransakasi['kodeBarang'];
          DM.ADOQBarang.Close;
          DM.ADOQBarang.SQL.Clear;
          DM.ADOQBarang.SQL.Add('UPDATE dataBarang SET stok = "'+dataStok+'" WHERE kodeBarang = "'+kodeBarang2+'"');
          DM.ADOQBarang.ExecSQL;
          DM.ADOQTempDetilTransakasi.Next;
        end;
    //
  DM.ADOQTempDetilTransakasi.Close;
  DM.ADOQTempDetilTransakasi.SQL.Clear;
  DM.ADOQTempDetilTransakasi.SQL.Add('DELETE FROM tempDetailTransaksi');
  DM.ADOQTempDetilTransakasi.ExecSQL;
  //
  DM.ADOQTempDetilTransakasi.Close;
  DM.ADOQTempDetilTransakasi.SQL.Clear;
  DM.ADOQTempDetilTransakasi.SQL.Add('SELECT * FROM tempDetailTransaksi');
  DM.ADOQTempDetilTransakasi.Open;
  hitungDataTempDetailTransaksi;
  //
  DM.ADOQBarang.Close;
  DM.ADOQBarang.SQL.Clear;
  DM.ADOQBarang.SQL.Add('SELECT * FROM dataBarang');
  DM.ADOQBarang.Open;
  end;
end;

procedure TFMenu.Image4Click(Sender: TObject);
begin
  refreshdata;
end;

procedure TFMenu.refreshdata;
begin
Panel26.Enabled := False;
Image11.Enabled := False;
Edit1.Enabled := False;
Panel28.Enabled := False;
Image13.Enabled := False;
Panel29.Enabled := False;
Image14.Enabled := False;
Edit2.Enabled := False;
//
databaru;
dataTotalJual;
//
bersihGrafik1;
tampilDataGrafik1;
bersihGrafik2;
tampilDataGrafik2;
bersihGrafik3;
tampilDataGrafik3;
hitungtotaljualAhad;
//
MessageDlg('Berhasil Refresh Data',mtInformation,[mbok],0);
end;

procedure TFMenu.dataTotalJual;
begin
  DM.TotalJual.Close;
  DM.TotalJual.SQL.Clear;
  DM.TotalJual.SQL.Add('SELECT SUM(totalHarga) AS TH FROM detailTransaksi WHERE tahun = "'+DM.ADOQTempPeriode['periode']+'"');
  DM.TotalJual.Open;
  Panel14.Caption := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',DM.TotalJual['TH']);
end;

procedure TFMenu.bersihGrafik1;
begin
  Chart1.Series[0].Clear;
  DM.Bulan.Close;
  DM.Bulan.Open;
  While not Dm.Bulan.Eof do
    begin
      Chart1.Series[0].Add(0,Dm.Bulan['bulan']);
      Dm.Bulan.Next;
    end;
end;

procedure TFMenu.bersihGrafik2;
begin
  Chart2.Series[0].Clear;
  DM.Bulan.Close;
  DM.Bulan.Open;
  While not Dm.Bulan.Eof do
    begin
      Chart2.Series[0].Add(0,Dm.Bulan['bulan']);
      Dm.Bulan.Next;
    end;
end;

procedure TFMenu.tampilDataGrafik1;
var
  data : Real;
begin
  Chart1.Series[0].Clear;
  DM.Bulan.Close;
  DM.Bulan.Open;
  //
  DM.dataGrafik1.Close;
  DM.dataGrafik1.Open;
  //
  DM.ADOQTempPeriode.Close;
  DM.ADOQTempPeriode.Open;
  While not Dm.Bulan.Eof do
    begin
      with DM.dataGrafik1 do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT SUM(totalHarga) AS DATA FROM detailTransaksi');
        sql.Add('WHERE bulan = "'+Dm.Bulan['bulan']+'" AND tahun = "'+Dm.ADOQTempPeriode['periode']+'"');
        open;
      end;
      if DM.dataGrafik1['DATA'] = null then data := 0 else data := DM.dataGrafik1['DATA'];
      Chart1.Series[0].Add(data,Dm.Bulan['bulan']);
      Dm.Bulan.Next;
    end;
end;

procedure TFMenu.tampilDataGrafik2;
var
  data : Real;
begin
  Chart2.Series[0].Clear;
  DM.Bulan.Close;
  DM.Bulan.Open;
  //
  DM.dataGrafik2.Close;
  DM.dataGrafik2.Open;
  //
  DM.ADOQTempPeriode.Close;
  DM.ADOQTempPeriode.Open;
  While not Dm.Bulan.Eof do
    begin
      with DM.dataGrafik2 do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT SUM(qty) AS DATA FROM detailTransaksi');
        sql.Add('WHERE bulan = "'+Dm.Bulan['bulan']+'" AND tahun = "'+Dm.ADOQTempPeriode['periode']+'"');
        open;
      end;
      if DM.dataGrafik2['DATA'] = null then data := 0 else data := DM.dataGrafik2['DATA'];
      Chart2.Series[0].Add(data,Dm.Bulan['bulan']);
      Dm.Bulan.Next;
    end;
end;

procedure TFMenu.dataAhad;
var
  hari1,hari2,hari3,hari4,hari5,hari6,hari7: TDate;
  data1,data2 : Real;
begin
//
hari1 := DateTimePicker1.Date - 6;
hari2 := hari1 + 1;
hari3 := hari2 + 1;
hari4 := hari3 + 1;
hari5 := hari4 + 1;
hari6 := hari5 + 1;
hari7 := hari6 + 1;
// ------------------------------------- //
DM.SUMBarang.Close;
DM.SUMBarang.SQL.Clear;
DM.SUMBarang.SQL.Add('SELECT SUM(qty) AS DATA1 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari1)+'#');
DM.SUMBarang.Open;
if DM.SUMBarang['DATA1'] = null then data1 := 0 else data1 := DM.SUMBarang['DATA1'];
//MessageDlg(FloatToStr(data1),mtInformation,[mbok],0);
//
DM.SUMUang.Close;
DM.SUMUang.SQL.Clear;
DM.SUMUang.SQL.Add('SELECT SUM(totalHarga) AS DATA2 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari1)+'#');
DM.SUMUang.Open;
if DM.SUMUang['DATA2'] = null then data2 := 0 else data2 := DM.SUMUang['DATA2'];
//MessageDlg(FloatToStr(data2),mtInformation,[mbok],0);
//
DM.Ahad.Close;
DM.Ahad.SQL.Clear;
DM.Ahad.SQL.Add('UPDATE dataMingguan SET tglName = "'+FormatDateTime('dd-MMM',hari1)+'", tgl = "'+DateToStr(hari1)+'", ');
DM.Ahad.SQL.Add('jmlhBarang = "'+FloatToStr(data1)+'", jmlhUang = "'+FloatToStr(data2)+'" WHERE id = 1');
DM.Ahad.ExecSQL;
// ------------------------------------- //
// ------------------------------------- //
DM.SUMBarang.Close;
DM.SUMBarang.SQL.Clear;
DM.SUMBarang.SQL.Add('SELECT SUM(qty) AS DATA1 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari2)+'#');
DM.SUMBarang.Open;
if DM.SUMBarang['DATA1'] = null then data1 := 0 else data1 := DM.SUMBarang['DATA1'];
//MessageDlg(FloatToStr(data1),mtInformation,[mbok],0);
//
DM.SUMUang.Close;
DM.SUMUang.SQL.Clear;
DM.SUMUang.SQL.Add('SELECT SUM(totalHarga) AS DATA2 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari2)+'#');
DM.SUMUang.Open;
if DM.SUMUang['DATA2'] = null then data2 := 0 else data2 := DM.SUMUang['DATA2'];
//MessageDlg(FloatToStr(data2),mtInformation,[mbok],0);
//
DM.Ahad.Close;
DM.Ahad.SQL.Clear;
DM.Ahad.SQL.Add('UPDATE dataMingguan SET tglName = "'+FormatDateTime('dd-MMM',hari2)+'", tgl = "'+DateToStr(hari2)+'", ');
DM.Ahad.SQL.Add('jmlhBarang = "'+FloatToStr(data1)+'", jmlhUang = "'+FloatToStr(data2)+'" WHERE id = 2');
DM.Ahad.ExecSQL;
// ------------------------------------- //

// ------------------------------------- //
DM.SUMBarang.Close;
DM.SUMBarang.SQL.Clear;
DM.SUMBarang.SQL.Add('SELECT SUM(qty) AS DATA1 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari3)+'#');
DM.SUMBarang.Open;
if DM.SUMBarang['DATA1'] = null then data1 := 0 else data1 := DM.SUMBarang['DATA1'];
//MessageDlg(FloatToStr(data1),mtInformation,[mbok],0);
//
DM.SUMUang.Close;
DM.SUMUang.SQL.Clear;
DM.SUMUang.SQL.Add('SELECT SUM(totalHarga) AS DATA2 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari3)+'#');
DM.SUMUang.Open;
if DM.SUMUang['DATA2'] = null then data2 := 0 else data2 := DM.SUMUang['DATA2'];
//MessageDlg(FloatToStr(data2),mtInformation,[mbok],0);
//
DM.Ahad.Close;
DM.Ahad.SQL.Clear;
DM.Ahad.SQL.Add('UPDATE dataMingguan SET tglName = "'+FormatDateTime('dd-MMM',hari3)+'", tgl = "'+DateToStr(hari3)+'", ');
DM.Ahad.SQL.Add('jmlhBarang = "'+FloatToStr(data1)+'", jmlhUang = "'+FloatToStr(data2)+'" WHERE id = 3');
DM.Ahad.ExecSQL;
// ------------------------------------- //
// ------------------------------------- //
DM.SUMBarang.Close;
DM.SUMBarang.SQL.Clear;
DM.SUMBarang.SQL.Add('SELECT SUM(qty) AS DATA1 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari4)+'#');
DM.SUMBarang.Open;
if DM.SUMBarang['DATA1'] = null then data1 := 0 else data1 := DM.SUMBarang['DATA1'];
//MessageDlg(FloatToStr(data1),mtInformation,[mbok],0);
//
DM.SUMUang.Close;
DM.SUMUang.SQL.Clear;
DM.SUMUang.SQL.Add('SELECT SUM(totalHarga) AS DATA2 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari4)+'#');
DM.SUMUang.Open;
if DM.SUMUang['DATA2'] = null then data2 := 0 else data2 := DM.SUMUang['DATA2'];
//MessageDlg(FloatToStr(data2),mtInformation,[mbok],0);
//
DM.Ahad.Close;
DM.Ahad.SQL.Clear;
DM.Ahad.SQL.Add('UPDATE dataMingguan SET tglName = "'+FormatDateTime('dd-MMM',hari4)+'", tgl = "'+DateToStr(hari4)+'", ');
DM.Ahad.SQL.Add('jmlhBarang = "'+FloatToStr(data1)+'", jmlhUang = "'+FloatToStr(data2)+'" WHERE id = 4');
DM.Ahad.ExecSQL;
// ------------------------------------- //
// ------------------------------------- //
DM.SUMBarang.Close;
DM.SUMBarang.SQL.Clear;
DM.SUMBarang.SQL.Add('SELECT SUM(qty) AS DATA1 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari5)+'#');
DM.SUMBarang.Open;
if DM.SUMBarang['DATA1'] = null then data1 := 0 else data1 := DM.SUMBarang['DATA1'];
//MessageDlg(FloatToStr(data1),mtInformation,[mbok],0);
//
DM.SUMUang.Close;
DM.SUMUang.SQL.Clear;
DM.SUMUang.SQL.Add('SELECT SUM(totalHarga) AS DATA2 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari5)+'#');
DM.SUMUang.Open;
if DM.SUMUang['DATA2'] = null then data2 := 0 else data2 := DM.SUMUang['DATA2'];
//MessageDlg(FloatToStr(data2),mtInformation,[mbok],0);
//
DM.Ahad.Close;
DM.Ahad.SQL.Clear;
DM.Ahad.SQL.Add('UPDATE dataMingguan SET tglName = "'+FormatDateTime('dd-MMM',hari5)+'", tgl = "'+DateToStr(hari5)+'", ');
DM.Ahad.SQL.Add('jmlhBarang = "'+FloatToStr(data1)+'", jmlhUang = "'+FloatToStr(data2)+'" WHERE id = 5');
DM.Ahad.ExecSQL;
// ------------------------------------- //
// ------------------------------------- //
DM.SUMBarang.Close;
DM.SUMBarang.SQL.Clear;
DM.SUMBarang.SQL.Add('SELECT SUM(qty) AS DATA1 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari6)+'#');
DM.SUMBarang.Open;
if DM.SUMBarang['DATA1'] = null then data1 := 0 else data1 := DM.SUMBarang['DATA1'];
//MessageDlg(FloatToStr(data1),mtInformation,[mbok],0);
//
DM.SUMUang.Close;
DM.SUMUang.SQL.Clear;
DM.SUMUang.SQL.Add('SELECT SUM(totalHarga) AS DATA2 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari6)+'#');
DM.SUMUang.Open;
if DM.SUMUang['DATA2'] = null then data2 := 0 else data2 := DM.SUMUang['DATA2'];
//MessageDlg(FloatToStr(data2),mtInformation,[mbok],0);
//
DM.Ahad.Close;
DM.Ahad.SQL.Clear;
DM.Ahad.SQL.Add('UPDATE dataMingguan SET tglName = "'+FormatDateTime('dd-MMM',hari6)+'", tgl = "'+DateToStr(hari6)+'", ');
DM.Ahad.SQL.Add('jmlhBarang = "'+FloatToStr(data1)+'", jmlhUang = "'+FloatToStr(data2)+'" WHERE id = 6');
DM.Ahad.ExecSQL;
// ------------------------------------- //
// ------------------------------------- //
DM.SUMBarang.Close;
DM.SUMBarang.SQL.Clear;
DM.SUMBarang.SQL.Add('SELECT SUM(qty) AS DATA1 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari7)+'#');
DM.SUMBarang.Open;
if DM.SUMBarang['DATA1'] = null then data1 := 0 else data1 := DM.SUMBarang['DATA1'];
//MessageDlg(FloatToStr(data1),mtInformation,[mbok],0);
//
DM.SUMUang.Close;
DM.SUMUang.SQL.Clear;
DM.SUMUang.SQL.Add('SELECT SUM(totalHarga) AS DATA2 FROM detailTransaksi WHERE tgl = #'+DateToStr(hari7)+'#');
DM.SUMUang.Open;
if DM.SUMUang['DATA2'] = null then data2 := 0 else data2 := DM.SUMUang['DATA2'];
//MessageDlg(FloatToStr(data2),mtInformation,[mbok],0);
//
DM.Ahad.Close;
DM.Ahad.SQL.Clear;
DM.Ahad.SQL.Add('UPDATE dataMingguan SET tglName = "'+FormatDateTime('dd-MMM',hari7)+'", tgl = "'+DateToStr(hari7)+'", ');
DM.Ahad.SQL.Add('jmlhBarang = "'+FloatToStr(data1)+'", jmlhUang = "'+FloatToStr(data2)+'" WHERE id = 7');
DM.Ahad.ExecSQL;
// ------------------------------------- //
DM.Ahad.Close;
DM.Ahad.SQL.Clear;
DM.Ahad.SQL.Add('SELECT * FROM dataMingguan');
DM.Ahad.Open;
end;

procedure TFMenu.bersihGrafik3;
begin
  Chart3.Series[0].Clear;
  DM.Ahad.Close;
  DM.Ahad.Open;
  While not Dm.Ahad.Eof do
    begin
      Chart3.Series[0].Add(0,Dm.Ahad['tglName']);
      Dm.Ahad.Next;
    end;
end;

procedure TFMenu.tampilDataGrafik3;
begin
//
  Chart3.Series[0].Clear;
  DM.Ahad.Close;
  DM.Ahad.Open;
  While not Dm.Ahad.Eof do
    begin
      Chart3.Series[0].Add(DM.Ahad['jmlhBarang'],Dm.Ahad['tglName']);
      Dm.Ahad.Next;
    end;
end;

procedure TFMenu.hitungtotaljualAhad;
var
  angka : Real;
begin
//
    angka := 0;
    DM.Ahad.First;
    while not DM.Ahad.Eof do
    begin
      angka := angka + DM.Ahad['jmlhUang'];
      DM.Ahad.Next;
    end;
    Panel15.Caption := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',angka);
end;

end.
