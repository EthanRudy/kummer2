VERSION 5.00
Object = "{6DE6E6DD-C656-11D2-B052-444553540000}#2.0#0"; "VBCards.ocx"
Object = "{55473EAC-7715-4257-B5EF-6E14EBD6A5DD}#1.0#0"; "vbalProgBar6.ocx"
Begin VB.Form frmShuffle 
   BackColor       =   &H0000C000&
   BorderStyle     =   0  'None
   Caption         =   "Shuffling"
   ClientHeight    =   2835
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4620
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2835
   ScaleWidth      =   4620
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin vbalProgBarLib6.vbalProgressBar pgbOne 
      Height          =   255
      Left            =   270
      TabIndex        =   1
      Top             =   2400
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   450
      Picture         =   "frmShuffle.frx":0000
      BackColor       =   49152
      ForeColor       =   16776960
      BarColor        =   16711680
      BarPicture      =   "frmShuffle.frx":001C
      Max             =   52
      ShowText        =   -1  'True
      Text            =   "Shuffling"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VBCards.Deck Deck1 
      Left            =   480
      Top             =   1560
      _ExtentX        =   847
      _ExtentY        =   1032
      Picture         =   "frmShuffle.frx":0038
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   60
      Left            =   480
      Top             =   1080
   End
   Begin VB.Shape Shape1 
      BorderWidth     =   5
      Height          =   2760
      Left            =   30
      Top             =   0
      Width           =   4545
   End
   Begin VB.Image Image1 
      Height          =   1575
      Left            =   210
      Top             =   720
      Width           =   1095
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "SHUFFLING THE DECK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFF00&
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   4215
   End
   Begin VB.Shape Shape2 
      Height          =   2595
      Left            =   120
      Top             =   120
      Width           =   4365
   End
End
Attribute VB_Name = "frmShuffle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()

    Call Randomize
    pgbOne.Value = 0
    Timer1.Enabled = True

End Sub



Private Sub Timer1_Timer()
    Dim card As Integer
    
    pgbOne.Value = pgbOne.Value + 1
    
    Call Randomize
        
    card = 1 + Int(Rnd() * 52)
    
    Deck1.ChangeCard = card
    Image1.Picture = Deck1.Picture
    
    With Image1
        .Left = Int(Image1.Left) + 60
        .Top = 720
    End With
    
    If pgbOne.Value = 52 Then
        Timer1.Enabled = False
        frmShuffle.Visible = False
        Call frmMain.BetButtonCont
        pgbOne.Value = 0
        With Image1
            .Left = 210
            .Top = 720
        End With
    End If
        
End Sub

