inherited PlanManageClientDlg: TPlanManageClientDlg
  Left = 179
  Top = 61
  Width = 1043
  Caption = #39033#30446#35745#21010
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object spl1: TSplitter
    Left = 185
    Top = 73
    Width = 10
    Height = 533
    Beveled = True
  end
  object pnlonvisible: TPanel
    Left = 0
    Top = 0
    Width = 1035
    Height = 73
    Align = alTop
    Caption = 'pnlonvisible'
    TabOrder = 0
    Visible = False
  end
  object pnl1: TPanel
    Left = 195
    Top = 73
    Width = 840
    Height = 533
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'pnl1'
    TabOrder = 1
    object pgcplan: TPageControl
      Left = 1
      Top = 1
      Width = 838
      Height = 531
      ActivePage = tsPlanItem
      Align = alClient
      TabOrder = 0
      OnChange = pgcplanChange
      OnChanging = pgcplanChanging
      object tsPlanItem: TTabSheet
        Caption = #39033#30446#20219#21153
        ImageIndex = 1
        object dbtxtZNAME: TDBText
          Left = 0
          Top = 40
          Width = 830
          Height = 17
          Align = alTop
          Color = clNavy
          DataField = 'ZNAME'
          DataSource = dsPlan
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object pnlPlanItemTop: TPanel
          Left = 0
          Top = 0
          Width = 830
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            830
            40)
          object btnItem_Add: TBitBtn
            Left = 8
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Add
            Caption = #21019#24314#20219#21153
            TabOrder = 0
          end
          object btnItem_Success: TBitBtn
            Left = 112
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Success
            Caption = #23436#25104#20219#21153
            TabOrder = 1
          end
          object btnItem_Close: TBitBtn
            Left = 216
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Close
            Caption = #20851#38381#20219#21153
            TabOrder = 2
          end
          object btnItem_Action: TBitBtn
            Left = 320
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Action
            Caption = #28608#27963#20219#21153
            TabOrder = 3
          end
          object dbedtZSORT: TDBEdit
            Left = 753
            Top = 8
            Width = 72
            Height = 23
            Anchors = [akTop, akRight]
            DataField = 'ZSORT'
            DataSource = dsPlanItem
            TabOrder = 4
          end
        end
        object dbgrdPlanItem: TDBGrid
          Left = 0
          Top = 57
          Width = 830
          Height = 444
          Align = alClient
          DataSource = dsPlanItem
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dbgrdPlanItemDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'ZNAME'
              Title.Alignment = taCenter
              Title.Caption = #20219#21153#21517#31216
              Width = 323
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ZSUCCESSRATE'
              Title.Alignment = taCenter
              Title.Caption = #23436#25104#27604#20363'(%)'
              Width = 95
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ZSTATUSNAME'
              Title.Alignment = taCenter
              Title.Caption = #29366#24577
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZFBDATE'
              Title.Alignment = taCenter
              Title.Caption = #23454#38469#24320#22987#26085#26399
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZFEDATE'
              Title.Alignment = taCenter
              Title.Caption = #23454#38469#32467#26463#26085#26399
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZMAINDEVENAME'
              Title.Alignment = taCenter
              Title.Caption = #20027#35201#36127#36131#20154
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZREMARK'
              Title.Alignment = taCenter
              Title.Caption = #22791#27880
              Width = 155
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZSORT'
              Title.Alignment = taCenter
              Title.Caption = #25490#24207#21495
              Width = 60
              Visible = True
            end>
        end
      end
      object tsPlanDetial: TTabSheet
        Caption = #20219#21153#20869#23481
        ImageIndex = 2
        object dbtxtZNAME1: TDBText
          Left = 0
          Top = 0
          Width = 830
          Height = 17
          Align = alTop
          Color = clNavy
          DataField = 'ZNAME'
          DataSource = dsPlanItem
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object spl2: TSplitter
          Left = 0
          Top = 176
          Width = 830
          Height = 10
          Cursor = crVSplit
          Align = alTop
          Beveled = True
        end
        object scrlbx1: TScrollBox
          Left = 0
          Top = 17
          Width = 830
          Height = 159
          Align = alTop
          TabOrder = 0
          object lbl8: TLabel
            Left = 8
            Top = 9
            Width = 75
            Height = 15
            Caption = #20219#21153#21517#31216#65306
          end
          object lbl9: TLabel
            Left = 8
            Top = 40
            Width = 98
            Height = 15
            Caption = #35745#21010#24320#22987#26085#26399':'
          end
          object lbl10: TLabel
            Left = 340
            Top = 40
            Width = 98
            Height = 15
            Caption = #35745#21010#32467#26463#26085#26399':'
          end
          object lbl11: TLabel
            Left = 8
            Top = 72
            Width = 105
            Height = 15
            Caption = #23454#38469#24320#22987#26085#26399#65306
          end
          object lbl12: TLabel
            Left = 340
            Top = 66
            Width = 105
            Height = 15
            Caption = #23454#38469#32467#26463#26085#26399#65306
          end
          object lbl13: TLabel
            Left = 8
            Top = 98
            Width = 90
            Height = 15
            Caption = #20027#35201#36127#36131#20154#65306
          end
          object lbl14: TLabel
            Left = 10
            Top = 125
            Width = 45
            Height = 15
            Caption = #22791#27880#65306
          end
          object lbl15: TLabel
            Left = 340
            Top = 96
            Width = 75
            Height = 15
            Caption = #23436#25104#27604#20363#65306
          end
          object dbedtZNAME1: TDBEdit
            Left = 109
            Top = 4
            Width = 518
            Height = 23
            DataField = 'ZNAME'
            DataSource = dsPlanItem
            TabOrder = 0
          end
          object dblkcbbZMAINDEVENAME: TDBLookupComboBox
            Left = 109
            Top = 93
            Width = 180
            Height = 23
            DataField = 'ZMAINDEVENAME'
            DataSource = dsPlanItem
            DropDownRows = 30
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = DM.dsUsers
            TabOrder = 1
          end
          object dbedtZFBDATE: TDBEdit
            Left = 109
            Top = 35
            Width = 180
            Height = 23
            DataField = 'ZPBDATE'
            DataSource = dsPlanItem
            TabOrder = 2
          end
          object dbedtZFBDATE1: TDBEdit
            Left = 109
            Top = 63
            Width = 180
            Height = 23
            DataField = 'ZFBDATE'
            DataSource = dsPlanItem
            TabOrder = 3
          end
          object dbedtZFEDATE: TDBEdit
            Left = 448
            Top = 35
            Width = 180
            Height = 23
            DataField = 'ZPEDATE'
            DataSource = dsPlanItem
            TabOrder = 4
          end
          object dbedtZFBDATE2: TDBEdit
            Left = 448
            Top = 63
            Width = 180
            Height = 23
            Color = clBtnFace
            DataField = 'ZFEDATE'
            DataSource = dsPlanItem
            ReadOnly = True
            TabOrder = 5
          end
          object dbedtZREMARK: TDBEdit
            Left = 108
            Top = 121
            Width = 521
            Height = 23
            DataField = 'ZREMARK'
            DataSource = dsPlanItem
            TabOrder = 6
          end
          object dbedtZSUCCESSRATE: TDBEdit
            Left = 448
            Top = 93
            Width = 180
            Height = 23
            Color = clBtnFace
            DataField = 'ZSUCCESSRATE'
            DataSource = dsPlanItem
            TabOrder = 7
          end
          object btnItem_Save: TBitBtn
            Left = 648
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Save
            Caption = #20445#23384
            TabOrder = 8
          end
          object btnItem_Cancel: TBitBtn
            Left = 648
            Top = 37
            Width = 100
            Height = 25
            Action = actItem_Cancel
            Caption = #21462#28040
            TabOrder = 9
          end
          object btnItem_Piro: TBitBtn
            Left = 648
            Top = 66
            Width = 100
            Height = 25
            Action = actItem_Piro
            Caption = #19978#19968#20010
            TabOrder = 10
          end
          object btnItem_Next: TBitBtn
            Left = 648
            Top = 95
            Width = 100
            Height = 25
            Action = actItem_Next
            Caption = #19979#19968#20010
            TabOrder = 11
          end
        end
        object pnlPlanDetail: TPanel
          Left = 0
          Top = 186
          Width = 830
          Height = 315
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlPlanDetail'
          TabOrder = 1
          object spl3: TSplitter
            Left = 247
            Top = 40
            Width = 10
            Height = 275
            Beveled = True
          end
          object pnlPlanDetailTop: TPanel
            Left = 0
            Top = 0
            Width = 830
            Height = 40
            Align = alTop
            BevelOuter = bvLowered
            Color = clNavy
            TabOrder = 0
            object lbl17: TLabel
              Left = 8
              Top = 13
              Width = 60
              Height = 15
              Caption = #23376#20219#21153#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object btnDetail_Add: TBitBtn
              Left = 65
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Add
              Caption = #22686#21152#23376#20219#21153
              TabOrder = 0
            end
            object btnDetail_SUCCESS: TBitBtn
              Left = 273
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_SUCCESS
              Caption = #23436#25104
              TabOrder = 1
            end
            object btnDetail_Colse: TBitBtn
              Left = 377
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Colse
              Caption = #20851#38381
              TabOrder = 2
            end
            object btnDetail_Action: TBitBtn
              Left = 481
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Action
              Caption = #28608#27963
              TabOrder = 3
            end
            object btnDetail_Save: TBitBtn
              Left = 169
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Save
              Caption = #20445#23384#20869#23481
              TabOrder = 4
            end
          end
          object dbgrdDetail: TDBGrid
            Left = 0
            Top = 40
            Width = 247
            Height = 275
            Align = alLeft
            DataSource = dsPlanDetail
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -15
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdDetailDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'ZID'
                Title.Alignment = taCenter
                Title.Caption = #32534#21495
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZNAME'
                Title.Alignment = taCenter
                Title.Caption = #21517#31216
                Width = 202
                Visible = True
              end>
          end
          object pnl3: TPanel
            Left = 257
            Top = 40
            Width = 573
            Height = 275
            Align = alClient
            BevelOuter = bvNone
            Caption = 'pnl3'
            TabOrder = 2
            object dbmmoZCONTENT: TDBMemo
              Left = 0
              Top = 70
              Width = 573
              Height = 205
              Align = alClient
              DataField = 'ZCONTENT'
              DataSource = dsPlanDetail
              ScrollBars = ssBoth
              TabOrder = 0
            end
            object pnl5: TPanel
              Left = 0
              Top = 0
              Width = 573
              Height = 70
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                573
                70)
              object lbl18: TLabel
                Left = 8
                Top = 46
                Width = 60
                Height = 15
                Caption = #36127#36131#20154#65306
              end
              object lbl16: TLabel
                Left = 8
                Top = 14
                Width = 45
                Height = 15
                Caption = #21517#31216#65306
              end
              object lbl20: TLabel
                Left = 253
                Top = 44
                Width = 45
                Height = 15
                Caption = #24471#20998#65306
              end
              object lbl19: TLabel
                Left = 483
                Top = 43
                Width = 45
                Height = 15
                Caption = #29366#24577#65306
              end
              object dbtxtZSTATUSNAME1: TDBText
                Left = 529
                Top = 41
                Width = 32
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Color = clGray
                DataField = 'ZSTATUSNAME'
                DataSource = dsPlanDetail
                Font.Charset = GB2312_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = #23435#20307
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object dblkcbbZSTATUSNAME: TDBLookupComboBox
                Left = 64
                Top = 41
                Width = 180
                Height = 23
                DataField = 'ZDEVENAME'
                DataSource = dsPlanDetail
                TabOrder = 0
              end
              object dbedtZNAME2: TDBEdit
                Left = 64
                Top = 10
                Width = 498
                Height = 23
                Anchors = [akLeft, akTop, akRight]
                DataField = 'ZNAME'
                DataSource = dsPlanDetail
                TabOrder = 1
              end
              object dbedtZSOCRE: TDBEdit
                Left = 294
                Top = 39
                Width = 180
                Height = 23
                Color = clBtnFace
                DataField = 'ZSOCRE'
                DataSource = dsPlanDetail
                ReadOnly = True
                TabOrder = 2
              end
            end
          end
        end
      end
      object tsPlan: TTabSheet
        Caption = #39033#30446#20449#24687
        object pnlPlanBottom: TPanel
          Left = 0
          Top = 461
          Width = 830
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          Color = clNavy
          TabOrder = 0
          object btnPan_Add: TBitBtn
            Left = 10
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_Add
            Caption = #22686#21152#39033#30446
            TabOrder = 0
          end
          object btnPan_success: TBitBtn
            Left = 218
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_success
            Caption = #23436#25104#39033#30446
            TabOrder = 1
          end
          object btnPan_CLOSE: TBitBtn
            Left = 322
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_CLOSE
            Caption = #20851#38381#39033#30446
            TabOrder = 2
          end
          object btnPan_Save: TBitBtn
            Left = 114
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_Save
            Caption = #20445#23384#39033#30446
            TabOrder = 3
          end
          object btnPan_Action: TBitBtn
            Left = 426
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_Action
            Caption = #28608#27963
            TabOrder = 4
          end
        end
        object pnl4: TPanel
          Left = 0
          Top = 0
          Width = 830
          Height = 461
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            830
            461)
          object dbtxtZID: TDBText
            Left = 88
            Top = 8
            Width = 180
            Height = 17
            Color = clGray
            DataField = 'ZAUTOID'
            DataSource = dsPlan
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbl7: TLabel
            Left = 14
            Top = 10
            Width = 68
            Height = 15
            Caption = #39033#30446#32534#21495':'
          end
          object lbl1: TLabel
            Left = 12
            Top = 39
            Width = 68
            Height = 15
            Caption = #39033#30446#21517#31216':'
          end
          object lbl6: TLabel
            Left = 14
            Top = 69
            Width = 75
            Height = 15
            Caption = #31435#39033#39033#30446#65306
          end
          object lbl3: TLabel
            Left = 305
            Top = 71
            Width = 105
            Height = 15
            Caption = #39033#30446#21019#24314#26102#38388#65306
          end
          object dbtxtZBUILDDATE: TDBText
            Left = 426
            Top = 69
            Width = 180
            Height = 17
            Color = clGray
            DataField = 'ZBUILDDATE'
            DataSource = dsPlan
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object dbtxtZSTATUSNAME: TDBText
            Left = 427
            Top = 100
            Width = 180
            Height = 17
            Color = clGray
            DataField = 'ZSTATUSNAME'
            DataSource = dsPlan
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbl2: TLabel
            Left = 305
            Top = 103
            Width = 68
            Height = 15
            Caption = #39033#30446#29366#24577':'
          end
          object lbl4: TLabel
            Left = 14
            Top = 105
            Width = 68
            Height = 15
            Caption = #39033#30446#32463#29702':'
          end
          object lbl5: TLabel
            Left = 14
            Top = 137
            Width = 98
            Height = 15
            Caption = #39033#30446#23436#25104#24635#32467':'
          end
          object dbedtZNAME: TDBEdit
            Left = 87
            Top = 34
            Width = 520
            Height = 23
            DataField = 'ZNAME'
            DataSource = dsPlan
            TabOrder = 0
          end
          object dbedtZPRO_ID: TDBEdit
            Left = 87
            Top = 64
            Width = 180
            Height = 23
            DataField = 'ZPRO_ID'
            DataSource = dsPlan
            TabOrder = 1
          end
          object dblkcbbZPMNAME: TDBLookupComboBox
            Left = 87
            Top = 100
            Width = 180
            Height = 23
            DataField = 'ZPMNAME'
            DataSource = dsPlan
            DropDownRows = 30
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = DM.dsUsers
            TabOrder = 2
          end
          object dbmmoZSUMTEXT: TDBMemo
            Left = 14
            Top = 157
            Width = 785
            Height = 288
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'ZSUMTEXT'
            DataSource = dsPlan
            ScrollBars = ssBoth
            TabOrder = 3
          end
          object lstPlanGUID: TListBox
            Left = 680
            Top = 24
            Width = 121
            Height = 89
            ItemHeight = 15
            TabOrder = 4
            Visible = False
          end
        end
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 73
    Width = 185
    Height = 533
    Align = alLeft
    BevelOuter = bvLowered
    Caption = 'pnl2'
    TabOrder = 2
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 183
      Height = 531
      ActivePage = ts1
      Align = alClient
      TabOrder = 0
      object ts1: TTabSheet
        Caption = #39033#30446#21015#34920
        object tvPlan: TTreeView
          Left = 0
          Top = 0
          Width = 175
          Height = 461
          Align = alClient
          HideSelection = False
          Images = DM.ImageListTree
          Indent = 19
          ReadOnly = True
          RowSelect = True
          ShowLines = False
          ShowRoot = False
          TabOrder = 0
          ToolTips = False
          OnChange = tvPlanChange
          OnChanging = tvPlanChanging
        end
        object pnlpageIndex: TPanel
          Left = 0
          Top = 461
          Width = 175
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object btnPan_FirstPage: TSpeedButton
            Left = 5
            Top = 8
            Width = 23
            Height = 22
            Action = actPan_FirstPage
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
              FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
          object btnPan_Propage: TSpeedButton
            Left = 32
            Top = 8
            Width = 23
            Height = 22
            Action = actPan_Propage
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000000000000000000000000000000000000FF00000000000000
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000000000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
          object btnPan_NextPage: TSpeedButton
            Left = 59
            Top = 8
            Width = 23
            Height = 22
            Action = actPan_NextPage
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000000000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000000000000000000000000000000000000FF00000000000000
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
          object btnPan_LastPage: TSpeedButton
            Left = 86
            Top = 8
            Width = 23
            Height = 22
            Action = actPan_LastPage
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
              FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF000000FF000000000000000000FF00FF00FF00FF00000000000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF000000FF000000FF000000FF000000000000000000000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF000000FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
              FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
          object lblPlanPage: TLabel
            Left = 114
            Top = 11
            Width = 88
            Height = 15
            Caption = 'lblPlanPage'
          end
        end
      end
    end
  end
  object cdsPlan: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsPlanBeforePost
    AfterScroll = cdsPlanAfterScroll
    OnNewRecord = cdsPlanNewRecord
    Left = 24
    Top = 8
  end
  object dsPlan: TDataSource
    DataSet = cdsPlan
    Left = 24
    Top = 40
  end
  object actlst1: TActionList
    Images = il1
    Left = 64
    Top = 8
    object actPan_Add: TAction
      Category = #39033#30446
      Caption = #22686#21152#39033#30446
      OnExecute = actPan_AddExecute
      OnUpdate = actPan_AddUpdate
    end
    object actPan_success: TAction
      Category = #39033#30446
      Caption = #23436#25104#39033#30446
      OnExecute = actPan_successExecute
      OnUpdate = actPan_successUpdate
    end
    object actPan_CLOSE: TAction
      Category = #39033#30446
      Caption = #20851#38381#39033#30446
      OnExecute = actPan_CLOSEExecute
      OnUpdate = actPan_CLOSEUpdate
    end
    object actPan_Save: TAction
      Category = #39033#30446
      Caption = #20445#23384#39033#30446
      OnExecute = actPan_SaveExecute
      OnUpdate = actPan_SaveUpdate
    end
    object actPan_FirstPage: TAction
      Category = #39033#30446
      Hint = #31532#19968#39029
      ImageIndex = 0
      OnExecute = actPan_FirstPageExecute
      OnUpdate = actPan_FirstPageUpdate
    end
    object actPan_Propage: TAction
      Category = #39033#30446
      Hint = #19978#19968#39029
      ImageIndex = 3
      OnExecute = actPan_PropageExecute
      OnUpdate = actPan_PropageUpdate
    end
    object actPan_NextPage: TAction
      Category = #39033#30446
      Hint = #19979#19968#39029
      ImageIndex = 2
      OnExecute = actPan_NextPageExecute
      OnUpdate = actPan_NextPageUpdate
    end
    object actPan_LastPage: TAction
      Category = #39033#30446
      Hint = #26368#21518#19968#39029
      ImageIndex = 1
      OnExecute = actPan_LastPageExecute
      OnUpdate = actPan_LastPageUpdate
    end
    object actItem_Add: TAction
      Category = #39033#30446#20219#21153
      Caption = #21019#24314#20219#21153
      OnExecute = actItem_AddExecute
      OnUpdate = actItem_AddUpdate
    end
    object actItem_Success: TAction
      Category = #39033#30446#20219#21153
      Caption = #23436#25104#20219#21153
      OnExecute = actItem_SuccessExecute
      OnUpdate = actItem_SuccessUpdate
    end
    object actItem_Close: TAction
      Category = #39033#30446#20219#21153
      Caption = #20851#38381#20219#21153
      OnExecute = actItem_CloseExecute
      OnUpdate = actItem_CloseUpdate
    end
    object actItem_Save: TAction
      Category = #39033#30446#20219#21153
      Caption = #20445#23384
      OnExecute = actItem_SaveExecute
      OnUpdate = actItem_SaveUpdate
    end
    object actItem_Cancel: TAction
      Category = #39033#30446#20219#21153
      Caption = #21462#28040
      OnExecute = actItem_CancelExecute
      OnUpdate = actItem_CancelUpdate
    end
    object actItem_Piro: TAction
      Category = #39033#30446#20219#21153
      Caption = #19978#19968#20010
      OnExecute = actItem_PiroExecute
      OnUpdate = actItem_PiroUpdate
    end
    object actItem_Next: TAction
      Category = #39033#30446#20219#21153
      Caption = #19979#19968#20010
      OnExecute = actItem_NextExecute
      OnUpdate = actItem_NextUpdate
    end
    object actItem_Action: TAction
      Category = #39033#30446#20219#21153
      Caption = #28608#27963#20219#21153
      OnExecute = actItem_ActionExecute
      OnUpdate = actItem_ActionUpdate
    end
    object actDetail_Add: TAction
      Category = #23376#20219#21153
      Caption = #22686#21152#23376#20219#21153
      OnExecute = actDetail_AddExecute
      OnUpdate = actDetail_AddUpdate
    end
    object actDetail_SUCCESS: TAction
      Category = #23376#20219#21153
      Caption = #23436#25104
      OnExecute = actDetail_SUCCESSExecute
      OnUpdate = actDetail_SUCCESSUpdate
    end
    object actDetail_Colse: TAction
      Category = #23376#20219#21153
      Caption = #20851#38381
      OnExecute = actDetail_ColseExecute
      OnUpdate = actDetail_ColseUpdate
    end
    object actDetail_Action: TAction
      Category = #23376#20219#21153
      Caption = #28608#27963
      OnExecute = actDetail_ActionExecute
      OnUpdate = actDetail_ActionUpdate
    end
    object actDetail_Save: TAction
      Category = #23376#20219#21153
      Caption = #20445#23384#20869#23481
      OnExecute = actDetail_SaveExecute
      OnUpdate = actDetail_SaveUpdate
    end
    object actPan_Action: TAction
      Category = #39033#30446
      Caption = #28608#27963
      OnExecute = actPan_ActionExecute
      OnUpdate = actPan_ActionUpdate
    end
  end
  object cdsPlanStauts: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 8
  end
  object cdsPlanItem: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsPlanItemBeforePost
    OnCalcFields = cdsPlanItemCalcFields
    OnNewRecord = cdsPlanItemNewRecord
    Left = 104
    Top = 8
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 8
  end
  object il1: TImageList
    Left = 408
    Top = 8
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFEFFFC7FFFFFFFFFFEFFFC7F
      FFFFFFFFFC7FFC7FFF3FFFFFFC7FFC7FFC3FFCFFF83FFC7FF03FFC3FF83FFC7F
      C000FC0FF01FE00F00000003F01FE00FC0000000E00FF01FF03F0003E00FF01F
      FC3FFC0FFC7FF83FFF3FFC3FFC7FF83FFFFFFCFFFC7FFC7FFFFFFFFFFC7FFC7F
      FFFFFFFFFC7FFEFFFFFFFFFFFC7FFEFF00000000000000000000000000000000
      000000000000}
  end
  object dsPlanItem: TDataSource
    DataSet = cdsPlanItem
    Left = 104
    Top = 42
  end
  object cdsPlanDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsPlanDetailBeforePost
    OnNewRecord = cdsPlanDetailNewRecord
    Left = 144
    Top = 8
  end
  object dsPlanDetail: TDataSource
    DataSet = cdsPlanDetail
    Left = 144
    Top = 40
  end
end