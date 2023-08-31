VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSComCt2.ocx"
Begin VB.Form frmStart 
   AutoRedraw      =   -1  'True
   BackColor       =   &H0000C000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3180
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4665
   Icon            =   "frmStart.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   212
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   311
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdPlay 
      Caption         =   "Play"
      Height          =   495
      Left            =   1440
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
   Begin MSComCtl2.Animation Animation1 
      Height          =   1440
      Left            =   3600
      TabIndex        =   0
      Top             =   1740
      Width           =   1065
      _ExtentX        =   1879
      _ExtentY        =   2540
      _Version        =   393216
      FullWidth       =   71
      FullHeight      =   96
   End
   Begin VB.Label Label10 
      BackStyle       =   0  'Transparent
      Caption         =   "BlackJack pays 3 to 1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   1080
      TabIndex        =   7
      Top             =   2280
      Width           =   2295
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "BLACKJACK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFF00&
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   120
      Width           =   4455
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "Double only allowed on 11"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   1080
      TabIndex        =   5
      Top             =   2040
      Width           =   2295
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "No Split allowed"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   1080
      TabIndex        =   4
      Top             =   1800
      Width           =   2055
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   1080
      TabIndex        =   3
      Top             =   1560
      Width           =   2055
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Rules:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFF00&
      Height          =   255
      Left            =   480
      TabIndex        =   2
      Top             =   1560
      Width           =   615
   End
End
Attribute VB_Name = "frmStart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
    Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
    Dim INIfile As String
    Dim mDealerDraw As Integer
    
Private Sub cmdPlay_Click()
    
    frmMain.Show
    Animation1.Stop
    
End Sub

Private Sub Form_Load()
    Dim mFileName As String
    
    mFileName = App.Path & "\" & _
                            "Opening Page.avi"
    
    INIfile = App.Path & "\" & "BlackJack.INI"
        
    mDealerDraw = GetIni("Dealer", "Draw")
    If Not IsNumeric(mDealerDraw) Then mDealerDraw = 17
    frmSettings.txtDraw.Text = mDealerDraw
    Label5.Caption = "Dealer must draw to " & Int(mDealerDraw)
    
    Call Animation1.Open(mFileName)
    Animation1.Play

End Sub

Private Function GetIni(section As String, key As String)

Dim r As String
Dim Worked As Long

r = String(255, 0)
Worked = GetPrivateProfileString(section, key, "", r, Len(r), INIfile)
If Worked <> 0 Then
    GetIni = Trim(Left(r, InStr(r, Chr(0)) - 1))
End If

End Function


Private Sub Label1_Click()

End Sub
