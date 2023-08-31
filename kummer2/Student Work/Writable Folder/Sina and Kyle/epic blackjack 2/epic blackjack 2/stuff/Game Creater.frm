VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   9240
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11580
   LinkTopic       =   "Form1"
   Picture         =   "Game Creater.frx":0000
   ScaleHeight     =   9240
   ScaleWidth      =   11580
   StartUpPosition =   3  'Windows Default
   Begin VB.FileListBox File1 
      Height          =   1845
      Left            =   6600
      TabIndex        =   0
      Top             =   7320
      Width           =   4815
   End
   Begin VB.Image Image2 
      Height          =   1890
      Left            =   1320
      Picture         =   "Game Creater.frx":FEE4
      Stretch         =   -1  'True
      Top             =   720
      Width           =   8760
   End
   Begin VB.Image Image1 
      Height          =   570
      Left            =   8040
      Picture         =   "Game Creater.frx":15E15
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   3555
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
File1.path = "\\Gk08\student work\Writable Folder\Sina and Kyle\epic blackjack\Game Server"
End Sub

Private Sub Image2_Click()

End Sub
