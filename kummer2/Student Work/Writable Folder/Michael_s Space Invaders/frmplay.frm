VERSION 5.00
Begin VB.Form frmplay 
   BackColor       =   &H80000012&
   Caption         =   "Space Invaders"
   ClientHeight    =   8835
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   13020
   LinkTopic       =   "Form1"
   ScaleHeight     =   8835
   ScaleWidth      =   13020
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Timer tmrnuke 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   11280
      Top             =   3480
   End
   Begin VB.Timer tmrmothershipbonus 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   11280
      Top             =   4080
   End
   Begin VB.Timer tmrmothershipmove 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   11280
      Top             =   4680
   End
   Begin VB.Timer tmrmothership 
      Interval        =   10000
      Left            =   11280
      Top             =   5280
   End
   Begin VB.Timer tmrtime 
      Interval        =   1000
      Left            =   11280
      Top             =   5880
   End
   Begin VB.Frame fraend 
      BackColor       =   &H00FF0000&
      ForeColor       =   &H8000000E&
      Height          =   4935
      Left            =   4200
      TabIndex        =   4
      Top             =   1680
      Visible         =   0   'False
      Width           =   4335
      Begin VB.CommandButton CmdQuit 
         Caption         =   "Better Luck Next Time!"
         Height          =   495
         Left            =   360
         TabIndex        =   12
         Top             =   4320
         Width           =   3615
      End
      Begin VB.Label lblyoubeat 
         BackColor       =   &H0000FF00&
         Caption         =   "The highscore is:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   1080
         TabIndex        =   16
         Top             =   3360
         Width           =   1935
      End
      Begin VB.Label lblfinalscore 
         BackColor       =   &H00FF0000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   495
         Left            =   1920
         TabIndex        =   11
         Top             =   2760
         Width           =   1695
      End
      Begin VB.Label Label6 
         BackColor       =   &H00FF0000&
         Caption         =   "Final Score: "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   495
         Left            =   240
         TabIndex        =   10
         Top             =   2760
         Width           =   1815
      End
      Begin VB.Label lblaccuracy 
         BackColor       =   &H00FF0000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   495
         Left            =   1800
         TabIndex        =   9
         Top             =   1800
         Width           =   2415
      End
      Begin VB.Label lbltime 
         BackColor       =   &H00FF0000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   495
         Left            =   1560
         TabIndex        =   8
         Top             =   840
         Width           =   2655
      End
      Begin VB.Label lblyouwin 
         BackColor       =   &H00FF0000&
         Caption         =   "You Win!"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   495
         Left            =   1320
         TabIndex        =   7
         Top             =   240
         Width           =   1935
      End
      Begin VB.Label Label4 
         BackColor       =   &H00FF0000&
         Caption         =   "Accuracy: "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   495
         Left            =   360
         TabIndex        =   6
         Top             =   1800
         Width           =   1815
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FF0000&
         Caption         =   "Time:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   495
         Left            =   360
         TabIndex        =   5
         Top             =   840
         Width           =   1695
      End
   End
   Begin VB.Timer tmrinvaders 
      Interval        =   50
      Left            =   11280
      Top             =   6480
   End
   Begin VB.Timer tmrmissle 
      Interval        =   21
      Left            =   11280
      Top             =   7080
   End
   Begin VB.Timer tmrshipmove 
      Interval        =   21
      Left            =   11280
      Top             =   7680
   End
   Begin VB.Label lblmothershipbonus 
      BackColor       =   &H80000007&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Agency FB"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   -5000
      TabIndex        =   15
      Top             =   -1000
      Width           =   1215
   End
   Begin VB.Label Label7 
      BackColor       =   &H80000007&
      Caption         =   "Time:"
      BeginProperty Font 
         Name            =   "Agency FB"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   375
      Left            =   9240
      TabIndex        =   14
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label lblgametime 
      BackColor       =   &H80000007&
      BeginProperty Font 
         Name            =   "Agency FB"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   9240
      TabIndex        =   13
      Top             =   720
      Width           =   1215
   End
   Begin VB.Image imgmothership 
      Height          =   810
      Left            =   1320
      Picture         =   "frmplay.frx":0000
      Top             =   5400
      Visible         =   0   'False
      Width           =   1080
   End
   Begin VB.Label lblscore 
      BackColor       =   &H80000007&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Agency FB"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   5400
      TabIndex        =   3
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label lblhighscore 
      BackColor       =   &H80000007&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Agency FB"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   2760
      TabIndex        =   2
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label2 
      BackColor       =   &H80000007&
      Caption         =   "Score"
      BeginProperty Font 
         Name            =   "Agency FB"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   375
      Left            =   5400
      TabIndex        =   1
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000007&
      Caption         =   "High Score"
      BeginProperty Font 
         Name            =   "Agency FB"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   2760
      TabIndex        =   0
      Top             =   360
      Width           =   1215
   End
   Begin VB.Image imgmissle 
      Height          =   375
      Left            =   6360
      Top             =   7680
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Image imgship 
      Height          =   390
      Left            =   6120
      Picture         =   "frmplay.frx":2DD2
      Top             =   8040
      Width           =   600
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   47
      Left            =   9360
      Picture         =   "frmplay.frx":3A44
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   46
      Left            =   8760
      Picture         =   "frmplay.frx":3F96
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   45
      Left            =   8160
      Picture         =   "frmplay.frx":44E8
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   44
      Left            =   7560
      Picture         =   "frmplay.frx":4A3A
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   43
      Left            =   6960
      Picture         =   "frmplay.frx":4F8C
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   42
      Left            =   6360
      Picture         =   "frmplay.frx":54DE
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   41
      Left            =   9360
      Picture         =   "frmplay.frx":5A30
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   40
      Left            =   8760
      Picture         =   "frmplay.frx":5F82
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   39
      Left            =   8160
      Picture         =   "frmplay.frx":64D4
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   38
      Left            =   7560
      Picture         =   "frmplay.frx":6A26
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   37
      Left            =   6960
      Picture         =   "frmplay.frx":6F78
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   36
      Left            =   6360
      Picture         =   "frmplay.frx":74CA
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   35
      Left            =   9360
      Picture         =   "frmplay.frx":7A1C
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   34
      Left            =   8760
      Picture         =   "frmplay.frx":7F6E
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   33
      Left            =   8160
      Picture         =   "frmplay.frx":84C0
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   32
      Left            =   7560
      Picture         =   "frmplay.frx":8A12
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   31
      Left            =   6960
      Picture         =   "frmplay.frx":8F64
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   30
      Left            =   6360
      Picture         =   "frmplay.frx":94B6
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   29
      Left            =   5760
      Picture         =   "frmplay.frx":9A08
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   28
      Left            =   5160
      Picture         =   "frmplay.frx":9F5A
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   27
      Left            =   4560
      Picture         =   "frmplay.frx":A4AC
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   26
      Left            =   3960
      Picture         =   "frmplay.frx":A9FE
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   25
      Left            =   3360
      Picture         =   "frmplay.frx":AF50
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   24
      Left            =   2760
      Picture         =   "frmplay.frx":B4A2
      Top             =   3600
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   23
      Left            =   5760
      Picture         =   "frmplay.frx":B9F4
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   22
      Left            =   5160
      Picture         =   "frmplay.frx":BF46
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   21
      Left            =   4560
      Picture         =   "frmplay.frx":C498
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   20
      Left            =   3960
      Picture         =   "frmplay.frx":C9EA
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   19
      Left            =   3360
      Picture         =   "frmplay.frx":CF3C
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   18
      Left            =   2760
      Picture         =   "frmplay.frx":D48E
      Top             =   3120
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   17
      Left            =   5760
      Picture         =   "frmplay.frx":D9E0
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   16
      Left            =   5160
      Picture         =   "frmplay.frx":DF32
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   15
      Left            =   4560
      Picture         =   "frmplay.frx":E484
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   14
      Left            =   3960
      Picture         =   "frmplay.frx":E9D6
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   13
      Left            =   3360
      Picture         =   "frmplay.frx":EF28
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   12
      Left            =   2760
      Picture         =   "frmplay.frx":F47A
      Top             =   2640
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   11
      Left            =   9360
      Picture         =   "frmplay.frx":F9CC
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   10
      Left            =   8760
      Picture         =   "frmplay.frx":FF1E
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   9
      Left            =   8160
      Picture         =   "frmplay.frx":10470
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   8
      Left            =   7560
      Picture         =   "frmplay.frx":109C2
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   7
      Left            =   6960
      Picture         =   "frmplay.frx":10F14
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   6
      Left            =   6360
      Picture         =   "frmplay.frx":11466
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   5
      Left            =   5760
      Picture         =   "frmplay.frx":119B8
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   4
      Left            =   5160
      Picture         =   "frmplay.frx":11F0A
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   3
      Left            =   4560
      Picture         =   "frmplay.frx":1245C
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   2
      Left            =   3960
      Picture         =   "frmplay.frx":129AE
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   1
      Left            =   3360
      Picture         =   "frmplay.frx":12F00
      Top             =   2160
      Width           =   360
   End
   Begin VB.Image imginvader 
      Height          =   270
      Index           =   0
      Left            =   2760
      Picture         =   "frmplay.frx":13452
      Top             =   2160
      Width           =   360
   End
