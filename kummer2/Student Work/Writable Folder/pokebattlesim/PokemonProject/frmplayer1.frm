VERSION 5.00
Begin VB.Form frmplayer1 
   BackColor       =   &H00FFFFC0&
   Caption         =   "Form1"
   ClientHeight    =   6810
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10005
   LinkTopic       =   "Form1"
   ScaleHeight     =   6810
   ScaleWidth      =   10005
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer4 
      Interval        =   1
      Left            =   5280
      Top             =   4080
   End
   Begin VB.Timer Timer3 
      Interval        =   1
      Left            =   4680
      Top             =   4080
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   3600
      Top             =   4200
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   4200
      Top             =   4080
   End
   Begin VB.Line Line12 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   7440
      X2              =   7440
      Y1              =   5760
      Y2              =   4680
   End
   Begin VB.Line Line11 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   4920
      X2              =   9720
      Y1              =   5760
      Y2              =   5760
   End
   Begin VB.Label Label5 
      BackColor       =   &H00FFFFC0&
      Caption         =   "<- Chose a move to the panel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5160
      TabIndex        =   14
      Top             =   6120
      Width           =   4455
   End
   Begin VB.Line Line10 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   4920
      X2              =   4920
      Y1              =   4680
      Y2              =   5760
   End
   Begin VB.Line Line9 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   480
      X2              =   4920
      Y1              =   6240
      Y2              =   6240
   End
   Begin VB.Line Line8 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   4920
      X2              =   4920
      Y1              =   5760
      Y2              =   6720
   End
   Begin VB.Line Line7 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   480
      X2              =   4920
      Y1              =   5760
      Y2              =   5760
   End
   Begin VB.Line Line6 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   9720
      X2              =   9720
      Y1              =   4680
      Y2              =   6720
   End
   Begin VB.Line Line5 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   3960
      X2              =   9720
      Y1              =   6720
      Y2              =   6720
   End
   Begin VB.Line Line4 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   720
      X2              =   3960
      Y1              =   6720
      Y2              =   6720
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   480
      X2              =   480
      Y1              =   4800
      Y2              =   6720
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   600
      X2              =   9720
      Y1              =   4680
      Y2              =   4680
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      X1              =   2400
      X2              =   2400
      Y1              =   4680
      Y2              =   6600
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "ENEMY POKEMON HP:"
      Height          =   255
      Left            =   7680
      TabIndex        =   13
      Top             =   4920
      Width           =   1815
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "ENEMY POKEMON PP:"
      Height          =   255
      Left            =   5160
      TabIndex        =   12
      Top             =   4920
      Width           =   1935
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "POKEMON HP:"
      Height          =   255
      Left            =   2640
      TabIndex        =   11
      Top             =   4920
      Width           =   1815
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "POKEMON PP:"
      Height          =   255
      Left            =   600
      TabIndex        =   10
      Top             =   4920
      Width           =   1695
   End
   Begin VB.Label move4 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   255
      Left            =   2520
      TabIndex        =   9
      Top             =   6360
      Width           =   2415
   End
   Begin VB.Label move3 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   255
      Left            =   720
      TabIndex        =   8
      Top             =   6360
      Width           =   1695
   End
   Begin VB.Label move2 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   255
      Left            =   2520
      TabIndex        =   7
      Top             =   5880
      Width           =   2295
   End
   Begin VB.Label move1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   255
      Left            =   600
      TabIndex        =   6
      Top             =   5880
      Width           =   1815
   End
   Begin VB.Label lbltheirdefense 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      Height          =   255
      Left            =   7440
      TabIndex        =   5
      Top             =   5280
      Width           =   2175
   End
   Begin VB.Label lbltheirattack 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      Height          =   255
      Left            =   5160
      TabIndex        =   4
      Top             =   5160
      Width           =   2175
   End
   Begin VB.Label lblmydef 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      Height          =   255
      Left            =   2520
      TabIndex        =   3
      Top             =   5160
      Width           =   2175
   End
   Begin VB.Label lblmyat 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   5280
      Width           =   2175
   End
   Begin VB.Image Image2 
      Height          =   2295
      Left            =   5760
      Top             =   1080
      Width           =   3855
   End
   Begin VB.Image Image1 
      Height          =   2295
      Left            =   960
      Top             =   1080
      Width           =   3255
   End
   Begin VB.Label lbltheirpokemon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   615
      Left            =   6240
      TabIndex        =   1
      Top             =   240
      Width           =   3015
   End
   Begin VB.Label lblmypokemon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   615
      Left            =   1080
      TabIndex        =   0
      Top             =   240
      Width           =   3015
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
Timer2.Enabled = True
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
Dim msgboxstring
msgboxstring = "You have lost 250 attack." + theirpokemon + "has lost 250 defense."
MsgBox msgboxstring
turnnum = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt" For Output As #1
    Print #1, turnnum
