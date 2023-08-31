VERSION 5.00
Object = "{6DE6E6DD-C656-11D2-B052-444553540000}#2.0#0"; "VBCards.ocx"
Begin VB.Form frmMain 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "BlackJack"
   ClientHeight    =   5940
   ClientLeft      =   60
   ClientTop       =   675
   ClientWidth     =   8985
   Icon            =   "BlackJackfrmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "BlackJackfrmMain.frx":0442
   ScaleHeight     =   396
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   599
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer5 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   8400
      Top             =   1440
   End
   Begin VB.Timer Timer4 
      Interval        =   1000
      Left            =   8400
      Top             =   1080
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   8400
      Top             =   720
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   8400
      Top             =   360
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   8400
      Top             =   0
   End
   Begin VBCards.Deck Deck1 
      Left            =   600
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   1032
      Picture         =   "BlackJackfrmMain.frx":10D70
   End
   Begin VB.Label lblTime 
      Alignment       =   2  'Center
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
      ForeColor       =   &H00FFFF00&
      Height          =   255
      Left            =   5775
      TabIndex        =   17
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Label lblPlayerBusts 
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
      ForeColor       =   &H00FFFF00&
      Height          =   255
      Left            =   8475
      TabIndex        =   16
      Top             =   3690
      Width           =   375
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Player Bust's:"
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
      Height          =   195
      Left            =   7290
      TabIndex        =   15
      Top             =   3690
      Width           =   1170
   End
   Begin VB.Label lblBlackJacks 
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
      ForeColor       =   &H00FFFF00&
      Height          =   255
      Left            =   8490
      TabIndex        =   14
      Top             =   3330
      Width           =   375
   End
   Begin VB.Label lblDraws 
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
      ForeColor       =   &H00FFFF00&
      Height          =   255
      Left            =   8490
      TabIndex        =   13
      Top             =   2970
      Width           =   375
   End
   Begin VB.Label lblPlayerWins 
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
      ForeColor       =   &H00FFFF00&
      Height          =   255
      Left            =   8490
      TabIndex        =   12
      Top             =   2610
      Width           =   375
   End
   Begin VB.Label lblDealerWins 
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
      ForeColor       =   &H00FFFF00&
      Height          =   255
      Left            =   8490
      TabIndex        =   11
      Top             =   2250
      Width           =   375
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "BlackJack's:"
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
      Height          =   195
      Left            =   7365
      TabIndex        =   10
      Top             =   3330
      Width           =   1095
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Draws :"
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
      Height          =   195
      Left            =   7800
      TabIndex        =   9
      Top             =   2970
      Width           =   660
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Player Wins:"
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
      Height          =   195
      Left            =   7380
      TabIndex        =   8
      Top             =   2610
      Width           =   1080
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Dealer Wins:"
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
      Height          =   195
      Left            =   7350
      TabIndex        =   7
      Top             =   2250
      Width           =   1110
   End
   Begin VB.Image imgMove 
      Appearance      =   0  'Flat
      Height          =   1455
      Index           =   0
      Left            =   240
      Top             =   360
      Width           =   1095
   End
   Begin VB.Image imgDeck 
      Appearance      =   0  'Flat
      Height          =   1455
      Left            =   240
      Top             =   360
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   55
      Left            =   2880
      Top             =   360
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   14
      Left            =   7080
      Top             =   360
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   13
      Left            =   5880
      Top             =   360
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   12
      Left            =   4680
      Top             =   360
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   11
      Left            =   3480
      Top             =   360
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   10
      Left            =   2280
      Top             =   360
      Width           =   1095
   End
   Begin VB.Label lblCpuCount 
      BackStyle       =   0  'Transparent
      Caption         =   "Dealer Count = "
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
      Left            =   2280
      TabIndex        =   6
      Top             =   2085
      Width           =   1935
   End
   Begin VB.Label lblBank 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   3600
      Width           =   2415
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "BANK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   3360
      Width           =   855
   End
   Begin VB.Label lblBlackJack 
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
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   1200
      TabIndex        =   3
      Top             =   2760
      Visible         =   0   'False
      Width           =   5055
   End
   Begin VB.Label lblBust 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "BUST"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1095
      Left            =   1200
      TabIndex        =   2
      Top             =   2400
      Visible         =   0   'False
      Width           =   5055
   End
   Begin VB.Image imgDouble 
      Appearance      =   0  'Flat
      Height          =   495
      Left            =   360
      Picture         =   "BlackJackfrmMain.frx":12CC2
      Top             =   5280
      Visible         =   0   'False
      Width           =   990
   End
   Begin VB.Image imgStand 
      Appearance      =   0  'Flat
      Height          =   495
      Left            =   360
      Picture         =   "BlackJackfrmMain.frx":131C1
      Top             =   4740
      Visible         =   0   'False
      Width           =   990
   End
   Begin VB.Image imgHitMe 
      Appearance      =   0  'Flat
      Height          =   495
      Left            =   360
      Picture         =   "BlackJackfrmMain.frx":136C3
      Top             =   4200
      Visible         =   0   'False
      Width           =   990
   End
   Begin VB.Image imgBetButton 
      Height          =   1440
      Left            =   960
      Picture         =   "BlackJackfrmMain.frx":13BA8
      Top             =   4200
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label lblBetTotal 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Rockwell Extra Bold"
         Size            =   18
         Charset         =   0
         Weight          =   800
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   855
      TabIndex        =   1
      Top             =   2730
      Width           =   840
   End
   Begin VB.Image Image5 
      Enabled         =   0   'False
      Height          =   990
      Left            =   780
      Picture         =   "BlackJackfrmMain.frx":14169
      Tag             =   "One"
      Top             =   2475
      Width           =   990
   End
   Begin VB.Image imgChip20 
      Height          =   495
      Left            =   360
      Picture         =   "BlackJackfrmMain.frx":14A30
      Top             =   5280
      Width           =   495
   End
   Begin VB.Image imgChip10 
      Height          =   495
      Left            =   360
      Picture         =   "BlackJackfrmMain.frx":14EF8
      Top             =   4740
      Width           =   495
   End
   Begin VB.Image imgChip05 
      Height          =   495
      Left            =   360
      Picture         =   "BlackJackfrmMain.frx":15398
      Top             =   4200
      Width           =   495
   End
   Begin VB.Label lblCount 
      BackStyle       =   0  'Transparent
      Caption         =   "Card Count = "
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
      Left            =   2280
      TabIndex        =   0
      Top             =   3840
      Width           =   1935
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   9
      Left            =   7680
      Top             =   4440
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   8
      Left            =   6480
      Top             =   4440
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   7
      Left            =   5280
      Top             =   4440
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   6
      Left            =   4080
      Top             =   4440
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   5
      Left            =   2880
      Top             =   4440
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   4
      Left            =   7080
      Top             =   4200
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   3
      Left            =   5880
      Top             =   4200
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   2
      Left            =   4680
      Top             =   4200
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   1
      Left            =   3480
      Top             =   4200
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1455
      Index           =   0
      Left            =   2280
      Top             =   4200
      Width           =   1095
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuNewGame 
         Caption         =   "New Game"
         Shortcut        =   {F2}
      End
      Begin VB.Menu mnuLine1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuChangeCards 
         Caption         =   "Change Cards"
      End
      Begin VB.Menu mnuLine2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuChangeBank 
         Caption         =   "Change Bank"
      End
      Begin VB.Menu mnuLine3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuResetScores 
         Caption         =   "Reset Scores"
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu mnuSettings 
         Caption         =   "Settings"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
    Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
    Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
    Dim INIfile As String
    Dim mFileSysObj As New FileSystemObject
    Dim mFile As File
    Dim mTextStream As TextStream
    Dim Ap As String
    Dim RetVal As Long
    Dim mCardCount(1 To 52) As Integer
    Dim mCardIdent(1 To 52) As Integer
    Dim mBetTotal As Integer
    Dim mDealer As Integer
    Dim mDealTotal As Integer
    Dim mCpumDealTotal As Integer
    Dim mPlayerDealt As Integer
    Dim mPlayerFinish As Integer
    Dim mBank As Integer
    Dim mMoveLeft As Integer
    Dim mMoveTop As Integer
    Dim mMoveCounterOne As Integer
    Dim mMoveCounterTwo As Integer
    Dim mDealerWins As Integer
    Dim mPlayerWins As Integer
    Dim mDraws As Integer
    Dim mBlackJacks As Integer
    Dim mPlayerBusts As Integer
    Dim mDealerDraw As Integer
    Dim ShuffleCount As Integer
    
