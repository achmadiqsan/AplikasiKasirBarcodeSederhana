unit UCariBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids;

type
  TFCariBarang = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Panel2: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBGrid1: TDBGrid;
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure tampildata;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCariBarang: TFCariBarang;

implementation

uses
  UDataModule, UPreviewBarang;

{$R *.dfm}

procedure TFCariBarang.Edit1Change(Sender: TObject);
begin
if RadioButton1.Checked then
   begin
     if Edit1.Text = '' then
       begin
        Dm.ADOQBarang.Filtered := False;
       end
     else
       begin
         Dm.ADOQBarang.Filtered := False;
         Dm.ADOQBarang.Filter :='kodeBarang LIKE '+Quotedstr('%'+Edit1.Text+'%');
         Dm.ADOQBarang.Filtered := True;
       end;
   end
else
if RadioButton2.Checked then
   begin
     if Edit1.Text = '' then
       begin
        Dm.ADOQBarang.Filtered := False;
       end
     else
       begin
         Dm.ADOQBarang.Filtered := False;
         Dm.ADOQBarang.Filter :='namaBarang LIKE '+Quotedstr('%'+Edit1.Text+'%');
         Dm.ADOQBarang.Filtered := True;
       end;
   end;
end;

procedure TFCariBarang.FormActivate(Sender: TObject);
begin
  Dm.ADOQBarang.Filtered := False;
  Edit1.Clear;
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  DM.ADOQBarang.Close;
  DM.ADOQBarang.Open;
end;

procedure TFCariBarang.Panel2Click(Sender: TObject);
begin
//
tampildata;
end;

procedure TFCariBarang.tampildata;
begin
  FPreviewBarang.Edit7.Text := Dm.ADOQBarang['kodeBarang']  ;
  FPreviewBarang.Edit8.Text := Dm.ADOQBarang['namaBarang']  ;
  FPreviewBarang.Edit10.Text := Dm.ADOQBarang['satuan']  ;
  FPreviewBarang.Edit11.Text:= Dm.ADOQBarang['hargaJual'] ;
  FPreviewBarang.Edit1.Text := DM.ADOQBarang['stok'] ;
  FPreviewBarang.Show;
  FCariBarang.Close;
end;

procedure TFCariBarang.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    tampildata;
  end;
end;

end.
