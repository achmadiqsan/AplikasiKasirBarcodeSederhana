unit USatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFSatuan = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSatuan: TFSatuan;

implementation

uses
  UDataModule;

{$R *.dfm}

procedure TFSatuan.FormCreate(Sender: TObject);
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

procedure TFSatuan.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if DM.ADOQSatuan.IsEmpty then
     MessageDlg('Data Kosong',mtInformation,[mbok],0)
     else
     begin
       Edit1.Text:= DM.ADOQSatuan['satuan'];
     end;
  end;
end;

procedure TFSatuan.Edit2Change(Sender: TObject);
begin
  if Edit2.Text ='' then
     begin
       DM.ADOQSatuan.Close;
       DM.ADOQSatuan.Open;
       DM.ADOQSatuan.Filtered := false;
     end
  Else
     begin
       DM.ADOQSatuan.Close;
       DM.ADOQSatuan.Open;
       DM.ADOQSatuan.Filtered := False;
       DM.ADOQSatuan.Filter :='satuan LIKE '+Quotedstr('%'+Edit2.Text+'%');
       DM.ADOQSatuan.Filtered := True;
     end;
end;

procedure TFSatuan.Panel2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    MessageDlg('Periode Tidak Boleh Kosong',mtInformation,[mbok],0)
  else
  if DM.ADOQSatuan.Locate('satuan',Edit1.Text,[]) then
    MessageDlg('Periode Telah Ada',mtInformation,[mbok],0)
  else
    begin
      DM.ADOQSatuan.Append;
      DM.ADOQSatuan['satuan'] := Edit1.Text;
      DM.ADOQSatuan.Post;
      Edit1.Clear;
    end;
end;

procedure TFSatuan.Panel3Click(Sender: TObject);
begin
  if DM.ADOQSatuan.IsEmpty then
   MessageDlg('Data Kosong',mtInformation,[mbok],0)
  else
  if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
     begin
       DM.ADOQSatuan.Delete;
       Edit1.Clear;
     end;
end;

procedure TFSatuan.Panel4Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  DM.ADOQSatuan.Filtered := False;
end;

procedure TFSatuan.Panel5Click(Sender: TObject);
begin
    DM.ADOQSatuan.Filtered := False;
    close;
end;

procedure TFSatuan.FormActivate(Sender: TObject);
begin
DM.ADOQSatuan.Close;
DM.ADOQSatuan.Open;
end;

end.