Private Sub Form_Load()
    Dim x As Integer
    Dim card As Integer
    Call Randomize
        
    If Right(App.Path, 1) = "\" Then
        Ap = App.Path
    Else
        Ap = App.Path & "\"
    End If
    
    INIfile = Ap & "BlackJack.INI"
    Call readINI
    
    frmBankChange.txtBank.Text = mBank
    lblDealerWins.Caption = mDealerWins
    lblPlayerWins.Caption = mPlayerWins
    lblDraws.Caption = mDraws
    lblBlackJacks.Caption = mBlackJacks
    lblPlayerBusts.Caption = mPlayerBusts
    
    lblBank.Caption = FormatCurrency(mBank, 2)
        
    For x = 0 To 14
        Deck1.ChangeCard = 55
        Image1(x).Picture = Deck1.Picture
        Image1(x).Visible = False
    Next x
    
    Image1(55).Visible = False
    imgMove(0).Visible = False
    lblBust.Visible = False
    lblBlackJack.Visible = False
    mBetTotal = 0
    mPlayerDealt = 0
    mPlayerFinish = 0
    lblCount.Caption = ""
    lblCpuCount.Caption = ""
    ShuffleCount = 0
    
    mCardIdent(1) = 1
    mCardIdent(2) = 2
    mCardIdent(3) = 3
    mCardIdent(4) = 4
    mCardIdent(5) = 5
    mCardIdent(6) = 6
    mCardIdent(7) = 7
    mCardIdent(8) = 8
    mCardIdent(9) = 9
    mCardIdent(10) = 10
    mCardIdent(11) = 10
    mCardIdent(12) = 10
    mCardIdent(13) = 10
    mCardIdent(14) = 1
    mCardIdent(15) = 2
    mCardIdent(16) = 3
    mCardIdent(17) = 4
    mCardIdent(18) = 5
    mCardIdent(19) = 6
    mCardIdent(20) = 7
    mCardIdent(21) = 8
    mCardIdent(22) = 9
    mCardIdent(23) = 10
    mCardIdent(24) = 10
    mCardIdent(25) = 10
    mCardIdent(26) = 10
    mCardIdent(27) = 1
    mCardIdent(28) = 2
    mCardIdent(29) = 3
    mCardIdent(30) = 4
    mCardIdent(31) = 5
    mCardIdent(32) = 6
    mCardIdent(33) = 7
    mCardIdent(34) = 8
    mCardIdent(35) = 9
    mCardIdent(36) = 10
    mCardIdent(37) = 10
    mCardIdent(38) = 10
    mCardIdent(39) = 10
    mCardIdent(40) = 1
    mCardIdent(41) = 2
    mCardIdent(42) = 3
    mCardIdent(43) = 4
    mCardIdent(44) = 5
    mCardIdent(45) = 6
    mCardIdent(46) = 7
    mCardIdent(47) = 8
    mCardIdent(48) = 9
    mCardIdent(49) = 10
    mCardIdent(50) = 10
    mCardIdent(51) = 10
    mCardIdent(52) = 10
   