Close #1
End Sub

Private Sub move2_Click()
myattack = myattack - 274
lblmyat.Caption = myattack
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt" For Output As #1
    Print #1, myattack
Close #1
theirdefense = theirdefense - 321
lbltheirdefense.Caption = theirdefense
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2defense.txt" For Output As #1
    Print #1, theirdefense
Close #1
Dim msgboxstring
msgboxstring = "You have lost 274 attack." + theirpokemon + "has lost 321 defense."
MsgBox msgboxstring
turnnum = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt" For Output As #1
    Print #1, turnnum
Close #1
End Sub

Private Sub move3_Click()
myattack = myattack - 169
lblmyat.Caption = myattack
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt" For Output As #1
    Print #1, myattack
Close #1
theirdefense = theirdefense - 312
lbltheirdefense.Caption = theirdefense
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2defense.txt" For Output As #1
    Print #1, theirdefense
Close #1
Dim msgboxstring
msgboxstring = "You have lost 169 attack." + theirpokemon + "has lost 312 defense."
MsgBox msgboxstring
turnnum = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt" For Output As #1
    Print #1, turnnum
Close #1
End Sub

Private Sub move4_Click()
 myattack = myattack - 278
lblmyat.Caption = myattack
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt" For Output As #1
    Print #1, myattack
Close #1
theirdefense = theirdefense - 417
lbltheirdefense.Caption = theirdefense
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2defense.txt" For Output As #1
    Print #1, theirdefense
Close #1
Dim msgboxstring
msgboxstring = "You have lost 278 attack." + theirpokemon + "has lost 417 defense."
MsgBox msgboxstring
turnnum = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt" For Output As #1
    Print #1, turnnum
Close #1
End Sub

Private Sub Timer1_Timer()
'Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1ready.txt" For Output As #1
'    Print #1, p1ready
'Close #1
'readypath = "\\Gk08\student work\Writable Folder\pokebattlesim\p2ready.txt"
'Open readypath For Input As #1
''Line Input #1, p2ready
'Close #1
'If p1ready = 1 And p2ready = 1 Then
'Timer2.Enabled = True
'End If
End Sub

Private Sub Timer2_Timer()
If turnnum = 2 Then
    MsgBox "Player 2 is currently moving. Please wait for your turn"
    Timer3.Enabled = True
End If
If turnnum = 1 Then
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
    If mypokemon = "chimchar " Then
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
    attpath = "\\Gk08\student work\Writable Folder\pokebattlesim\p2attack.txt"
    Open attpath For Input As #1
    Line Input #1, theirattack
    Close #1
    lbltheirattack.Caption = theirattack
    Dim mydefpath As String
    mydefpath = "\\Gk08\student work\Writable Folder\pokebattlesim\p1defense.txt"
    Open mydefpath For Input As #1
    Line Input #1, mydefense
    Close #1
    lblmydef.Caption = mydefense
Dim turnpath As String
turnpath = "\\Gk08\student work\Writable Folder\pokebattlesim\turnnum.txt"
Open turnpath For Input As #1
Line Input #1, turnnum
Close #1
If turnnum = 1 Then
    Dim att2path As String
    att2path = "\\Gk08\student work\Writable Folder\pokebattlesim\p1attack.txt"
    Open att2path For Input As #1
    Line Input #1, myattack
    Close #1
    lblmyat.Caption = myattack
    Dim mydef2path As String
    mydef2path = "\\Gk08\student work\Writable Folder\pokebattlesim\p2defense.txt"
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











