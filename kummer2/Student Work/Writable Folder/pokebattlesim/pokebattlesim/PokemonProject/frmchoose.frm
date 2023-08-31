VERSION 5.00
Begin VB.Form frmchoose 
   Caption         =   "Form1"
   ClientHeight    =   5595
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9450
   LinkTopic       =   "Form1"
   ScaleHeight     =   5595
   ScaleWidth      =   9450
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   120
      Top             =   5040
   End
   Begin VB.CommandButton Command12 
      Caption         =   "Piplup"
      Height          =   375
      Left            =   4800
      TabIndex        =   11
      Top             =   3600
      Width           =   2055
   End
   Begin VB.CommandButton Command11 
      Caption         =   "Chimchar"
      Height          =   375
      Left            =   4800
      TabIndex        =   10
      Top             =   3000
      Width           =   2055
   End
   Begin VB.CommandButton Command10 
      Caption         =   "Turtwig"
      Height          =   375
      Left            =   4800
      TabIndex        =   9
      Top             =   2400
      Width           =   2055
   End
   Begin VB.CommandButton Command9 
      Caption         =   "Mudkip"
      Height          =   375
      Left            =   4800
      TabIndex        =   8
      Top             =   1800
      Width           =   2055
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Torchic"
      Height          =   435
      Left            =   4800
      TabIndex        =   7
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Treecko"
      Height          =   375
      Left            =   4800
      TabIndex        =   6
      Top             =   600
      Width           =   2055
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Totodile"
      Height          =   375
      Left            =   2400
      TabIndex        =   5
      Top             =   3600
      Width           =   2055
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Cyndaquil"
      Height          =   375
      Left            =   2400
      TabIndex        =   4
      Top             =   3000
      Width           =   2055
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Chikorita"
      Height          =   375
      Left            =   2400
      TabIndex        =   3
      Top             =   2400
      Width           =   2055
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Squirtle"
      Height          =   375
      Left            =   2400
      TabIndex        =   2
      Top             =   1800
      Width           =   2055
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Charmander"
      Height          =   375
      Left            =   2400
      TabIndex        =   1
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Bulbasaur"
      Height          =   375
      Left            =   2400
      TabIndex        =   0
      Top             =   600
      Width           =   2055
   End
   Begin VB.Label lbl2 
      Caption         =   "Label2"
      Height          =   735
      Left            =   7560
      TabIndex        =   13
      Top             =   0
      Width           =   2055
   End
   Begin VB.Label lbl1 
      Caption         =   "Label1"
      Height          =   735
      Left            =   0
      TabIndex        =   12
      Top             =   0
      Width           =   1695
   End
End
Attribute VB_Name = "frmchoose"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim pokemon1 As String
Dim Data As String
Dim flag As Integer
Dim peepee As Integer




Private Sub Command1_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
 'Saves the data for Player two
Data = "bulbasaur"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = bulbasaur
' Saves the data for Player one
Data = "bulbasaur"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If

End Sub

Private Sub Command10_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "turtwig"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = bulbasaur
' Saves the data for Player one
'nothing interesting
Data = "Turtwig"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If
End Sub

Private Sub Command11_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "Chimchar"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = bulbasaur
' Saves the data for Player one
'nothing interesting
Data = "Chimchar"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If
End Sub

Private Sub Command12_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "piplup"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = "Piplup"
' Saves the data for Player one
'nothing interesting
Data = "piplup"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If
End Sub

Private Sub Command2_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "charmander"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = "Charmander"
' Saves the data for Player one
'nothing interesting
Data = "charmander"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If
If ("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "Charmander" Then
lbl1 = "Charmander"
End If
If ("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "Charmander" Then
lbl2 = "Charmander"
End If
End Sub

Private Sub Command3_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "Squirtle"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = bulbasaur
' Saves the data for Player one
'nothing interesting
Data = "Squirtle"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If
End Sub

Private Sub Command4_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "chikarita"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = "Chikarita"
' Saves the data for Player one
'nothing interesting
Data = "Chikorita"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If
End Sub

Private Sub Command5_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "cyndaquil"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = "Cyndaquil"
' Saves the data for Player one
'nothing interesting
Data = "Cyndaquil"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If

End Sub

Private Sub Command6_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "totodile"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = "Totdile"
' Saves the data for Player one
'nothing interesting
Data = "Totodile"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If

End Sub

Private Sub Command7_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "treecko"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = treecko
' Saves the data for Player one
'nothing interesting
Data = "treecko"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If

End Sub

Private Sub Command8_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "torchic"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = bulbasaur
' Saves the data for Player one
'nothing interesting
Data = "torchic"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If

End Sub

Private Sub Command9_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
  MsgBox "File exists"
  If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
  MsgBox "Two people are already playing the game"
Else
  MsgBox "You are now Player 2"
  'nothing interesting
Data = "Mudkip"
flag = 2
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt" For Output As #1
    Print #1, Data
Close #1
End If
Else
  MsgBox "You are now Player 1"
  pokemon1 = Mudkip
' Saves the data for Player one
'nothing interesting
Data = "Mudkip"
flag = 1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt" For Output As #1
    Print #1, Data
Close #1
End If
End Sub


Private Sub Form_Load()
flag = 0
peepee = "0"
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
Kill ("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
Kill ("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt")
End If
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p1ready.txt" For Output As #1
    Print #1, peepee
Close #1
Open "\\Gk08\student work\Writable Folder\pokebattlesim\p2ready.txt" For Output As #1
    Print #1, peepee
Close #1
End Sub



Private Sub Timer1_Timer()
Dim Flag1 As String, flag2 As String
 
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> "" Then
    Flag1 = 1
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> "" Then
    flag2 = 1
If Flag1 = 1 And flag2 = 1 Then
    flag3 = 1
End If
End If
End If
'If lbl1.Caption = "bulbasaur" Then
 '   Image1.Picture = LoadPicture("E:\Computer Programming\POKEMON\1a.gif")
'End If
If flag = 1 Then
lbl1.Caption = Data
implayer = 1
End If
If flag = 2 Then
lbl2.Caption = Data
implayer = 2
End If
mypokemon = Data
If flag3 = 1 Then
    If implayer = 1 Then
    frmplayer1.Show
    End If
    If implayer = 2 Then
    frmplayer2.Show
    End If
End If
End Sub