End Sub

Public Function Deal()
    Dim x As Integer, card As Integer
        
    For x = 0 To 14
        Image1(x).Tag = "0"
    Next x
    
    Call Shuffle
    ShuffleCount = ShuffleCount + 1

    mDealTotal = 0
    mDealer = 1
    mCpumDealTotal = 0
    Image1(55).Visible = True
    lblCount.Caption = "Card Count = "
    lblCpuCount.Caption = ""
    
    card = mCardCount(mDealer)
    Deck1.ChangeCard = card
    Image1(mPlayerDealt).Picture = Deck1.Picture
    Image1(mPlayerDealt).Tag = mCardIdent(card)
    Image1(mPlayerDealt).Visible = True
    mDealTotal = mDealTotal + Int(mCardIdent(card))
    mDealer = mDealer + 1
    mPlayerDealt = mPlayerDealt + 1
   
    card = mCardCount(mDealer)
    Deck1.ChangeCard = card
    Image1(mPlayerDealt).Picture = Deck1.Picture
    Image1(mPlayerDealt).Tag = mCardIdent(card)
    Image1(mPlayerDealt).Visible = True
    mDealTotal = mDealTotal + Int(mCardIdent(card))
    mDealer = mDealer + 1
    mPlayerDealt = mPlayerDealt + 1
    
    ' CHECK FOR THE ACE
    If Image1(0).Tag = 1 Then
        mDealTotal = mDealTotal + 10
        If mDealTotal > 21 Then
            mDealTotal = mDealTotal - 10
        End If
    ElseIf Image1(1).Tag = 1 Then
        mDealTotal = mDealTotal + 10
        If mDealTotal > 21 Then
            mDealTotal = mDealTotal - 10
        End If
    End If
    
    If mDealTotal = 21 Then
        Timer1.Enabled = True
        mBank = mBank + (mBetTotal * 3)
        lblBank.Caption = FormatCurrency(mBank, 2)
        lblBetTotal.Caption = ""
        imgBetButton.Visible = False
        imgChip05.Visible = True
        imgChip10.Visible = True
        imgChip20.Visible = True
        imgHitMe.Visible = False
        imgStand.Visible = False
        imgDouble.Visible = False
        mBlackJacks = mBlackJacks + 1
        lblBlackJacks.Caption = mBlackJacks
    End If
    
    If mDealTotal = 11 Then
        imgDouble.Visible = True
    End If
    
    lblCount.Caption = lblCount.Caption & mDealTotal
    
    card = mCardCount(mDealer)
    Deck1.ChangeCard = card
    Image1(10).Picture = Deck1.Picture
    Image1(10).Tag = mCardIdent(card)
    Image1(10).Visible = True
    mDealer = mDealer + 1
    mCpumDealTotal = mCpumDealTotal + Image1(10).Tag
    If mCardCount(mDealer) = 1 Then
        mCpumDealTotal = mCpumDealTotal + 10
        If mCpumDealTotal > 21 Then
            mCpumDealTotal = mCpumDealTotal - 10
        End If
    End If
    
    card = mCardCount(mDealer)
    Deck1.ChangeCard = card
    Image1(11).Picture = Deck1.Picture
    Image1(11).Tag = mCardIdent(card)
    mDealer = mDealer + 1
    mCpumDealTotal = mCpumDealTotal + Image1(11).Tag
    If mCardCount(mDealer) = 1 Then
        mCpumDealTotal = mCpumDealTotal + 10
        If mCpumDealTotal > 21 Then
            mCpumDealTotal = mCpumDealTotal - 10
        End If
    End If
    
    Image1(11).Visible = False
    
    lblCpuCount.Caption = "Dealer Count = " & mCpumDealTotal
    
