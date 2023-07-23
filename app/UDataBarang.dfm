object FBarang: TFBarang
  Left = 178
  Top = 75
  Width = 1109
  Height = 517
  BorderIcons = [biSystemMenu]
  Caption = 'DATA BARANG'
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
    Width = 1093
    Height = 478
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 26
      Width = 411
      Height = 46
      Caption = 'FORM DATA BARANG'
      Font.Charset = ANSI_CHARSET
      Font.Color = 9087796
      Font.Height = -40
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 110
      Width = 84
      Height = 18
      Caption = 'Kode Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 9
      Top = 158
      Width = 90
      Height = 18
      Caption = 'Nama Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 9
      Top = 214
      Width = 45
      Height = 18
      Caption = 'Satuan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 161
      Top = 213
      Width = 28
      Height = 18
      Caption = 'Stok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 9
      Top = 270
      Width = 65
      Height = 18
      Caption = 'Harga Beli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 9
      Top = 326
      Width = 68
      Height = 18
      Caption = 'Harga Jual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Panel6: TPanel
      Left = 2
      Top = 97
      Width = 1087
      Height = 5
      Color = 9087796
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 8
      Top = 131
      Width = 283
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 8
      Top = 179
      Width = 283
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 237
      Width = 145
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      Text = '-- PILIH SATUAN --'
    end
    object Edit4: TEdit
      Left = 160
      Top = 235
      Width = 137
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnChange = Edit4Change
      OnKeyPress = Edit4KeyPress
    end
    object Edit5: TEdit
      Left = 8
      Top = 291
      Width = 283
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnChange = Edit5Change
      OnKeyPress = Edit5KeyPress
    end
    object Edit6: TEdit
      Left = 8
      Top = 347
      Width = 283
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnChange = Edit6Change
      OnKeyPress = Edit6KeyPress
    end
    object DBGrid1: TDBGrid
      Left = 304
      Top = 133
      Width = 649
      Height = 233
      DataSource = DM.DSBarang
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'kodeBarang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2298640
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Kode Barang'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'namaBarang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2298640
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Nama Barang'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'satuan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2298640
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Satuan'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'stok'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2298640
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Stok'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hargaBeli'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2298640
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Harga Beli'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hargaJual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2298640
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Harga Jual'
          Title.Color = 2298640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 961
      Top = 138
      Width = 119
      Height = 27
      Cursor = crHandPoint
      Caption = 'Add'
      Color = 9087796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 961
      Top = 186
      Width = 119
      Height = 27
      Cursor = crHandPoint
      Caption = 'Delete'
      Color = 9087796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = Panel3Click
    end
    object Panel5: TPanel
      Left = 961
      Top = 234
      Width = 119
      Height = 27
      Cursor = crHandPoint
      Caption = 'Update'
      Color = 9087796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = Panel5Click
    end
    object Panel7: TPanel
      Left = 961
      Top = 282
      Width = 119
      Height = 27
      Cursor = crHandPoint
      Caption = 'Add Stock'
      Color = 9087796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = Panel7Click
    end
    object Panel8: TPanel
      Left = 961
      Top = 330
      Width = 119
      Height = 27
      Cursor = crHandPoint
      Caption = 'Reset'
      Color = 9087796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = Panel8Click
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 381
      Width = 1073
      Height = 89
      Caption = ' Tambah Stok '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      object Label8: TLabel
        Left = 9
        Top = 27
        Width = 84
        Height = 18
        Caption = 'Kode Barang'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 246
        Top = 24
        Width = 90
        Height = 18
        Caption = 'Nama Barang'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 479
        Top = 25
        Width = 28
        Height = 18
        Caption = 'Stok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label11: TLabel
        Left = 623
        Top = 25
        Width = 88
        Height = 18
        Caption = 'Tambah Stok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 767
        Top = 25
        Width = 66
        Height = 18
        Caption = 'Total Stok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Edit7: TEdit
        Left = 8
        Top = 48
        Width = 224
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Edit8: TEdit
        Left = 245
        Top = 48
        Width = 224
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object Edit9: TEdit
        Left = 478
        Top = 46
        Width = 137
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = '0'
      end
      object Panel9: TPanel
        Left = 946
        Top = 42
        Width = 119
        Height = 27
        Cursor = crHandPoint
        Caption = 'Add Stock'
        Color = 9087796
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = Panel9Click
      end
      object Edit10: TEdit
        Left = 622
        Top = 46
        Width = 137
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = Edit10Change
        OnKeyPress = Edit10KeyPress
      end
      object Edit11: TEdit
        Left = 766
        Top = 46
        Width = 137
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    object GroupBox2: TGroupBox
      Left = 536
      Top = 0
      Width = 553
      Height = 89
      Caption = ' Pencarian '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      object Edit1: TEdit
        Left = 16
        Top = 54
        Width = 393
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 427
        Top = 53
        Width = 118
        Height = 27
        Cursor = crHandPoint
        Caption = 'Search'
        Color = 9087796
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Panel4Click
      end
      object RadioButton1: TRadioButton
        Left = 80
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Kode Barang'
        TabOrder = 2
      end
      object RadioButton2: TRadioButton
        Left = 216
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Nama Barang'
        TabOrder = 3
      end
    end
  end
end
