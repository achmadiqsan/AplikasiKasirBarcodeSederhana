unit UDataBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids;

type
  TFBarang = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel6: TPanel;
    Label3: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    Panel9: TPanel;
    Label11: TLabel;
    Edit10: TEdit;
    Label12: TLabel;
    Edit11: TEdit;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Panel4: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure FormActivate(Sender: TObject);
    procedure dataSatuan;
    procedure bersih;
    procedure Panel8Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure dataInput;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Panel9Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBarang: TFBarang;

implementation

uses
  UDataModule;

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

procedure TFBarang.bersih;
begin
  //
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit4.Clear;
  dataSatuan; Edit5.Clear; Edit6.Clear;
  Edit7.Clear; Edit8.Clear; Edit9.Clear; Edit10.Clear;
  Edit11.Clear;
  DM.ADOQBarang.Filtered := False;
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  Dm.ADOQBarang.Filtered := False;
  DM.ADOQBarang.Close;
  DM.ADOQBarang.Open;
end;

procedure TFBarang.dataSatuan;
begin
  //
  ComboBox1.Clear;
  ComboBox1.Text := '-- PILIH SATUAN --';
  DM.ADOQSatuan.Close;
  DM.ADOQSatuan.Open;
  While not Dm.ADOQSatuan.Eof do
    begin
      ComboBox1.Items.Add(Dm.ADOQSatuan['satuan']);
      Dm.ADOQSatuan.Next;
    end;
end;

procedure TFBarang.FormActivate(Sender: TObject);
begin
  //
  bersih;
end;

procedure TFBarang.Panel8Click(Sender: TObject);
begin
  bersih;
end;

procedure TFBarang.Panel4Click(Sender: TObject);
begin
if RadioButton1.Checked then
   begin
     Dm.ADOQBarang.Filtered := False;
     Dm.ADOQBarang.Filter :='kodeBarang LIKE '+Quotedstr('%'+Edit1.Text+'%');
     Dm.ADOQBarang.Filtered := True;
   end
else
if RadioButton2.Checked then
   begin
     Dm.ADOQBarang.Filtered := False;
     Dm.ADOQBarang.Filter :='namaBarang LIKE '+Quotedstr('%'+Edit1.Text+'%');
     Dm.ADOQBarang.Filtered := True;
   end;
end;

procedure TFBarang.Panel2Click(Sender: TObject);
begin
   if Edit2.Text ='' then
    MessageDlg('Kode Barang Kosong',mtInformation,[mbok],0)
   else
   if Edit3.Text ='' then
    MessageDlg('Nama Barang Kosong',mtInformation,[mbok],0)
   else
   if ComboBox1.Text ='-- PILIH SATUAN --' then
    MessageDlg('Silahkan Pilih Satuan',mtInformation,[mbok],0)
   else
   if Edit4.Text ='' then
    MessageDlg('Stok Kosong',mtInformation,[mbok],0)
   else
   if Edit5.Text ='' then
    MessageDlg('Harga Beli Kosong',mtInformation,[mbok],0)
   else
   if Edit6.Text ='' then
    MessageDlg('Harga Jual Kosong',mtInformation,[mbok],0)
   else
   if Dm.ADOQBarang.Locate('kodeBarang',Edit2.Text,[]) then
    MessageDlg('Kode Barang Telah Ada',mtInformation,[mbok],0)
   else
    begin
      Dm.ADOQBarang.Append;
      dataInput;
      DM.ADOQBarang.Post;
      bersih;
    end;
end;



procedure TFBarang.dataInput;
begin
  //
  Dm.ADOQBarang['kodeBarang'] := Edit2.Text;
  Dm.ADOQBarang['namaBarang'] := Edit3.Text;
  Dm.ADOQBarang['satuan'] := ComboBox1.Text;
  Dm.ADOQBarang['stok'] := HapusFormat(Edit4);
  Dm.ADOQBarang['hargaBeli'] := HapusFormat(Edit5);
  Dm.ADOQBarang['hargaJual'] := HapusFormat(edit6);