End Function

Private Sub Shuffle()
    Dim card As Integer, row As Integer
    
    Call ZeroDeckArray
    
    For card = 1 To 52
        Do
            row = 1 + Int(Rnd() * UBound(mCardCount))
        Loop While mCardCount(row) <> 0
        
        mCardCount(row) = card
    Next card

End Sub

Private Sub ZeroDeckArray()
    Dim row As Integer
    
    For row = LBound(mCardCount) To UBound(mCardCount)
        mCardCount(row) = 0
    Next row
End Sub

Private Sub Form_Terminate()
    
    Call UnloadAndSave
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    
    Call UnloadAndSave

End Sub

Private Sub UnloadAndSave()

    RetVal = WritePrivateProfileString("BlackJack", "Bank", Str$(mBank), INIfile)
    RetVal = WritePrivateProfileString("BlackJack", "Dealerwins", Str$(mDealerWins), INIfile)
    RetVal = WritePrivateProfileString("BlackJack", "Playerwins", Str$(mPlayerWins), INIfile)
    RetVal = WritePrivateProfileString("BlackJack", "Draws", Str$(mDraws), INIfile)
    RetVal = WritePrivateProfileString("BlackJack", "BlackJacks", Str$(mBlackJacks), INIfile)
    RetVal = WritePrivateProfileString("BlackJack", "PlayerBusts", Str$(mPlayerBusts), INIfile)
    Call Unload(frmBankChange)
    Call Unload(frmCardBacks)
    Call Unload(frmStart)
    Call Unload(frmSettings)
    Call Unload(frmShuffle)
    Unload Me

End Sub

Private Sub imgChip05_Click()
    mBetTotal = mBetTotal + 5
    lblBetTotal.Caption = mBetTotal
    imgBetButton.Visible = True
    Timer1.Enabled = False
    Image1(55).Visible = False
    mBank = mBank - 5
    lblBank.Caption = FormatCurrency(mBank, 2)
    lblBlackJack.Visible = False
    
    If Image5.Tag = "One" Then
        Image5.Picture = LoadPicture(Ap & "ChipTotal2.gif")
        Image5.Tag = "Two"
    ElseIf Image5.Tag = "Two" Then
        Image5.Picture = LoadPicture(Ap & "ChipTotal.gif")
        Image5.Tag = "One"
    End If
    
    Call ResetGame
End Sub

Private Sub imgChip10_Click()
    mBetTotal = mBetTotal + 10
    lblBetTotal.Caption = mBetTotal
    imgBetButton.Visible = True
    Timer1.Enabled = False
    Image1(55).Visible = False
    mBank = mBank - 10
    lblBank.Caption = FormatCurrency(mBank, 2)
    lblBlackJack.Visible = False
    
    If Image5.Tag = "One" Then
        Image5.Picture = LoadPicture(Ap & "ChipTotal2.gif")
        Image5.Tag = "Two"
    ElseIf Image5.Tag = "Two" Then
        Image5.Picture = LoadPicture(Ap & "ChipTotal.gif")
        Image5.Tag = "One"
    End If
    
    Call ResetGame
