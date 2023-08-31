VERSION 5.00
Begin VB.Form frmBankChange 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Change Bank"
   ClientHeight    =   1905
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   Icon            =   "frmBankChange.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1905
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdChange 
      Caption         =   "Change"
      Height          =   495
      Left            =   1560
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.TextBox txtBank 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   2535
   End
End
Attribute VB_Name = "frmBankChange"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
    Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
    Dim INIfile As String
    Dim Ap As String
    Dim RetVal As Long
    
Private Sub cmdChange_Click()
    
    If Right(App.Path, 1) = "\" Then
        Ap = App.Path
    Else
        Ap = App.Path & "\"
    End If
    
    INIfile = Ap & "BlackJack.INI"
    RetVal = WritePrivateProfileString("BlackJack", "Bank", Str$(frmBankChange.txtBank), INIfile)
    Call frmMain.ChangeBank
    frmBankChange.Hide

End Sub
