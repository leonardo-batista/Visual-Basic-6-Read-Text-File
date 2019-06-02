Attribute VB_Name = "moduleVariables"
Option Explicit

'--------------------------------------------------
'COMPUTER NAME
'--------------------------------------------------
Public Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long

'--------------------------------------------------
'USER NAME
'--------------------------------------------------
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

'--------------------------------------------------
'API Function to read information from INI File
'--------------------------------------------------
Public Declare Function GetPrivateProfileString Lib "kernel32" _
    Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any _
    , ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long _
    , ByVal lpFileName As String) As Long
    
'--------------------------------------------------
'API Function to write information to the INI File
'--------------------------------------------------
Private Declare Function WritePrivateProfileString Lib "kernel32" _
    Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any _
    , ByVal lpString As Any, ByVal lpFileName As String) As Long
    
Global gFileIni As New cFileIni

'--------------------------------------------------
'Connection Database (ODBC)
'--------------------------------------------------
Global gConnectionDB As New ADODB.Connection
Global gRecordsetDB As New ADODB.Recordset

'--------------------------------------------------
'VARIABLES TO VALIDATION AND REPORT ABOUT FILE TXT
'--------------------------------------------------
Global gFileName As String
Global gFileHeader As String
Global gResultCustomers As New Collection
Global gLineTotalCustomers As Integer
Global gLinesWithSuccess As Integer
Global gLinesWithError As Integer
Global gTotalLines As Integer

'--------------------------------------------------
'VARIABLES TO LOG
'--------------------------------------------------
Global gUserMachine As String
Global gNameMachine As String
Global gDateAccess As String