End Sub

Private Sub imgChip20_Click()
    Dim r As Integer

    r = 0

    mBetTotal = mBetTotal + 20
    lblBetTotal.Caption = mBetTotal
    imgBetButton.Visible = True
    Timer1.Enabled = False
    Image1(55).Visible = False
    mBank = mBank - 20
    
    If mBank < Int(0) Then
        r = InputBox("You are broke. Would you like to borrow money?", "Loan Shark")
    End If
    
    If r > 0 Then
        mBank = r
    End If
    
    lblBank.Caption = FormatCurrency(mBank, 2)
    lblBlackJack.Visible = False
    
    If Image5.Tag = "One" Then
        Image5.Picture = LoadPicture(Ap & "ChipTotal2.gif")
        Image5.Tag = "Two"
    ElseIf Image5.Tag = "Two" Then
        Image5.Picture = LoadPicture(Ap & "ChipTotal.gif")
        Image5.Tag = "One"
    End If
    
    Call ResetGame
    
End Sub

Private Sub imgBetButton_Click()

    Call BetButtonCont

End Sub

Public Function BetButtonCont()
    
    If ShuffleCount = 10 Then
        ShuffleCount = 0
        frmShuffle.Visible = True
        frmShuffle.Timer1.Enabled = True
    Else
        With imgMove(0)
            .Left = 16
            .Top = 24
        End With
        mMoveCounterOne = 0
        mMoveCounterTwo = 0
        imgMove(0).Visible = True
        Timer2.Enabled = True
    End If
    
End Function
Private Sub FirstDeal()

    lblCpuCount.Caption = ""
    lblCount.Caption = ""
    imgBetButton.Visible = False
    imgChip05.Visible = False
    imgChip10.Visible = False
    imgChip20.Visible = False
    imgHitMe.Visible = True
    imgStand.Visible = True
    imgDouble.Visible = True
    lblCount.Visible = True
    lblCpuCount.Visible = False
    lblBust.Caption = ""
    lblBust.Visible = False
    imgDouble.Visible = False
    
    Call Deal

End Sub

Private Sub imgBetButton_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
    imgBetButton.Picture = LoadPicture(Ap & "BetDown.gif")
End Sub

Private Sub imgBetButton_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
    imgBetButton.Picture = LoadPicture(Ap & "BetUp.gif")
End Sub

Private Sub imgDouble_Click()
       
    mBank = mBank - mBetTotal
    lblBank.Caption = FormatCurrency(mBank, 2)
    mBetTotal = mBetTotal * 2
    lblBetTotal.Caption = mBetTotal
    
    Call imgHitMe_Click
    
End Sub

Private Sub HitMeDeal()
    Dim x As Integer, card As Integer
    
    mDealTotal = Int(Mid$(lblCount, 14, 2))
    
    card = mCardCount(mDealer)
    Deck1.ChangeCard = card
    Image1(mPlayerDealt).Picture = Deck1.Picture
    Image1(mPlayerDealt).Tag = mCardIdent(card)
    Image1(mPlayerDealt).Visible = True
    mDealTotal = mDealTotal + Int(mCardIdent(card))
    mDealer = mDealer + 1
    mPlayerDealt = mPlayerDealt + 1
    
    Call AceCheck
            
    lblCount = "Card Count = " & mDealTotal
    
    If mPlayerDealt = 10 Then
        imgHitMe.Visible = False
        imgStand.Visible = False
        imgDouble.Visible = False
        Call CPUDeal
    End If
    
    If mDealTotal > 21 Then
        lblBust.Caption = "You Busted!"
        lblBust.Visible = True
        imgHitMe.Visible = False
        imgStand.Visible = False
        imgDouble.Visible = False
        imgChip05.Visible = True
        imgChip10.Visible = True
        imgChip20.Visible = True
        lblBetTotal.Caption = ""
        mPlayerBusts = mPlayerBusts + 1
        lblPlayerBusts.Caption = mPlayerBusts
        mBetTotal = 0
    End If
    
    If imgDouble.Visible = True Then
        Call imgStand_Click
    End If
    

    
End Sub

Private Sub imgHitMe_Click()
    
    With imgMove(0)
        .Left = 16
        .Top = 24
    End With
    mMoveCounterOne = 0
    mMoveCounterTwo = 0
    imgMove(0).Visible = True
    Timer3.Enabled = True

End Sub

Private Sub imgHitMe_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
    imgHitMe.Picture = LoadPicture(Ap & "HitMeDown.gif")
End Sub

Private Sub imgHitMe_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
    imgHitMe.Picture = LoadPicture(Ap & "HitmeUp.gif")
