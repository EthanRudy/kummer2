VERSION 5.00
Begin VB.Form frmbattlesim 
   Caption         =   "Pokemon Battle Simulator"
   ClientHeight    =   7275
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11040
   LinkTopic       =   "Form1"
   ScaleHeight     =   7275
   ScaleWidth      =   11040
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReady 
      BackColor       =   &H00000000&
      Caption         =   "READY"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   4200
      MaskColor       =   &H000000FF&
      TabIndex        =   0
      Top             =   840
      Width           =   1935
   End
   Begin VB.Image Image2 
      Height          =   1575
      Left            =   1440
      Top             =   1800
      Width           =   1335
   End
   Begin VB.Image Image1 
      Height          =   1695
      Left            =   7920
      Top             =   2640
      Width           =   1455
   End
End
Attribute VB_Name = "frmbattlesim"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
If lbl1 = "Bulbasaur" Then
    Image1.Picture = LoadPicture("E:\Computer Programming\POKEMON\2a.gif")
End If
cmdReady.Visible = False
End Sub

Private Sub cmdReady_Click()
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\1a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\2a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\3a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\4a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\5a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\6a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\7a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\8a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\9a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\10a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\11a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player1.txt") <> mypokemon Then
    Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\12a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\1a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\2a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\3a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\4a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\5a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\6a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\7a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\8a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\9a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\10a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\11a.gif")
End If
If Dir("\\Gk08\student work\Writable Folder\pokebattlesim\player2.txt") <> theirpokemon Then
    Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\pokebattlesim\12a.gif")
End If
    
    
    
cmdReady.Visible = False
End Sub

