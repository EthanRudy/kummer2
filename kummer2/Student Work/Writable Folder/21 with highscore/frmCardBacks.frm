VERSION 5.00
Begin VB.Form frmCardBacks 
   BackColor       =   &H0000C000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Change Deck"
   ClientHeight    =   3645
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5580
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3645
   ScaleWidth      =   5580
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox imgBack 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   7
      Left            =   4200
      ScaleHeight     =   1455
      ScaleWidth      =   1095
      TabIndex        =   7
      Top             =   1920
      Width           =   1095
   End
   Begin VB.PictureBox imgBack 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   6
      Left            =   2880
      ScaleHeight     =   1455
      ScaleWidth      =   1095
      TabIndex        =   6
      Top             =   1920
      Width           =   1095
   End
   Begin VB.PictureBox imgBack 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   5
      Left            =   1560
      ScaleHeight     =   1455
      ScaleWidth      =   1095
      TabIndex        =   5
      Top             =   1920
      Width           =   1095
   End
   Begin VB.PictureBox imgBack 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   4
      Left            =   240
      ScaleHeight     =   1455
      ScaleWidth      =   1095
      TabIndex        =   4
      Top             =   1920
      Width           =   1095
   End
   Begin VB.PictureBox imgBack 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   3
      Left            =   4200
      ScaleHeight     =   1455
      ScaleWidth      =   1095
      TabIndex        =   3
      Top             =   240
      Width           =   1095
   End
   Begin VB.PictureBox imgBack 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   2
      Left            =   2880
      ScaleHeight     =   1455
      ScaleWidth      =   1095
      TabIndex        =   2
      Top             =   240
      Width           =   1095
   End
   Begin VB.PictureBox imgBack 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   1
      Left            =   1560
      ScaleHeight     =   1455
      ScaleWidth      =   1095
      TabIndex        =   1
      Top             =   240
      Width           =   1095
   End
   Begin VB.PictureBox imgBack 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      DrawStyle       =   5  'Transparent
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   0
      Left            =   240
      ScaleHeight     =   1455
      ScaleWidth      =   1095
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "frmCardBacks"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
    Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
    Dim INIfile As String
    Dim Ap As String
    Dim RetVal As Long
    
Private Sub Form_Load()
    Dim x As Integer
    
    If Right(App.Path, 1) = "\" Then
        Ap = App.Path
    Else
        Ap = App.Path & "\"
    End If
    
    For x = 0 To 7
        frmMain.Deck1.ChangeCard = x + 59
        imgBack(x).Picture = frmMain.Deck1.Picture
        imgBack(x).Enabled = True
    Next x
        
End Sub

Private Sub imgBack_Click(Index As Integer)
    Dim x As Integer
    
    imgBack(Index).Appearance = 1
    imgBack(Index).BorderStyle = 1
    
    For x = 0 To 7
        imgBack(x).Enabled = False
    Next x
    
    frmMain.Deck1.ChangeCard = Index + 59
    
    frmMain.Image1(55).Picture = frmMain.Deck1.Picture
    frmMain.imgMove(0).Picture = frmMain.Deck1.Picture
    frmMain.imgDeck.Picture = frmMain.Deck1.Picture
    
    INIfile = Ap & "BlackJack.INI"
    RetVal = WritePrivateProfileString("BlackJack", "Deck", Str$(Index + 59), INIfile)
    
    Call Unload(frmCardBacks)
    frmCardBacks.Hide
    
End Sub
