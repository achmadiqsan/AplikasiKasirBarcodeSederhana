unit UPreviewBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls;

type
  TFPreviewBarang = class(TForm)
    Panel1: TPanel;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit10: TEdit;
    Label12: TLabel;
    Edit11: TEdit;
    Panel9: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    Panel2: TPanel;
    procedure Panel2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure kodeTransaksi;
    procedure Edit11Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure bersih;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPreviewBarang: TFPreviewBarang;
  formattanggal : TDate;
  bln, thn : Word;
  dataBulan,dataTahun,id,datakodeTransaksi,data : string;

implementation

uses
  UDataModule, UMenu, DateUtils;

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

procedure TFPreviewBarang.Panel2Click(Sender: TObject);
begin
  //
  bersih;
end;

procedure TFPreviewBarang.FormCreate(Sender: TObject);
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

procedure TFPreviewBarang.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFPreviewBarang.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFPreviewBarang.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
  begin
    Edit5.Text := FloatToStr(StrToFloat(Edit11.Text) * StrToFloat(Edit2.Text));
  end;

end;

procedure TFPreviewBarang.Edit3Change(Sender: TObject);
begin
  if Edit3.Text <> '' then
  begin
    Edit4.Text := FloatToStr((StrToFloat(Edit11.Text) * StrToFloat(Edit3.Text)) / 100);
    Edit5.Text := FloatToStr((StrToFloat(Edit11.Text) * StrToFloat(Edit2.Text)) - StrToFloat(Edit4.Text));
  end;
end;

procedure TFPreviewBarang.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  Edit2.SetFocus;
  //
  formattanggal := DateTimePicker1.Date;
  bln := MonthOf(formattanggal);
  thn := YearOf(formattanggal);
  case bln of
    1 : dataBulan := 'JAN';
    2 : dataBulan := 'FEB';
    3 : dataBulan := 'MAR';
    4 : dataBulan := 'APR';
    5 : dataBulan := 'MEI';
    6 : dataBulan := 'JUN';
    7 : dataBulan := 'JUL';
    8 : dataBulan := 'AGU';
    9 : dataBulan := 'SEP';
    10 : dataBulan := 'OKT';
    11 : dataBulan := 'NOV';
    12 : dataBulan := 'DES';
  end;
  dataTahun := IntToStr(thn);
end;

procedure TFPreviewBarang.Panel9Click(Sender: TObject);
begin
  if Edit2.Text = '' then
     MessageDlg('Qty Tidak Boleh Kosong',mtInformation,[mbok],0)
  else
  if Edit2.Text = '0' then
     MessageDlg('Qty Tidak Boleh Nol',mtInformation,[mbok],0)
  else
  if Edit3.Text = '' then
     MessageDlg('Persen Diskon Tidak Boleh Kosong',mtInformation,[mbok],0)
  else
  begin
    data := DM.ADOQBarang['stok'] - StrToInt(Edit2.Text);
    DM.ADOQBarang.Close;
    DM.ADOQBarang.SQL.Clear;
    DM.ADOQBarang.SQL.Add('UPDATE dataBarang SET stok = "'+data+'" WHERE kodeBarang = "'+Edit7.Text+'"');
    DM.ADOQBarang.ExecSQL;
    //
    DM.ADOQBarang.Close;
    DM.ADOQBarang.SQL.Clear;
    DM.ADOQBarang.SQL.Add('SELECT * FROM dataBarang');
    DM.ADOQBarang.Open;
    //
    kodeTransaksi;
    DM.ADOQTempDetilTransakasi.Append;
    DM.ADOQTempDetilTransakasi['kodeTransaksi'] := datakodeTransaksi;
    DM.ADOQTempDetilTransakasi['tgl'] := DateTimePicker1.Date;
    DM.ADOQTempDetilTransakasi['kodeBarang'] := Edit7.Text;
    DM.ADOQTempDetilTransakasi['namaBarang'] := Edit8.Text;
    DM.ADOQTempDetilTransakasi['satuan'] := Edit10.Text;
    DM.ADOQTempDetilTransakasi['hargaSatuan'] := HapusFormat(Edit11);
    DM.ADOQTempDetilTransakasi['stok'] := Edit1.Text;
    DM.ADOQTempDetilTransakasi['qty'] := Edit2.Text;
    DM.ADOQTempDetilTransakasi['diskon'] := Edit3.Text;
    DM.ADOQTempDetilTransakasi['diskonRupiah'] := HapusFormat(Edit4);
    DM.ADOQTempDetilTransakasi['totalHarga'] := HapusFormat(Edit5);
    DM.ADOQTempDetilTransakasi['bulan'] := dataBulan;
    DM.ADOQTempDetilTransakasi['tahun'] := dataTahun;
    DM.ADOQTempDetilTransakasi.Post;
    FMenu.Label11.Caption := datakodeTransaksi;
    bersih;
    FPreviewBarang.Close;
    FMenu.Edit2.Enabled := True;
  end;
end;

procedure TFPreviewBarang.kodeTransaksi;
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

procedure TFPreviewBarang.Edit11Change(Sender: TObject);
begin
//  Ribuan(Edit11);
end;

procedure TFPreviewBarang.Edit4Change(Sender: TObject);
begin
//  Ribuan(Edit4);
end;

procedure TFPreviewBarang.Edit5Change(Sender: TObject);
begin
//  Ribuan(Edit5);
end;

procedure TFPreviewBarang.bersih;
begin
  Edit7.Clear;
  Edit8.Clear;
  DateTimePicker1.Date := Now;
  Edit10.Clear;
  Edit11.Clear;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  FPreviewBarang.Close;
end;

end.
