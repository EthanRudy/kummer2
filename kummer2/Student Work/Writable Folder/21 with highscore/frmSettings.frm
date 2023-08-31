VERSION 5.00
Begin VB.Form frmSettings 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Dealer Settings"
   ClientHeight    =   2070
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3930
   Icon            =   "frmSettings.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2070
   ScaleWidth      =   3930
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdChange 
      Caption         =   "Change"
      Height          =   495
      Left            =   1200
      TabIndex        =   1
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox txtDraw 
      Height          =   285
      Left            =   1200
      TabIndex        =   0
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Dealer must draw to:"
      Height          =   255
      Left            =   1200
      TabIndex        =   2
      Top             =   240
      Width           =   2415
   End
End
Attribute VB_Name = "frmSettings"
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
    RetVal = WritePrivateProfileString("Dealer", "Draw", Str$(txtDraw), INIfile)
    Call frmMain.ChangeDealerDraw
    frmSettings.Hide

End Sub
