unit UDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQLogin: TADOQuery;
    DSLogin: TDataSource;
    ADOQTempPeriode: TADOQuery;
    ADOQPeriode: TADOQuery;
    DSPeriode: TDataSource;
    DSSatuan: TDataSource;
    ADOQSatuan: TADOQuery;
    ADOQBarang: TADOQuery;
    DSBarang: TDataSource;
    ADOQBarangkodeBarang: TWideStringField;
    ADOQBarangnamaBarang: TWideStringField;
    ADOQBarangsatuan: TWideStringField;
    ADOQBarangstok: TIntegerField;
    ADOQBaranghargaBeli: TBCDField;
    ADOQBaranghargaJual: TBCDField;
    DSTempDetilTransakasi: TDataSource;
    ADOQTempDetilTransakasi: TADOQuery;
    ADOQTempDetilTransakasikodeTransaksi: TWideStringField;
    ADOQTempDetilTransakasitgl: TDateTimeField;
    ADOQTempDetilTransakasikodeBarang: TWideStringField;
    ADOQTempDetilTransakasinamaBarang: TWideStringField;
    ADOQTempDetilTransakasisatuan: TWideStringField;
    ADOQTempDetilTransakasihargaSatuan: TBCDField;
    ADOQTempDetilTransakasistok: TIntegerField;
    ADOQTempDetilTransakasiqty: TIntegerField;
    ADOQTempDetilTransakasidiskon: TIntegerField;
    ADOQTempDetilTransakasidiskonRupiah: TBCDField;
    ADOQTempDetilTransakasitotalHarga: TBCDField;
    ADOQTempDetilTransakasibulan: TWideStringField;
    ADOQTempDetilTransakasitahun: TWideStringField;
    ADOQKode: TADOQuery;
    DSheaderTransaksi: TDataSource;
    ADOQheaderTransaksi: TADOQuery;
    DSdetailTransaksi: TDataSource;
    ADOQdetailTransaksi: TADOQuery;
    ADOQdetailTransaksikodeTransaksi: TWideStringField;
    ADOQdetailTransaksitgl: TDateTimeField;
    ADOQdetailTransaksikodeBarang: TWideStringField;
    ADOQdetailTransaksinamaBarang: TWideStringField;
    ADOQdetailTransaksisatuan: TWideStringField;
    ADOQdetailTransaksihargaSatuan: TBCDField;
    ADOQdetailTransaksistok: TIntegerField;
    ADOQdetailTransaksiqty: TIntegerField;
    ADOQdetailTransaksidiskon: TIntegerField;
    ADOQdetailTransaksidiskonRupiah: TBCDField;
    ADOQdetailTransaksitotalHarga: TBCDField;
    ADOQdetailTransaksibulan: TWideStringField;
    ADOQdetailTransaksitahun: TWideStringField;
    TotalJual: TADOQuery;
    Bulan: TADOQuery;
    dataGrafik1: TADOQuery;
    dataGrafik2: TADOQuery;
    Ahad: TADOQuery;
    Ahadid: TIntegerField;
    AhadtglName: TWideStringField;
    Ahadtgl: TDateTimeField;
    AhadjmlhBarang: TIntegerField;
    AhadjmlhUang: TBCDField;
    SUMBarang: TADOQuery;
    SUMUang: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  UCariBarang;

{$R *.dfm}

end.
