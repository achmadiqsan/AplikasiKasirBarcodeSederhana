unit USettingUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFUser = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Edit1: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    procedure Panel5Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUser: TFUser;

implementation

uses
  UDataModule;

{$R *.dfm}

procedure TFUser.Panel5Click(Sender: TObject);
begin
  close;
end;

procedure TFUser.Panel4Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
end;

procedure TFUser.Panel3Click(Sender: TObject);
begin
  if DM.ADOQLogin.IsEmpty then
   MessageDlg('Data Kosong',mtInformation,[mbok],0)
  else
  if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
     begin
       DM.ADOQLogin.Delete;
       Edit1.Clear;
       Edit3.Clear;
     end;
end;

procedure TFUser.Panel2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    MessageDlg('Username Tidak Boleh Kosong',mtInformation,[mbok],0)
  else
  if Edit3.Text = '' then
    MessageDlg('Password Tidak Boleh Kosong',mtInformation,[mbok],0)
  else
  if DM.ADOQLogin.Locate('username',edit2.Text,[]) then
    MessageDlg('Username Telah Ada',mtInformation,[mbok],0)
  else
    begin
      DM.ADOQLogin.Append;
      DM.ADOQLogin['username'] := Edit1.Text;
      DM.ADOQLogin['password'] := Edit3.Text;
      DM.ADOQLogin.Post;
      Edit1.Clear;
      Edit3.Clear;
    end;
end;

procedure TFUser.Edit2Change(Sender: TObject);
begin
  if Edit2.Text ='' then
     begin
       DM.ADOQLogin.Close;
       DM.ADOQLogin.Open;
       DM.ADOQLogin.Filtered := false;
     end
  Else
     begin
       DM.ADOQLogin.Close;
       DM.ADOQLogin.Open;
       DM.ADOQLogin.Filtered := False;
       DM.ADOQLogin.Filter :='username LIKE '+Quotedstr('%'+Edit2.Text+'%');
       DM.ADOQLogin.Filtered := True;
     end;
end;

procedure TFUser.FormCreate(Sender: TObject);
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

end.
