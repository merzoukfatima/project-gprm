object dmDonnees: TdmDonnees
  Height = 1080
  Width = 1440
  PixelsPerInch = 144
  object coDB_GPRM: TFDConnection
    Params.Strings = (
      'Database=DBGPRM'
      'User_Name=ADMINTTM'
      'Password=TTM31DZ'
      'Server=DESKTOP-A03M1CJ'
      'Workstation=DESKTOP-A03M1CJ'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 40
  end
end
