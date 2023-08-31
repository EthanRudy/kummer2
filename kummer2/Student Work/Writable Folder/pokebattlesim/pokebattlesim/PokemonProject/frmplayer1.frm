VERSION 5.00
Begin VB.Form frmplayer1 
   BackColor       =   &H80000009&
   Caption         =   "Form1"
   ClientHeight    =   6810
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10005
   LinkTopic       =   "Form1"
   ScaleHeight     =   6810
   ScaleWidth      =   10005
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   5640
      Top             =   4320
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   3000
      Top             =   4320
   End
   Begin VB.CommandButton cmdstart 
      Caption         =   "Start Game"
      Height          =   255
      Left            =   3840
      TabIndex        =   6
      Top             =   4320
      Width           =   1575
   End
   Begin VB.Label move4 
      Caption         =   "Label1"
      Height          =   255
      Left            =   1800
      TabIndex        =   10
      Top             =   5280
      Width           =   1575
   End
   Begin VB.Label move3 
      Caption         =   "Label1"
      Height          =   255
      Left            =   240
      TabIndex        =   9
      Top             =   5280
      Width           =   1335
   End
   Begin VB.Label move2 
      Caption         =   "Label1"
      Height          =   255
      Left            =   1800
      TabIndex        =   8
      Top             =   4920
      Width           =   1575
   End
   Begin VB.Label move1 
      Caption         =   "Label1"
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   4920
      Width           =   1335
   End
   Begin VB.Label lbltheirdefense 
      Caption         =   "Label1"
      Height          =   255
      Left            =   6360
      TabIndex        =   5
      Top             =   3720
      Width           =   2175
   End
   Begin VB.Label lbltheirattack 
      Caption         =   "Label1"
      Height          =   255
      Left            =   6360
      TabIndex        =   4
      Top             =   3360
      Width           =   2175
   End
   Begin VB.Label lblmydef 
      Caption         =   "Label1"
      Height          =   255
      Left            =   600
      TabIndex        =   3
      Top             =   3840
      Width           =   2175
   End
   Begin VB.Label lblmyat 
      Caption         =   "Label1"
      Height          =   255
      Left            =   600
      TabIndex        =   2
      Top             =   3360
      Width           =   2175
   End
   Begin VB.Image Image2 
      Height          =   2295
      Left            =   5280
      Top             =   960
      Width           =   3855
   End
   Begin VB.Image Image1 
      Height          =   2295
      Left            =   480
      Top             =   960
      Width           =   3255
   End
   Begin VB.Label lbltheirpokemon 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "Label1"
      Height          =   375
      Left            =   6000
      TabIndex        =   1
      Top             =   120
      Width           =   2775
   End
   Begin VB.Label lblmypokemon 
      BackColor       =   &H80000009&
      Caption         =   "Label1"
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   120
      Width           =   1455
   End
End
Attribute VB_Name = "frmplayer1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdstart_Click()
p1ready = "1"
Timer1.Enabled = True
End Sub

Private Sub Form_Load()
turnnum = 1
Timer2.Enabled = False
p2ready = 0
p1ready = 0
Timer1.Enabled = False
Dim myload As String
Dim theirload As String
Dim Path As String
Dim i As Integer
Path = "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt"
Open Path For Input As #1
Line Input #1, theirpokemon
Close #1
lbltheirpokemon.Caption = theirpokemon
lblmypokemon.Caption = mypokemon
myload = "\\Gk08\student work\Writable Folder\pokebattlesim\" + mypokemon + ".gif"
Image1.Picture = LoadPicture(myload)
theirload = "\\Gk08\student work\Writable Folder\pokebattlesim\" + theirpokemon + ".gif"
Image2.Picture = LoadPicture(theirload)
Randomize
myattack = Int(Rnd * 5000) + 2000
mydefense = Int(Rnd * 3000) + 1000
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt" For Output As #1
    Print #1, myattack
Close #1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1defense.txt" For Output As #1
    Print #1, mydefense
Close #1
attackpath = "\\Gk08\student work\Writable Folder\pokebattlesim\p2attack.txt"
Open attackpath For Input As #1
Line Input #1, theirattack
Close #1
defensepath = "\\Gk08\student work\Writable Folder\pokebattlesim\p2defense.txt"
Open defensepath For Input As #1
Line Input #1, theirdefense
Close #1
lblmyat.Caption = myattack
lblmydef.Caption = mydefense
lbltheirattack.Caption = theirattack
lbltheirdefense.Caption = theirdefense
End Sub

Private Sub move1_Click()
myattack = myattack - 250
lblmyat.Caption = myattack
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt" For Output As #1
    Print #1, myattack
Close #1
theirdefense = theirdefense - 250
lbltheirdefense.Caption = theirdefense
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2defense.txt" For Output As #1
    Print #1, theirdefense
Close #1
End Sub

Private Sub Timer1_Timer()
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1ready.txt" For Output As #1
    Print #1, p1ready
Close #1
readypath = "\\Gk08\student work\Writable Folder\pokebattlesim\p2ready.txt"
Open readypath For Input As #1
Line Input #1, p2ready
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
If turnnum = 2 Then
    MsgBox "Player 2 is currently moving. Please wait for your turn"
End If
If turnnum = 1 Then
    If mypokemon = "bulbasaur" Then
        move1.Caption = "Leaf Storm"
        move2.Caption = "Leech Life"
        move3.Caption = "Vine Whip"
        move4.Caption = "Grass Attack"
    End If
End If
End Sub
