object FRekap: TFRekap
  Left = 236
  Top = 137
  Width = 779
  Height = 405
  BorderIcons = [biSystemMenu]
  Caption = 'REKAPITULASI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 366
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 294
      Width = 144
      Height = 18
      Caption = 'Total Barang Terjual :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 186
      Top = 294
      Width = 135
      Height = 18
      Caption = 'Nilai Barang Terjual :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 12
      Top = 1
      Width = 96
      Height = 18
      Caption = 'Tanggal Awal :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 212
      Top = 1
      Width = 98
      Height = 18
      Caption = 'Tanggal Akhir :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Panel2: TPanel
      Left = 1
      Top = 316
      Width = 176
      Height = 41
      BevelOuter = bvNone
      Caption = '0'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 186
      Top = 316
      Width = 185
      Height = 41
      BevelOuter = bvNone
      Caption = 'Rp. 000.000.000.000'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 64
      Width = 745
      Height = 224
      DataSource = DM.DSdetailTransaksi
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'kodeTransaksi'
          Title.Alignment = taCenter
          Title.Caption = 'KODE TRANSAKASI'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tgl'
          Title.Alignment = taCenter
          Title.Caption = 'TANGGAL'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kodeBarang'
          Title.Alignment = taCenter
          Title.Caption = 'KODE BARANG'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'namaBarang'
          Title.Alignment = taCenter
          Title.Caption = 'NAMA BARANG'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'satuan'
          Title.Alignment = taCenter
          Title.Caption = 'SATUAN'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hargaSatuan'
          Title.Alignment = taCenter
          Title.Caption = 'HARGA SATUAN'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'stok'
          Title.Alignment = taCenter
          Title.Caption = 'STOK'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qty'
          Title.Alignment = taCenter
          Title.Caption = 'Qty'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'diskon'
          Title.Alignment = taCenter
          Title.Caption = 'Diskon %'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'diskonRupiah'
          Title.Alignment = taCenter
          Title.Caption = 'Rupiah Diskon'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'totalHarga'
          Title.Alignment = taCenter
          Title.Caption = 'Total Harga'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object DateTimePicker1: TDateTimePicker
      Left = 8
      Top = 30
      Width = 186
      Height = 24
      Date = 45116.728132303240000000
      Format = 'dd-MMM-yyyy'
      Time = 45116.728132303240000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DateTimePicker2: TDateTimePicker
      Left = 208
      Top = 30
      Width = 186
      Height = 24
      Date = 45116.728132303240000000
      Format = 'dd-MMM-yyyy'
      Time = 45116.728132303240000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Panel4: TPanel
      Left = 489
      Top = 21
      Width = 122
      Height = 30
      Cursor = crHandPoint
      Caption = 'Get Data'
      Color = 9087796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Panel4Click
    end
    object Panel5: TPanel
      Left = 625
      Top = 21
      Width = 122
      Height = 30
      Cursor = crHandPoint
      Caption = 'Reset'
      Color = 9087796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Panel5Click
    end
  end
end
