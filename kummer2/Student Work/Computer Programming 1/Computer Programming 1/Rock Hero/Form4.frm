VERSION 5.00
Begin VB.Form Form4 
   Caption         =   "ROCK HERO"
   ClientHeight    =   5385
   ClientLeft      =   4425
   ClientTop       =   3555
   ClientWidth     =   7455
   LinkTopic       =   "Form4"
   Picture         =   "Form4.frx":0000
   ScaleHeight     =   5385
   ScaleWidth      =   7455
   Begin VB.Timer Timer2 
      Interval        =   50
      Left            =   5400
      Top             =   3720
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   6000
      Top             =   3720
   End
   Begin VB.ComboBox cmbp 
      Height          =   315
      Left            =   960
      TabIndex        =   3
      Text            =   "Player"
      Top             =   3240
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox cmbGT 
      Height          =   315
      Left            =   960
      TabIndex        =   2
      Text            =   "Game Type"
      Top             =   2880
      Width           =   1215
   End
   Begin VB.ComboBox cmb1 
      Height          =   315
      Left            =   4920
      TabIndex        =   0
      Text            =   "Pick A Song"
      Top             =   2880
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label lblname 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "PRESENT"
      Height          =   495
      Index           =   2
      Left            =   3000
      TabIndex        =   7
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Label lblname 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "Michael Zhou"
      Height          =   495
      Index           =   1
      Left            =   6240
      TabIndex        =   6
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Label lblname 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "Kevin Bradley"
      Height          =   495
      Index           =   0
      Left            =   0
      TabIndex        =   5
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Label lblwait 
      AutoSize        =   -1  'True
      BackColor       =   &H80000009&
      Caption         =   "Waiting for player 1"
      Height          =   195
      Left            =   5040
      TabIndex        =   4
      Top             =   3000
      Visible         =   0   'False
      Width           =   1365
   End
   Begin VB.Label lblgo 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      Caption         =   "Start Rock Heroing"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Palatino Linotype"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3240
      TabIndex        =   1
      Top             =   2880
      Width           =   1335
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const SND_ASYNC = &H1
Const SND_LOOP = &H8
Const SND_NODEFAULT = &H2
Const SND_SYNC = &H0
Const SND_NOSTOP = &H10
Const SND_MEMORY = &H4
Private Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long 'Sound


Private Sub cmb1_Click()
If cmb1 = "guitarvspiano" Or cmb1 = "schoolout" Or cmb1 = "Sad Statue" Or cmb1 = "stormsand" Or cmb1 = "Basshunter - Dota" Or cmb1 = "300" Then

    If cmbGT = "Single" Then
        lblgo.Enabled = True
    End If
End If
End Sub

Private Sub cmbGT_Click()
If cmbGT = "Double" Then
    cmbp.Visible = True
Else
    cmbp.Visible = False
End If
If cmbGT = "Single" Then
    cmb1.Visible = True
    lblwait.Visible = False
Else
    cmb1.Visible = False
End If
End Sub

Private Sub cmbp_Click()
If cmbp = "1" Then
    cmb1.Visible = True
    lblwait.Visible = False
Else
    cmb1.Visible = False
    lblwait.Visible = True
    Open "\\Gk08\student work\this is not rockhero beta\ready.txt" For Output As #1
        Print #1, "Ready"
    Close #1
End If
If cmbp = "2" Then
    Timer1.Interval = 0
    lblgo.Enabled = False

End If
End Sub

Private Sub Form_Activate()
'sndPlaySound "E:\gmea\rb2.wav", SND_ASYNC
cmb1.Clear
cmbGT.Clear
cmbp.Clear
cmbGT = "Game Type"
cmb1 = "Pick A Song"
cmbp = "Player"
cmb1.AddItem "schoolout"
cmb1.AddItem "Sad Statue"
cmb1.AddItem "stormsand"
cmb1.AddItem "Basshunter - Dota"
cmb1.AddItem "guitarvspiano"
cmb1.AddItem "300"
sndPlaySound "\\Gk08\student work\this is not rockhero beta\rb2.wav", SND_ASYNC
cmbGT.AddItem "Single"
cmbGT.AddItem "Double"
cmbp.AddItem "1"
cmbp.AddItem "2"
End Sub

Private Sub Form_Unload(Cancel As Integer)
End
End Sub

Private Sub lblgo_Click()
On Error Resume Next
If cmbGT = "Single" Then
    gametype = 1
Else
    gametype = 2
End If
If cmbp = "1" Then
    playa = 1
ElseIf cmbp = "2" Then
    playa = 2
End If
song = cmb1
Open "\\Gk08\student work\this is not rockhero beta\ready.txt" For Output As #1
    Print #1, "start"
Close #1
If cmbp <> "2" Then


        Open "\\Gk08\student work\this is not rockhero beta\song.txt" For Output As #1
        Print #1, cmb1
        Close #1
End If
For x = 1 To 2
    Open "\\Gk08\student work\this is not rockhero beta\score" & x & ".txt" For Output As #1
        Print #1, "0"
    Close #1
Next x
Form4.Hide
Form3.Show
End Sub

Private Sub Timer1_Timer()
If cmbp = "1" Then
    
    Open "\\Gk08\student work\this is not rockhero beta\ready.txt" For Input As #1
        Input #1, reads
    Close #1
    reads = Trim(reads)
    If reads = "Ready" Then
        lblgo.Enabled = True
        Timer1.Interval = 0
    End If
End If
End Sub

Private Sub Timer2_Timer()
If cmbp = "2" Then
    Open "\\Gk08\student work\this is not rockhero beta\ready.txt" For Input As #1
        Input #1, reads
    Close #1
    reads = Trim(reads)
    If reads = "start" Then
        Open "\\Gk08\student work\this is not rockhero beta\ready.txt" For Output As #1
            Print #1, "not"
        Close #1
        lblgo.Enabled = True
        lblgo_Click
    End If
End If
End Sub
