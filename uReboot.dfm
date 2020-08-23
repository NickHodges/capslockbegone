object RebootForm: TRebootForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Do you want to reboot?'
  ClientHeight = 145
  ClientWidth = 311
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
  object lblMessage: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 291
    Height = 39
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Caption = 
      'Now that you'#39've changed things, you are going to  have to reboot' +
      ' your machine to make the changes effective.  Sorry about that, ' +
      'but that is just the way Windows works.  '
    WordWrap = True
    ExplicitWidth = 287
  end
  object btnReboot: TButton
    Left = 8
    Top = 69
    Width = 145
    Height = 68
    ModalResult = 1
    TabOrder = 0
    WordWrap = True
  end
  object btnNoReboot: TButton
    Left = 156
    Top = 70
    Width = 145
    Height = 67
    Caption = 'Thanks, but not now.  I'#39'll reboot when I feel like it.'
    ModalResult = 2
    TabOrder = 1
    WordWrap = True
  end
end