End
Attribute VB_Name = "frmplay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim bsx As Integer
Dim rsy As Integer
Dim isx As Integer
Dim iss As Single
Dim isf As Single
Dim stopmove(47) As Integer
Dim score As Integer
Dim time As Integer
Dim timestring As String
Dim minutes As String
Dim seconds As String
Dim totalrockets As Integer
Dim totalhit As Integer
Dim accuracystring As String
Dim accuracy As Integer
Dim totalscore As Integer
Dim accuracybonus As Integer
Dim timebonus As Integer
Dim accuracybonuss As String
Dim timebonuss As String
Dim motherships As Integer
Dim mothershipbonus As Integer
Dim path As String
Dim missle As Integer
Dim nuke As Integer
Dim nukelefts(6) As Integer
Dim nukewidths(6) As Integer
Dim nuketops(6) As Integer
Dim nukeheights(6) As Integer

Private Sub CmdQuit_Click()
End
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyLeft Then
    If imgship.Left > 500 Then
        bsx = -1.5
    Else
        bsx = 0
    End If
ElseIf KeyCode = vbKeyRight Then
    If imgship.Left + imgship.Width + 500 < Width Then
        bsx = 1.5
    Else
        bsx = 0
    End If
ElseIf KeyCode = vbKeySpace Then
    If missle = 1 Then
        imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\Stun missle.gif")
    ElseIf missle = 0 Then
        imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\missle.gif")
    ElseIf missle = 2 Then
        imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\nuke.gif")
    End If
    imgmissle.Move imgship.Left + 300, imgship.Top - 250
    rsy = -1.5
    imgmissle.Visible = True
    totalrockets = totalrockets + 1