End Sub

Private Sub imgStand_Click()
    
    imgHitMe.Visible = False
    imgDouble.Visible = False
    Image1(55).Visible = False
    imgStand.Visible = False
    imgChip05.Visible = True
    imgChip10.Visible = True
    imgChip20.Visible = True
    lblCpuCount.Visible = True
    
    Call CPUDeal

End Sub

Private Sub imgStand_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
    imgStand.Picture = LoadPicture(Ap & "StandDown.gif")
End Sub

Private Sub imgStand_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
    imgStand.Picture = LoadPicture(Ap & "StandUp.gif")
End Sub

Private Sub imgDouble_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
    imgDouble.Picture = LoadPicture(Ap & "DoubleDown.gif")
End Sub

Private Sub imgDouble_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
    imgDouble.Picture = LoadPicture(Ap & "DoubleUp.gif")
End Sub

Private Sub mnuChangeBank_Click()
    frmBankChange.Show
End Sub

Private Sub mnuChangeCards_Click()
    frmCardBacks.Show
End Sub

Private Sub mnuExit_Click()
    Call Form_Terminate
End Sub

Private Sub mnuNewGame_Click()
    Dim x As Integer
    
    For x = 0 To 14
        Deck1.ChangeCard = 55
        Image1(x).Picture = Deck1.Picture
        Image1(x).Visible = False
    Next x

    lblCount.Caption = ""
    
    mBetTotal = 0
    mDealer = 1
    mDealTotal = 0
    mPlayerDealt = 0
    mPlayerFinish = 0
    imgChip05.Visible = True
    imgChip10.Visible = True
    imgChip20.Visible = True
    lblBust.Visible = False
    lblBlackJack.Visible = False
    imgHitMe.Visible = False
    imgStand.Visible = False
    imgDouble.Visible = False
    Image1(55).Visible = False
    imgBetButton.Visible = False
    lblBetTotal.Caption = ""
    Timer1.Enabled = False
    lblBlackJack.Visible = False
    
End Sub

Private Sub mnuResetScores_Click()
    Dim Mes As String
    
    Mes = MsgBox("This will clear all scores. Are you Sure?", vbOKCancel, "Clear Scores")
        
    If Mes = vbOK Then
        mDealerWins = 0
        mPlayerWins = 0
        mDraws = 0
        mBlackJacks = 0
        mPlayerBusts = 0
        lblDealerWins.Caption = mDealerWins
        lblPlayerWins.Caption = mPlayerWins
        lblDraws.Caption = mDraws
        lblBlackJacks.Caption = mBlackJacks
        lblPlayerBusts.Caption = mPlayerBusts
    End If

End Sub

Private Sub mnuSettings_Click()
    frmSettings.Show
End Sub

Private Sub Timer1_Timer()
    lblBlackJack.Visible = True
    If lblBlackJack.ForeColor = vbRed Then
        lblBlackJack.ForeColor = vbBlue
    Else
        lblBlackJack.ForeColor = vbRed
    End If
End Sub

