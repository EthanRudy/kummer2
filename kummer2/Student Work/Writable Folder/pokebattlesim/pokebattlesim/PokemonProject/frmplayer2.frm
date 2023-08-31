VERSION 5.00
Begin VB.Form frmplayer2 
   BackColor       =   &H80000009&
   Caption         =   "Form2"
   ClientHeight    =   5685
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12405
   LinkTopic       =   "Form2"
   ScaleHeight     =   5685
   ScaleWidth      =   12405
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer3 
      Interval        =   1
      Left            =   2760
      Top             =   5160
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   3360
      Top             =   5160
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   3960
      Top             =   5160
   End
   Begin VB.CommandButton cmdstart 
      Caption         =   "Start Game"
      Height          =   255
      Left            =   4680
      TabIndex        =   8
      Top             =   5160
      Width           =   2175
   End
   Begin VB.Label lblmydef 
      Caption         =   "Label3"
      Height          =   255
      Left            =   7680
      TabIndex        =   7
      Top             =   3720
      Width           =   2415
   End
   Begin VB.Label lblmyat 
      Caption         =   "Label3"
      Height          =   255
      Left            =   7680
      TabIndex        =   6
      Top             =   3360
      Width           =   2415
   End
   Begin VB.Label lbltheirdefense 
      Caption         =   "Label3"
      Height          =   255
      Left            =   1560
      TabIndex        =   5
      Top             =   3600
      Width           =   2415
   End
   Begin VB.Label lbltheirattack 
      Caption         =   "Label3"
      Height          =   255
      Left            =   1560
      TabIndex        =   4
      Top             =   3240
      Width           =   2415
   End
   Begin VB.Image Image2 
      Height          =   1575
      Left            =   7680
      Top             =   1680
      Width           =   2415
   End
   Begin VB.Image Image1 
      Height          =   1575
      Left            =   1560
      Top             =   1560
      Width           =   2415
   End
   Begin VB.Label lblmypokemon 
      BackColor       =   &H80000009&
      Height          =   255
      Left            =   7800
      TabIndex        =   3
      Top             =   720
      Width           =   1935
   End
   Begin VB.Label lbltheirpokemon 
      BackColor       =   &H80000009&
      Height          =   255
      Left            =   1920
      TabIndex        =   2
      Top             =   720
      Width           =   1815
   End
   Begin VB.Label Label2 
      BackColor       =   &H80000009&
      Caption         =   "Player 2 Pokemon"
      Height          =   255
      Left            =   8040
      TabIndex        =   1
      Top             =   240
      Width           =   1455
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000009&
      Caption         =   "Player 1 Pokemon"
      Height          =   255
      Left            =   2160
      TabIndex        =   0
      Top             =   240
      Width           =   1455
   End
End
Attribute VB_Name = "frmplayer2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdstart_Click()
p2ready = "1"
Timer1.Enabled = True
End Sub

Private Sub Form_Load()
Timer3.Enabled = False
turnnum = 1
Timer2.Enabled = False
Timer1.Enabled = False
p2ready = 0
p1ready = 0
Dim myload As String
Dim theirload As String
Dim Path As String
Dim i As Integer
Path = "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt"
Open Path For Input As #1
Line Input #1, theirpokemon
Close #1
lbltheirpokemon.Caption = theirpokemon
lblmypokemon.Caption = mypokemon
myload = "\\Gk08\student work\Writable Folder\pokebattlesim\" + mypokemon + ".gif"
Image2.Picture = LoadPicture(myload)
theirload = "\\Gk08\student work\Writable Folder\pokebattlesim\" + theirpokemon + ".gif"
Image1.Picture = LoadPicture(theirload)
Randomize
myattack = Int(Rnd * 5000) + 2000
mydefense = Int(Rnd * 3000) + 1000
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2attack.txt" For Output As #1
    Print #1, myattack
Close #1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2defense.txt" For Output As #1
    Print #1, mydefense
Close #1
attackpath = "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt"
Open attackpath For Input As #1
Line Input #1, theirattack
Close #1
defensepath = "\\Gk08\student work\Writable Folder\pokebattlesim\p1defense.txt"
Open defensepath For Input As #1
Line Input #1, theirdefense
Close #1
lblmyat.Caption = myattack
lblmydef.Caption = mydefense
lbltheirattack.Caption = theirattack
lbltheirdefense.Caption = theirdefense
End Sub

Private Sub Timer1_Timer()
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2ready.txt" For Output As #1
    Print #1, p2ready
Close #1
readypath = "\\Gk08\student work\Writable Folder\pokebattlesim\p1ready.txt"
Open readypath For Input As #1
Line Input #1, p1ready
Close #1
If p1ready = 1 And p2ready = 1 Then
Timer2.Enabled = True
End If
End Sub

Private Sub Timer2_Timer()
Dim turnpath As String
turnpath = "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt"
Open turnpath For Input As #1
Line Input #1, turnnum
Close #1
If turnnum = 1 Then
    MsgBox "Player 1 is currently moving. Please wait for your turn"
End If
End Sub

Private Sub Timer3_Timer()
Dim attpath As String
attpath = "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt"
Open attpath For Input As #1
Line Input #1, theirattack
Close #1
lbltheirattack.Caption = theirattack
End Sub
