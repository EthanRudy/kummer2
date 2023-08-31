VERSION 5.00
Begin VB.Form frmIntroLife 
   Caption         =   "Welcome to the game of LIFE!"
   ClientHeight    =   4290
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   7140
   LinkTopic       =   "Form1"
   Picture         =   "frmIntroLife.frx":0000
   ScaleHeight     =   4290
   ScaleWidth      =   7140
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuBegin 
      Caption         =   "Begin"
   End
   Begin VB.Menu mnuExit 
      Caption         =   "Exit"
   End
   Begin VB.Menu mnuNetwork 
      Caption         =   "Network"
   End
End
Attribute VB_Name = "frmIntroLife"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub mnuBegin_Click()
frmIntroLife.Hide
frmLife.Show

Person.Gender = Trim(InputBox("Male or Female?", "Player 1"))
Person.Money = 500

Person2.Gender = Trim(InputBox("Male or Female?", "Player 2"))
Person2.Money = 500

If Person.Gender = "M" Then
    frmLife.imgplayer.Picture = LoadPicture("F:\male.jpg")
Else
    frmLife.imgplayer.Picture = LoadPicture("F:\female.jpg")
End If

If Person2.Gender = "M" Then
    frmLife.imgPlayer2.Picture = LoadPicture("F:\male.jpg")
Else
    frmLife.imgPlayer2.Picture = LoadPicture("F:\female.jpg")
End If

End Sub

Private Sub mnuExit_Click()
End
End Sub

Private Sub mnuNetwork_Click()
frmIntroLife.Hide
frmNetwork.Show

'Person.Gender = Trim(InputBox("Male or Female?", "Player 1"))
'Person.Money = 500

'Person2.Gender = Trim(InputBox("Male or Female?", "Player 2"))
'Person2.Money = 500
PersonNumber = Trim(InputBox("Player Number?", "Player"))
'If Person.Gender = "M" Then
 '   frmNetwork.imgplayer.Picture = LoadPicture("F:\male.jpg")
'Else
 '   frmNetwork.imgplayer.Picture = LoadPicture("F:\female.jpg")
'End If

'If Person2.number = "1" Then
 '   frmNetwork.imgPlayer2.Picture = LoadPicture("F:\male.jpg")
'Else
 '   frmNetwork.imgPlayer2.Picture = LoadPicture("F:\female.jpg")
'End If
End Sub
