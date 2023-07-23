object DM: TDM
  OldCreateOrder = False
  Left = 296
  Top = 219
  Height = 282
  Width = 796
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\AplikasiKasirBar' +
      'codeSederhana\database\DatabaseAplikasiKasirBarcodeSederhana.mdb' +
      ';Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 16
  end
  object ADOQLogin: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM login')
    Left = 24
    Top = 72
  end
  object DSLogin: TDataSource
    DataSet = ADOQLogin
    Left = 88
    Top = 64
  end
  object ADOQTempPeriode: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tempPeriode')
    Left = 56
    Top = 128
  end
  object ADOQPeriode: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM periode')
    Left = 128
    Top = 16
  end
  object DSPeriode: TDataSource
    DataSet = ADOQPeriode
    Left = 192
    Top = 8
  end
  object DSSatuan: TDataSource
    DataSet = ADOQSatuan
    Left = 216
    Top = 64
  end
  object ADOQSatuan: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM satuan')
    Left = 152
    Top = 72
  end
  object ADOQBarang: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dataBarang')
    Left = 152
    Top = 136
    object ADOQBarangkodeBarang: TWideStringField
      FieldName = 'kodeBarang'
      Size = 255
    end
    object ADOQBarangnamaBarang: TWideStringField
      FieldName = 'namaBarang'
      Size = 255
    end
    object ADOQBarangsatuan: TWideStringField
      FieldName = 'satuan'
      Size = 255
    end
    object ADOQBarangstok: TIntegerField
      FieldName = 'stok'
    end
    object ADOQBaranghargaBeli: TBCDField
      FieldName = 'hargaBeli'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOQBaranghargaJual: TBCDField
      FieldName = 'hargaJual'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
  end
  object DSBarang: TDataSource
    DataSet = ADOQBarang
    Left = 216
    Top = 128
  end
  object DSTempDetilTransakasi: TDataSource
    DataSet = ADOQTempDetilTransakasi
    Left = 336
    Top = 16
  end
  object ADOQTempDetilTransakasi: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tempDetailTransaksi')
    Left = 312
    Top = 96
    object ADOQTempDetilTransakasikodeTransaksi: TWideStringField
      FieldName = 'kodeTransaksi'
      Size = 255
    end
    object ADOQTempDetilTransakasitgl: TDateTimeField
      FieldName = 'tgl'
    end
    object ADOQTempDetilTransakasikodeBarang: TWideStringField
      FieldName = 'kodeBarang'
      Size = 255
    end
    object ADOQTempDetilTransakasinamaBarang: TWideStringField
      FieldName = 'namaBarang'
      Size = 255
    end
    object ADOQTempDetilTransakasisatuan: TWideStringField
      FieldName = 'satuan'
      Size = 255
    end
    object ADOQTempDetilTransakasihargaSatuan: TBCDField
      FieldName = 'hargaSatuan'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOQTempDetilTransakasistok: TIntegerField
      FieldName = 'stok'
    end
    object ADOQTempDetilTransakasiqty: TIntegerField
      FieldName = 'qty'
    end
    object ADOQTempDetilTransakasidiskon: TIntegerField
      FieldName = 'diskon'
    end
    object ADOQTempDetilTransakasidiskonRupiah: TBCDField
      FieldName = 'diskonRupiah'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOQTempDetilTransakasitotalHarga: TBCDField
      FieldName = 'totalHarga'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOQTempDetilTransakasibulan: TWideStringField
      FieldName = 'bulan'
      Size = 255
    end
    object ADOQTempDetilTransakasitahun: TWideStringField
      FieldName = 'tahun'
      Size = 255
    end
  end
  object ADOQKode: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM headerTransaksi')
    Left = 400
    Top = 80
  end
  object DSheaderTransaksi: TDataSource
    DataSet = ADOQheaderTransaksi
    Left = 384
    Top = 144
  end
  object ADOQheaderTransaksi: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM headerTransaksi')
    Left = 296
    Top = 168
  end
  object DSdetailTransaksi: TDataSource
    DataSet = ADOQdetailTransaksi
    Left = 536
    Top = 104
  end
  object ADOQdetailTransaksi: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM detailTransaksi')
    Left = 472
    Top = 120
    object ADOQdetailTransaksikodeTransaksi: TWideStringField
      FieldName = 'kodeTransaksi'
      Size = 255
    end
    object ADOQdetailTransaksitgl: TDateTimeField
      FieldName = 'tgl'
    end
    object ADOQdetailTransaksikodeBarang: TWideStringField
      FieldName = 'kodeBarang'
      Size = 255
    end
    object ADOQdetailTransaksinamaBarang: TWideStringField
      FieldName = 'namaBarang'
      Size = 255
    end
    object ADOQdetailTransaksisatuan: TWideStringField
      FieldName = 'satuan'
      Size = 255
    end
    object ADOQdetailTransaksihargaSatuan: TBCDField
      FieldName = 'hargaSatuan'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOQdetailTransaksistok: TIntegerField
      FieldName = 'stok'
    end
    object ADOQdetailTransaksiqty: TIntegerField
      FieldName = 'qty'
    end
    object ADOQdetailTransaksidiskon: TIntegerField
      FieldName = 'diskon'
    end
    object ADOQdetailTransaksidiskonRupiah: TBCDField
      FieldName = 'diskonRupiah'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOQdetailTransaksitotalHarga: TBCDField
      FieldName = 'totalHarga'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOQdetailTransaksibulan: TWideStringField
      FieldName = 'bulan'
      Size = 255
    end
    object ADOQdetailTransaksitahun: TWideStringField
      FieldName = 'tahun'
      Size = 255
    end
  end
  object TotalJual: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM detailTransaksi')
    Left = 440
    Top = 24
  end
  object Bulan: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dataBulan')
    Left = 496
    Top = 24
  end
  object dataGrafik1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM detailTransaksi')
    Left = 568
    Top = 24
  end
  object dataGrafik2: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM detailTransaksi')
    Left = 600
    Top = 88
  end
  object Ahad: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dataMingguan')
    Left = 496
    Top = 176
    object Ahadid: TIntegerField
      FieldName = 'id'
    end
    object AhadtglName: TWideStringField
      FieldName = 'tglName'
      Size = 255
    end
    object Ahadtgl: TDateTimeField
      FieldName = 'tgl'
    end
    object AhadjmlhBarang: TIntegerField
      FieldName = 'jmlhBarang'
    end
    object AhadjmlhUang: TBCDField
      FieldName = 'jmlhUang'
      Precision = 19
    end
  end
  object SUMBarang: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM detailTransaksi')
    Left = 664
    Top = 32
  end
  object SUMUang: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM detailTransaksi')
    Left = 672
    Top = 88
  end
end