Private Sub CPUDeal()
    Dim card As Integer, DealCounter As Integer
    Dim x As Integer
    
    Call DealerAceCheck
    
    mCpumDealTotal = Int(Image1(10).Tag) + _
                     Int(Image1(11).Tag)
                         
    DealCounter = 12
    
    Image1(11).Visible = True
    Image1(55).Visible = False
    
    If mCpumDealTotal = 21 Then
        lblCpuCount.Caption = "Dealer Count = " & mCpumDealTotal
        If lblBust.Visible = False Then
            If mCpumDealTotal > mDealTotal Then
                lblBust.Caption = "You Lost!" & _
                    vbNewLine & "Please try again."
                mDealerWins = mDealerWins + 1
                lblDealerWins.Caption = mDealerWins
            ElseIf mDealTotal > mCpumDealTotal Then
                lblBust.Caption = "You WON!" & _
                    vbNewLine & "Go HOME!"
                mPlayerWins = mPlayerWins + 1
                lblPlayerWins.Caption = mPlayerWins
                mBank = mBank + (mBetTotal * 2)
                lblBank.Caption = FormatCurrency(mBank, 2)
            ElseIf mDealTotal = mCpumDealTotal Then
                lblBust.Caption = "Draw." & _
                    vbNewLine & "Go Again?"
                mDraws = mDraws + 1
                lblDraws.Caption = mDraws
                mBank = mBank + mBetTotal
                lblBank.Caption = FormatCurrency(mBank, 2)
            End If
        End If
        
        lblBust.Visible = True
        lblBetTotal.Caption = ""
        mBetTotal = 0
        Exit Sub
    End If
    
    lblBust.Caption = ""
    
    If mCpumDealTotal < mDealerDraw Then
        If Image1(14).Tag > 0 Then
            ' Cancel dealer draw and continue
        Else
        Do
            card = mCardCount(mDealer)
            Deck1.ChangeCard = card
            Image1(DealCounter).Picture = Deck1.Picture
            Image1(DealCounter).Tag = mCardIdent(card)
            Image1(DealCounter).Visible = True
            mDealer = mDealer + 1
            mCpumDealTotal = mCpumDealTotal + Image1(DealCounter).Tag
            Call DealerAceCheck
            DealCounter = DealCounter + 1
        Loop While mCpumDealTotal < mDealerDraw
        End If
    End If
    
    lblCpuCount.Caption = "Dealer Count = " & mCpumDealTotal
    
    If mCpumDealTotal > 21 Then
        lblBust.Caption = "Dealer Busted" & vbNewLine & "You WIN!"
        mBank = mBank + (mBetTotal * 2)
        lblBank.Caption = FormatCurrency(mBank, 2)
        lblBust.Visible = True
        lblBetTotal.Caption = ""
        mBetTotal = 0
        mPlayerWins = mPlayerWins + 1
        lblPlayerWins.Caption = mPlayerWins
        Exit Sub
    End If
    
    If lblBust.Visible = False Then
        If mCpumDealTotal > mDealTotal Then
            lblBust.Caption = "You Lost!" & _
                vbNewLine & "Please try again."
            mDealerWins = mDealerWins + 1
            lblDealerWins.Caption = mDealerWins
        ElseIf mDealTotal > mCpumDealTotal Then
            lblBust.Caption = "You WON!" & _
                vbNewLine & "Go HOME!"
            mPlayerWins = mPlayerWins + 1
            lblPlayerWins.Caption = mPlayerWins
            mBank = mBank + (mBetTotal * 2)
            lblBank.Caption = FormatCurrency(mBank, 2)
        ElseIf mDealTotal = mCpumDealTotal Then
            lblBust.Caption = "Draw." & _
                vbNewLine & "Go Again?"
            mDraws = mDraws + 1
            lblDraws.Caption = mDraws
            mBank = mBank + mBetTotal
            lblBank.Caption = FormatCurrency(mBank, 2)
        End If
    End If

    lblBust.Visible = True
    lblBetTotal.Caption = ""
    mBetTotal = 0

End Sub

Private Sub ResetGame()
    Dim x As Integer
    
    For x = 0 To 14
        Image1(x).Visible = False
    Next x
    
    Deck1.ChangeCard = 55
    
    For x = 0 To 14
        Image1(x).Picture = Deck1.Picture
    Next x
        
    mDealTotal = 0
    mDealer = 1
    mCpumDealTotal = 0
    mPlayerDealt = 0
    lblCount.Caption = ""
    lblCpuCount.Caption = ""
    imgChip05.Visible = True
    imgChip10.Visible = True
    imgChip20.Visible = True
    lblBust.Caption = ""
    
End Sub

Private Sub readINI()
    Dim card As Integer

    mBank = GetIni("BlackJack", "Bank")
    If Not IsNumeric(mBank) Then mBank = 500

    mDealerWins = GetIni("BlackJack", "DealerWins")
    If Not IsNumeric(mDealerWins) Then mDealerWins = 0

    mPlayerWins = GetIni("BlackJack", "PlayerWins")
    If Not IsNumeric(mPlayerWins) Then mPlayerWins = 0

    mDraws = GetIni("BlackJack", "Draws")
    If Not IsNumeric(mDraws) Then mDraws = 0

    mBlackJacks = GetIni("BlackJack", "BlackJacks")
    If Not IsNumeric(mBlackJacks) Then mBlackJacks = 0

    mPlayerBusts = GetIni("BlackJack", "PlayerBusts")
    If Not IsNumeric(mPlayerBusts) Then mPlayerBusts = 0
    
    card = GetIni("BlackJack", "Deck")
    If Not IsNumeric(card) Then card = 65
    Deck1.ChangeCard = card
    Image1(55).Picture = Deck1.Picture
    imgMove(0).Picture = Deck1.Picture
    imgDeck.Picture = Deck1.Picture
        
    mDealerDraw = GetIni("Dealer", "Draw")
    If Not IsNumeric(mDealerDraw) Then mDealerDraw = 0

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

