VERSION 5.00
Begin VB.Form frmplayer2 
   BackColor       =   &H0000FF00&
   Caption         =   "Form2"
   ClientHeight    =   7950
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12285
   LinkTopic       =   "Form2"
   MousePointer    =   2  'Cross
   ScaleHeight     =   7950
   ScaleWidth      =   12285
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer4 
      Interval        =   1
      Left            =   4560
      Top             =   120
   End
   Begin VB.Timer Timer3 
      Interval        =   1
      Left            =   5280
      Top             =   120
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   5880
      Top             =   120
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   6480
      Top             =   120
   End
   Begin VB.Line Line14 
      X1              =   6840
      X2              =   6840
      Y1              =   5040
      Y2              =   6480
   End
   Begin VB.Line Line13 
      X1              =   5280
      X2              =   5280
      Y1              =   5040
      Y2              =   6480
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "CHOOSE YOUR ATTACK => "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   840
      TabIndex        =   14
      Top             =   6960
      Width           =   5895
   End
   Begin VB.Line Line12 
      X1              =   9240
      X2              =   9240
      Y1              =   5040
      Y2              =   6480
   End
   Begin VB.Line Line11 
      X1              =   2400
      X2              =   2400
      Y1              =   5040
      Y2              =   6480
   End
   Begin VB.Line Line10 
      X1              =   9480
      X2              =   9480
      Y1              =   6480
      Y2              =   7920
   End
   Begin VB.Line Line9 
      X1              =   7560
      X2              =   11400
      Y1              =   7200
      Y2              =   7200
   End
   Begin VB.Line Line8 
      X1              =   11400
      X2              =   11400
      Y1              =   6480
      Y2              =   7920
   End
   Begin VB.Line Line7 
      X1              =   7560
      X2              =   7560
      Y1              =   6480
      Y2              =   7920
   End
   Begin VB.Line Line6 
      X1              =   120
      X2              =   12120
      Y1              =   6480
      Y2              =   6480
   End
   Begin VB.Line Line5 
      X1              =   12120
      X2              =   120
      Y1              =   7920
      Y2              =   7920
   End
   Begin VB.Line Line4 
      X1              =   120
      X2              =   120
      Y1              =   7920
      Y2              =   5040
   End
   Begin VB.Line Line3 
      X1              =   12120
      X2              =   12120
      Y1              =   7920
      Y2              =   5040
   End
   Begin VB.Line Line2 
      X1              =   120
      X2              =   12120
      Y1              =   5040
      Y2              =   5040
   End
   Begin VB.Line Line1 
      X1              =   120
      X2              =   12120
      Y1              =   5760
      Y2              =   5760
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "POKEMON HP:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   9480
      MousePointer    =   2  'Cross
      TabIndex        =   13
      Top             =   5280
      Width           =   2415
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "POKEMON PP:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   6960
      MousePointer    =   2  'Cross
      TabIndex        =   12
      Top             =   5280
      Width           =   2175
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "ENEMY POKEMON HP:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   2640
      MousePointer    =   2  'Cross
      TabIndex        =   11
      Top             =   5280
      Width           =   2415
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "ENEMY POKEMON PP:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   240
      MousePointer    =   2  'Cross
      TabIndex        =   10
      Top             =   5280
      Width           =   2055
   End
   Begin VB.Label move4 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "Label3"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   9600
      MousePointer    =   2  'Cross
      TabIndex        =   9
      Top             =   7320
      Width           =   1575
   End
   Begin VB.Label move3 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "Label3"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   7800
      MousePointer    =   2  'Cross
      TabIndex        =   8
      Top             =   7320
      Width           =   1575
   End
   Begin VB.Label move2 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "Label3"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   9600
      MousePointer    =   2  'Cross
      TabIndex        =   7
      Top             =   6720
      Width           =   1575
   End
   Begin VB.Label move1 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "Label3"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   7800
      MousePointer    =   2  'Cross
      TabIndex        =   6
      Top             =   6720
      Width           =   1575
   End
   Begin VB.Label lblmydef 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "Label3"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   9480
      MousePointer    =   2  'Cross
      TabIndex        =   5
      Top             =   6000
      Width           =   2415
   End
   Begin VB.Label lblmyat 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "Label3"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   6960
      MousePointer    =   2  'Cross
      TabIndex        =   4
      Top             =   6000
      Width           =   2175
   End
   Begin VB.Label lbltheirdefense 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "Label3"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   2640
      MousePointer    =   2  'Cross
      TabIndex        =   3
      Top             =   6000
      Width           =   2415
   End
   Begin VB.Label lbltheirattack 
      Alignment       =   2  'Center
      BackColor       =   &H0000FF00&
      Caption         =   "Label3"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   240
      MousePointer    =   2  'Cross
      TabIndex        =   2
      Top             =   6000
      Width           =   2055
   End
   Begin VB.Image Image2 
      Height          =   1575
      Left            =   8280
      Top             =   960
      Width           =   2415
   End
   Begin VB.Image Image1 
      Height          =   1575
      Left            =   960
      MousePointer    =   2  'Cross
      Top             =   960
      Width           =   2415
   End
   Begin VB.Label lblmypokemon 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   615
      Left            =   8400
      TabIndex        =   1
      Top             =   240
      Width           =   2895
   End
   Begin VB.Label lbltheirpokemon 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   615
      Left            =   1080
      TabIndex        =   0
      Top             =   240
      Width           =   2895
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
Timer2.Enabled = True
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

