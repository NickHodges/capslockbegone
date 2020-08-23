object WTFOForm: TWTFOForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'What the.....?'
  ClientHeight = 146
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblAreYouKidding: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 312
    Height = 52
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Caption = 
      'What the....?  Are you serious?  You seriously want to turn the ' +
      'CapsLock key back on?  You really want that dang thing turning i' +
      'tself on and mucking up your typing? Please tell me you are kidd' +
      'ing.'
    WordWrap = True
    ExplicitWidth = 307
  end
  object btnYes: TButton
    Left = 8
    Top = 69
    Width = 150
    Height = 69
    ModalResult = 1
    TabOrder = 0
    WordWrap = True
  end
  object btnNo: TButton
    Left = 170
    Top = 71
    Width = 150
    Height = 67
    ModalResult = 2
    TabOrder = 1
    WordWrap = True
  end
end