Private Sub AceCheck()
    Dim x As Integer
    Dim AceCount As Integer, AceCheck As Integer
    
    AceCount = 0
    mDealTotal = 0
    For x = 0 To 9
        AceCheck = 1
        If Image1(x).Tag = AceCheck Then
            AceCheck = 11
            Image1(x).Tag = AceCheck
        End If
        If Image1(x).Tag = "" Then
            'DON'T ADD
        Else
            mDealTotal = mDealTotal + Image1(x).Tag
        End If
    Next x
    
    '''' CHECK IF TOTAL > 21 IF THERE IS ACE ''''
    
    If mDealTotal > 21 Then
        For x = 0 To 9
            If Image1(x).Tag = 11 Then
                mDealTotal = mDealTotal - Int(10)
            End If
        Next x
    End If

End Sub

Private Sub DealerAceCheck()
    Dim x As Integer
    Dim AceCount As Integer, AceCheck As Integer
    
    AceCount = 0
    mCpumDealTotal = 0
    For x = 10 To 14
        AceCheck = 1
        If Image1(x).Tag = AceCheck Then
            AceCheck = 11
            Image1(x).Tag = AceCheck
        End If
        If Image1(x).Tag = "" Then
            'DON'T ADD
        Else
            mCpumDealTotal = mCpumDealTotal + Image1(x).Tag
        End If
    Next x
    
    '''' CHECK IF TOTAL > 21 IF THERE IS ACE ''''
    
    If mCpumDealTotal > 21 Then
        For x = 10 To 14
            If Image1(x).Tag = 11 Then
                mCpumDealTotal = mCpumDealTotal - Int(10)
            End If
        Next x
    End If

End Sub

Private Sub Timer2_Timer()
        
    mMoveLeft = (Image1(0).Left - 16) / 7
    mMoveTop = (Image1(0).Top - 24) / 7
    
    With imgMove(0)
        .Left = imgMove(0).Left + mMoveLeft
        .Top = imgMove(0).Top + mMoveTop
    End With

    mMoveCounterOne = mMoveCounterOne + 1
    mMoveCounterTwo = mMoveCounterTwo + 1
    
    If mMoveCounterTwo = 7 Then
        With imgMove(0)
            .Left = 16
            .Top = 24
        End With
    End If
    
    If mMoveCounterTwo = 14 Then
        Timer2.Enabled = False
        imgMove(0).Visible = False
        imgMove(0).Left = 16
        imgMove(0).Top = 24
        imgMove(0).Visible = True
        With imgMove(0)
            .Left = 16
            .Top = 24
        End With
        mMoveCounterOne = 0
        mMoveCounterTwo = 0
        imgMove(0).Visible = True
        Timer5.Enabled = True
    End If
    
End Sub

Private Sub Timer3_Timer()

    mMoveLeft = (Image1(0).Left - 16) / 7
    mMoveTop = (Image1(0).Top - 24) / 7
    
    With imgMove(0)
        .Left = imgMove(0).Left + mMoveLeft
        .Top = imgMove(0).Top + mMoveTop
    End With

    mMoveCounterOne = mMoveCounterOne + 1
    mMoveCounterTwo = mMoveCounterTwo + 1
    
    If mMoveCounterTwo = 7 Then
        Timer3.Enabled = False
        imgMove(0).Visible = False
        imgMove(0).Left = 16
        imgMove(0).Top = 24
        imgMove(0).Visible = True
        Call HitMeDeal
    End If

End Sub

Public Function ChangeBank()

    mBank = Int(frmBankChange.txtBank.Text)
    lblBank.Caption = FormatCurrency(mBank, 2)

End Function

Public Function ChangeDealerDraw()

    mDealerDraw = Int(frmSettings.txtDraw.Text)

End Function

Private Sub Timer4_Timer()
    
    lblTime = Format$(Hour(Now), "00") & ":" & _
              Format$(Minute(Now), "00") & ":" & _
              Format$(Second(Now), "00")
    
End Sub

Private Sub Timer5_Timer()
        
    mMoveLeft = (Image1(10).Left - 16) / 7
    mMoveTop = (Image1(10).Top - 24) / 7
    
    With imgMove(0)
        .Left = imgMove(0).Left + mMoveLeft
        .Top = imgMove(0).Top + mMoveTop
    End With

    mMoveCounterOne = mMoveCounterOne + 1
    mMoveCounterTwo = mMoveCounterTwo + 1
    
    If mMoveCounterTwo = 7 Then
        With imgMove(0)
            .Left = 16
            .Top = 24
        End With
    End If
    
    If mMoveCounterTwo = 14 Then
        Timer5.Enabled = False
        imgMove(0).Visible = False
        imgMove(0).Left = 16
        imgMove(0).Top = 24
        imgMove(0).Visible = True
        Call FirstDeal
    End If
    

End Sub