ElseIf KeyCode = vbKeyShift Then
    If missle = 0 Then
        missle = 1
    ElseIf missle = 1 And nuke <> 6 Then
        missle = 2
    ElseIf missle = 1 And nuke = 6 Then
        missle = 0
    ElseIf missle = 2 Then
        missle = 0
    End If
End If
End Sub


Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
bsx = 0
End Sub

Private Sub Form_Load()
Dim z As Integer
Dim strline As String
missle = 0
bsx = 0
isx = 1
iss = 40
isf = 1
For z = 0 To 47
    stopmove(z) = 0
Next z
imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\missle.gif")
path = "\\Gk08\student work\Writable Folder\Michael's Space Invaders\Highscore.txt"
Open path For Input As #1
Line Input #1, strline
strline = Trim$(strline)
If Len(strline) <> 0 Then lblhighscore = strline
Close #1
End Sub


Private Sub tmrinvaders_Timer()
Dim k As Integer
Dim p As Integer
For j = 0 To 47
    If stopmove(j) = 0 Then
    imginvader.Item(j).Move imginvader.Item(j).Left + isx * (iss * isf)
    End If
    If imginvader.Item(j).Left + imginvader.Item(j).Width + 500 > Width Or imginvader.Item(j).Left < 500 Then
        isx = isx * -1
        For k = 0 To 47
            If stopmove(k) = 0 Then
                imginvader.Item(k).Move imginvader.Item(k).Left, imginvader.Item(k).Top + imginvader.Item(k).Height * 1.25
                isf = isf * 1.00325
            End If
        Next k
    End If