end;

procedure TFBarang.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFBarang.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFBarang.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFBarang.Edit5Change(Sender: TObject);
begin
  Ribuan(Edit5);
end;

procedure TFBarang.Edit6Change(Sender: TObject);
begin
  Ribuan(Edit6);
end;

procedure TFBarang.Edit4Change(Sender: TObject);
begin
  Ribuan(Edit4);
end;

procedure TFBarang.Panel3Click(Sender: TObject);
begin
  if DM.ADOQBarang.IsEmpty then
     MessageDlg('Data Kosong',mtInformation,[mbok],0)
  else
  if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
     begin
      Dm.ADOQBarang.Delete;
      bersih;
     end;
end;

procedure TFBarang.Panel5Click(Sender: TObject);
begin
   if Edit2.Text ='' then
    MessageDlg('Kode Barang Kosong',mtInformation,[mbok],0)
   else
   if Edit3.Text ='' then
    MessageDlg('Nama Barang Kosong',mtInformation,[mbok],0)
   else
   if ComboBox1.Text ='-- PILIH SATUAN --' then
    MessageDlg('Silahkan Pilih Satuan',mtInformation,[mbok],0)
   else
   if Edit4.Text ='' then
    MessageDlg('Stok Kosong',mtInformation,[mbok],0)
   else
   if Edit5.Text ='' then
    MessageDlg('Harga Beli Kosong',mtInformation,[mbok],0)
   else
   if Edit6.Text ='' then
    MessageDlg('Harga Jual Kosong',mtInformation,[mbok],0)
   else
    begin
      Dm.ADOQBarang.Edit;
      dataInput;
      DM.ADOQBarang.Post;
      bersih;
    end;
end;

procedure TFBarang.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
       if DM.ADOQBarang.IsEmpty then
        MessageDlg('Data Kosong',mtInformation,[mbok],0)
       else
       begin
          Edit2.Text := Dm.ADOQBarang['kodeBarang']  ;
          Edit3.Text := Dm.ADOQBarang['namaBarang']  ;
          ComboBox1.Text := Dm.ADOQBarang['satuan']  ;
          Edit4.Text := DM.ADOQBarang['stok'] ;
          Edit5.Text := Dm.ADOQBarang['hargaBeli'] ;
          edit6.Text := Dm.ADOQBarang['hargaJual'] ;
       end;
  end;
end;

procedure TFBarang.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFBarang.Panel9Click(Sender: TObject);
begin
  if Edit7.Text = '' then
     MessageDlg('Data Kode Pada Tambah Stok Barang Kosong',mtInformation,[mbok],0)
  else
  if Edit10.Text = '' then
     MessageDlg('Data Tambah Stok Kosong',mtInformation,[mbok],0)
  else
  if Application.MessageBox('Yakin Ingin Tambah Data Stok Barang ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
     begin
        DM.ADOQBarang.Edit;
        DM.ADOQBarang['stok'] := Edit11.Text;
        DM.ADOQBarang.Post;
        Edit7.Clear; Edit8.Clear; Edit9.Text := '0';
        Edit10.Text := '0'; Edit11.Clear;
        DM.ADOQBarang.Close;
        DM.ADOQBarang.Open;
        Edit2.SetFocus;
     end;
end;

procedure TFBarang.Panel7Click(Sender: TObject);
begin
//
Edit7.Text := Dm.ADOQBarang['kodeBarang']  ;
Edit8.Text := Dm.ADOQBarang['namaBarang']  ;
Edit9.Text := DM.ADOQBarang['stok'] ;
end;

procedure TFBarang.Edit10Change(Sender: TObject);
begin
if Edit10.Text <> '' then
  begin
    Edit11.Text := FloatToStr(StrToFloat(Edit9.Text) + StrToFloat(Edit10.Text));
  end;
end;

end.