Private Sub move1_Click()
myattack = myattack - 250
lblmyat.Caption = myattack
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2attack.txt" For Output As #1
    Print #1, myattack
Close #1
theirdefense = theirdefense - 250
lbltheirdefense.Caption = theirdefense
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1defense.txt" For Output As #1
    Print #1, theirdefense
Close #1
Dim msgboxstring
msgboxstring = "You have lost 250 attack." + theirpokemon + " has lost 250 defense."
MsgBox msgboxstring
turnnum = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt" For Output As #1
    Print #1, turnnum
Close #1
End Sub

Private Sub move2_Click()
myattack = myattack - 500
lblmyat.Caption = myattack
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2attack.txt" For Output As #1
    Print #1, myattack
Close #1
theirdefense = theirdefense - 150
lbltheirdefense.Caption = theirdefense
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1defense.txt" For Output As #1
    Print #1, theirdefense
Close #1
Dim msgboxstring
msgboxstring = "You have lost 500 attack." + theirpokemon + " has lost 150 defense."
MsgBox msgboxstring
turnnum = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt" For Output As #1
    Print #1, turnnum
Close #1
End Sub

Private Sub move3_Click()
myattack = myattack - 274
lblmyat.Caption = myattack
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2attack.txt" For Output As #1
    Print #1, myattack
Close #1
theirdefense = theirdefense - 504
lbltheirdefense.Caption = theirdefense
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1defense.txt" For Output As #1
    Print #1, theirdefense
Close #1
Dim msgboxstring
msgboxstring = "You have lost 274 attack." + theirpokemon + " has lost 504 defense."
MsgBox msgboxstring
turnnum = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt" For Output As #1
    Print #1, turnnum
Close #1
End Sub

Private Sub move4_Click()
myattack = myattack - 456
lblmyat.Caption = myattack
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2attack.txt" For Output As #1
    Print #1, myattack
Close #1
theirdefense = theirdefense - 713
lbltheirdefense.Caption = theirdefense
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1defense.txt" For Output As #1
    Print #1, theirdefense
Close #1
Dim msgboxstring
msgboxstring = "You have lost 456 attack." + theirpokemon + " has lost 713 defense."
MsgBox msgboxstring
turnnum = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt" For Output As #1
    Print #1, turnnum
Close #1
End Sub

Private Sub Timer1_Timer()
'Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2ready.txt" For Output As #1
 '   Print #1, p2ready
''Close #1
'readypath = "\\Gk08\student work\Writable Folder\pokebattlesim\p1ready.txt"
'Open readypath For Input As #1
'Line Input #1, p1ready
'Close #1
'If p1ready = 1 And p2ready = 1 Then

'End If
End Sub

Private Sub Timer2_Timer()
If turnnum = 1 Then
Timer3.Enabled = True
    MsgBox "Player 1 is currently moving. Please wait for your turn"