Next j
For p = 0 To 47
    If imginvader.Item(p).Top + imginvader.Item(p).Height >= imgship.Top + imgship.Height Then
        fraend.Visible = True
        minutes = Int(time / 60)
        seconds = time Mod 60
        timestring = minutes + ":" + seconds
        lbltime = timestring + vbTab + "+0"
        accuracy = Int((totalhit / totalrockets) * 100)
        accuracystring = accuracy
        lblaccuracy = accuracystring + "%" + vbTab + "+0"
        accuracybonus = 0
        timebonus = 0
        finalscore = score + accuracybonus + timebonus
        lblfinalscore = finalscore
        lblyouwin = "You lose!"
        lblyoubeat = "The highscore is: " + lblhighscore
        motherships = 1
        lblscore = finalscore
        For o = 0 To 47
            stopmove(o) = 1
        Next o
    End If
Next p
End Sub

Private Sub tmrmissle_Timer()
Dim test As Integer
Dim test1 As Integer
imgmissle.Move imgmissle.Left, imgmissle.Top + rsy * 100
For test = 0 To 47
    If imginvader.Item(test).Visible = False Then test1 = test1 + 1
Next test
lblgametime = timestring
minutes = Int(time / 60)
seconds = time Mod 60
timestring = minutes + ":" + seconds
If test1 = 48 Then
    fraend.Visible = True
    accuracy = Int((totalhit / totalrockets) * 100)
    accuracystring = accuracy
    If accuracy > 1 And accuracy < 11 Then
        accuracybonus = 0
    ElseIf accuracy > 11 And accuracy < 21 Then
        accuracybonus = 50
    ElseIf accuracy > 21 And accuracy < 31 Then
        accuracybonus = 110
    ElseIf accuracy > 31 And accuracy < 41 Then
        accuracybonus = 180
    ElseIf accuracy > 41 And accuracy < 51 Then
        accuracybonus = 260
    ElseIf accuracy > 51 And accuracy < 61 Then
        accuracybonus = 400
    ElseIf accuracy > 61 And accuracy < 71 Then
        accuracybonus = 625
    ElseIf accuracy > 71 And accuracy < 81 Then
        accuracybonus = 900
    ElseIf accuracy > 81 And accuracy < 91 Then
        accuracybonus = 1200
    ElseIf accuracy > 91 And accuracy < 100 Then
        accuracybonus = 1500
    ElseIf accuracy = 100 Then
        accuracybonus = 2500
    End If
    If time > 120 Then
        timebonus = 0
    ElseIf time > 90 And time < 120 Then
        timebonus = 125
    ElseIf time > 75 And time < 90 Then
        timebonus = 250
    ElseIf time > 55 And time < 75 Then
        timebonus = 500
    ElseIf time > 40 And time < 55 Then
        timebonus = 875
    ElseIf time > 30 And time < 40 Then
        timebonus = 1500
    ElseIf time < 30 Then
        timebonus = 2500
    End If
    timebonuss = timebonus
    accuracybonuss = accuracybonus
    finalscore = score + accuracybonus + timebonus
    lbltime = timestring + "        +" + timebonuss
    lblaccuracy = accuracystring + "%" + "        +" + accuracybonuss
    lblfinalscore = finalscore
    motherships = 1
    lblyoubeat = "The highscore is: " + lblhighscore.Caption
End If
End Sub

Private Sub tmrmothership_Timer()
Randomize
Mothership = (Rnd * 100)
If Mothership < 33 And motherships = 0 Then
    tmrmothershipmove.Enabled = True
    imgmothership.Visible = True
    motherships = 1
    imgmothership.Move 0, 1440
End If
End Sub

Private Sub tmrmothershipbonus_Timer()
lblmothershipbonus.Visible = False
lblmothershipbonus.Move -5000, -1000
End Sub

Private Sub tmrmothershipmove_Timer()
imgmothership.Move imgmothership.Left + 80, imgmothership.Top
If imgmissle.Top < imgmothership.Top + imgmothership.Height And imgmissle.Top > imgmothership.Top + imgmothership.Height - 500 And imgmissle.Left > imgmothership.Left And imgmissle.Left + imgmissle.Width < imgmothership.Left + imgmothership.Width Then
    Randomize
    mothershipbonus = (Rnd * 1900) + 100
    Dim mothershipbonuss As String
    mothershipbonuss = mothershipbonus
    lblmothershipbonus = "+" + mothershipbonuss + "!"
    lblmothershipbonus.Move imgmothership.Left, imgmothership.Top
    tmrmothershipbonus.Enabled = True
    imgmothership.Move Width + 500, imgmothership.Top
    imgmissle.Visible = False
    score = score + mothershipbonus
    lblscore = score
    totalhit = totalhit + 1
End If
End Sub

Private Sub tmrnuke_Timer()
nuke = nuke + 1
If nuke = 0 Then
    nukelefts(0) = imgmissle.Left
    nukewidths(0) = imgmissle.Width
    nuketops(0) = imgmissle.Top
    nukeheights(0) = imgmissle.Height
    imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\nuke2.gif")
    imgmissle.Move imgmissle.Left - (imgmissle.Left + ((imgmissle.Width) / 2) - (nukelefts(0) + (nukewidths(0)) / 2)), imgmissle.Top + (imgmissle.Top - ((imgmissle.Height) / 2) - (nuketops(0) - (nukeheights(0)) / 2))
ElseIf nuke = 1 Then
    nukelefts(1) = imgmissle.Left
    nukewidths(1) = imgmissle.Width
    nuketops(1) = imgmissle.Top
    nukeheights(1) = imgmissle.Height
    imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\nuke3.gif")
    imgmissle.Move imgmissle.Left - (imgmissle.Left + ((imgmissle.Width) / 2) - (nukelefts(1) + (nukewidths(1)) / 2)), imgmissle.Top + (imgmissle.Top - ((imgmissle.Height) / 2) - (nuketops(1) - (nukeheights(1)) / 2))
ElseIf nuke = 2 Then
    nukelefts(2) = imgmissle.Left
    nukewidths(2) = imgmissle.Width
    nuketops(2) = imgmissle.Top
    nukeheights(2) = imgmissle.Height
    imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\nuke4.gif")
    imgmissle.Move imgmissle.Left - (imgmissle.Left + ((imgmissle.Width) / 2) - (nukelefts(2) + (nukewidths(2)) / 2)), imgmissle.Top + (imgmissle.Top - ((imgmissle.Height) / 2) - (nuketops(2) - (nukeheights(2)) / 2))
ElseIf nuke = 3 Then
    nukelefts(3) = imgmissle.Left
    nukewidths(3) = imgmissle.Width
    nuketops(3) = imgmissle.Top
    nukeheights(3) = imgmissle.Height
    imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\nuke5.gif")
    imgmissle.Move imgmissle.Left - (imgmissle.Left + ((imgmissle.Width) / 2) - (nukelefts(3) + (nukewidths(3)) / 2)), imgmissle.Top + (imgmissle.Top - ((imgmissle.Height) / 2) - (nuketops(3) - (nukeheights(3)) / 2))