End If
If turnnum = 2 Then
    If mypokemon = "bulbasaur" Then
        move1.Caption = "Leaf Storm"
        move2.Caption = "Leech Life"
        move3.Caption = "Vine Whip"
        move4.Caption = "Grass Attack"
    End If
    If mypokemon = "charmander" Then
        move1.Caption = "Ember"
        move2.Caption = "Dig"
        move3.Caption = "Tackle"
        move4.Caption = "Scratch"
    End If
    If mypokemon = "chikarita" Then
        move1.Caption = "Giga Drain"
        move2.Caption = "Solar beam"
        move3.Caption = "Vine Whip"
        move4.Caption = "Razor Leaf"
    End If
    If mypokemon = "chimchar" Then
        move1.Caption = "ember"
        move2.Caption = "Double scratch"
        move3.Caption = "Flame wheel"
        move4.Caption = "Fire Spin"
    End If
    If mypokemon = "cyndaquil" Then
        move1.Caption = "Flame Thrower"
        move2.Caption = "Flame Wheel"
        move3.Caption = "Pound"
        move4.Caption = "BLAST BURN"
    End If
    If mypokemon = "mudkip" Then
        move1.Caption = "Surf"
        move2.Caption = "Mud Shot"
        move3.Caption = "Splash"
        move4.Caption = "Iron Tail"
    End If
    If mypokemon = "piplup" Then
        move1.Caption = "Bubble"
        move2.Caption = "Pound"
        move3.Caption = "Tailwhip"
        move4.Caption = "Bubble Beam"
    End If
    If mypokemon = "squirtle" Then
        move1.Caption = "Hydro Pump"
        move2.Caption = "Water Gun"
        move3.Caption = "Tackle"
        move4.Caption = "Bite"
    End If
    If mypokemon = "torchic" Then
        move1.Caption = "Scratch"
        move2.Caption = "Quick Attack"
        move3.Caption = "Ember"
        move4.Caption = "Fire Spin"
    End If
    If mypokemon = "totodile" Then
        move1.Caption = "Dive"
        move2.Caption = "Bubble Beam"
        move3.Caption = "Bite"
        move4.Caption = "Water gun"
    End If
    If mypokemon = "treecko" Then
        move1.Caption = "Bullet Seed"
        move2.Caption = "Cut"
        move3.Caption = "Scratch"
        move4.Caption = "tailwhip"
    End If
    If mypokemon = "turtwig" Then
        move1.Caption = "Body Slam"
        move2.Caption = "Razor Blade"
        move3.Caption = "Rollout"
        move4.Caption = "Leaf Storm"
    End If
End If
End Sub

Private Sub Timer3_Timer()
    Dim attpath As String
    attpath = "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt"
    Open attpath For Input As #1
    Line Input #1, theirattack
    Close #1
    lbltheirattack.Caption = theirattack
    Dim mydefpath As String
    mydefpath = "\\Gk08\student work\Writable Folder\pokebattlesim\p2defense.txt"
    Open mydefpath For Input As #1
    Line Input #1, mydefense
    Close #1
    lblmydef.Caption = mydefense
Dim turnpath As String
turnpath = "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt"
Open turnpath For Input As #1
Line Input #1, turnnum
Close #1
If turnnum = 2 Then
    Dim att2path As String
    att2path = "\\Gk08\student work\Writable Folder\pokebattlesim\p2attack.txt"
    Open att2path For Input As #1
    Line Input #1, myattack
    Close #1
    lblmyat.Caption = myattack
    Dim mydef2path As String
    mydef2path = "\\Gk08\student work\Writable Folder\pokebattlesim\p1defense.txt"
    Open mydef2path For Input As #1
    Line Input #1, theirdefense
    Close #1
    lbltheirdefense.Caption = theirdefense
    Timer3.Enabled = False
End If
End Sub

Private Sub Timer4_Timer()
If mydefense < 0 Then
    MsgBox "You Lose!!!!"
    
End If
If myattack < 0 Then
    MsgBox "You LOSE!!!!"
    
End If
If theirattack < 0 Then
    MsgBox "You Win"
    
End If
If theirdefense < 0 Then
    MsgBox "You Win"
End If

End Sub