ElseIf nuke = 4 Then
    nukelefts(4) = imgmissle.Left
    nukewidths(4) = imgmissle.Width
    nuketops(4) = imgmissle.Top
    nukeheights(4) = imgmissle.Height
    imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\nuke6.gif")
    imgmissle.Move imgmissle.Left - (imgmissle.Left + ((imgmissle.Width) / 2) - (nukelefts(4) + (nukewidths(4)) / 2)), imgmissle.Top + (imgmissle.Top - ((imgmissle.Height) / 2) - (nuketops(4) - (nukeheights(4)) / 2))
ElseIf nuke = 5 Then
    nukelefts(5) = imgmissle.Left
    nukewidths(5) = imgmissle.Width
    nuketops(5) = imgmissle.Top
    nukeheights(5) = imgmissle.Height
    imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\nuke7.gif")
    imgmissle.Move imgmissle.Left - (imgmissle.Left + ((imgmissle.Width) / 2) - (nukelefts(5) + (nukewidths(5)) / 2)), imgmissle.Top + (imgmissle.Top - ((imgmissle.Height) / 2) - (nuketops(5) - (nukeheights(5)) / 2))
ElseIf nuke = 6 Then
    nukelefts(6) = imgmissle.Left
    nukewidths(6) = imgmissle.Width
    nuketops(6) = imgmissle.Top
    nukeheights(6) = imgmissle.Height
    imgmissle.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Michael's Space Invaders\nuke8.gif")
    imgmissle.Move imgmissle.Left - (imgmissle.Left + ((imgmissle.Width) / 2) - (nukelefts(6) + (nukewidths(6)) / 2)), imgmissle.Top + (imgmissle.Top - ((imgmissle.Height) / 2) - (nuketops(6) - (nukeheights(6)) / 2))
    For q = 0 To 47
        If (Sqr(((imginvader.Item(q).Left - imgmissle.Left) ^ 2) + (imgmissle.Top - imginvader.Item(q).Top) ^ 2)) < 1250 Then
            imginvader.Item(q).Visible = False
            imginvader.Item(q).Move 6000, -8500
            stopmove(q) = 1
            iss = iss * 1.00265
            score = Val(lblscore)
            score = score + 100
            totalrockets = totalrockets + 1
            totalhit = totalhit + 1
            lblscore = score
        End If
    Next q
    tmrnuke.Enabled = False
    imgmissle.Move -6000, -8000
    missle = 0
End If
End Sub

Private Sub tmrshipmove_Timer()
imgship.Move imgship.Left + bsx * 80, imgship.Top
If imgmissle.Top < 0 Then
    imgmissle.Move imgship.Left + 250, imgship.Top - 250
    rsy = 0
    imgmissle.Visible = False
End If
Dim i As Integer
For i = 0 To 47
    If imgmissle.Top < imginvader.Item(i).Top + imginvader.Item(i).Height And imgmissle.Top > (imginvader.Item(i).Top + imginvader.Item(i).Height) - 500 And imgmissle.Left > imginvader.Item(i).Left And imgmissle.Left < imginvader.Item(i).Left + imginvader.Item(i).Width Then
        If missle = 0 Then
            imginvader.Item(i).Visible = False
            imginvader.Item(i).Move 6000, -8500
            imgmissle.Visible = False
            imgmissle.Move 50, 50
            stopmove(i) = 1
            iss = iss * 1.00265
            score = Val(lblscore)
            score = score + 100
            totalhit = totalhit + 1
            lblscore = score
        ElseIf missle = 1 Then
            imgmissle.Visible = False
            imgmissle.Move 50, 50
            stopmove(i) = 1
            totalhit = totalhit + 1
        ElseIf missle = 2 Then
            rsy = 0
            tmrnuke.Enabled = True
        End If
    End If
Next i
End Sub

Private Sub tmrtime_Timer()
If fraend.Visible = False Then
    time = time + 1
End If
End Sub
