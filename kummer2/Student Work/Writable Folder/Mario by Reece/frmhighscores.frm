VERSION 5.00
Begin VB.Form frmhighscores 
   Caption         =   "highscores"
   ClientHeight    =   7710
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10980
   LinkTopic       =   "Form1"
   ScaleHeight     =   7710
   ScaleWidth      =   10980
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmddone 
      Caption         =   "DONE"
      Height          =   1215
      Left            =   2040
      TabIndex        =   2
      Top             =   5400
      Width           =   1695
   End
   Begin VB.CommandButton cmdscores 
      Caption         =   "showscores"
      Height          =   1215
      Left            =   4320
      TabIndex        =   1
      Top             =   5400
      Width           =   2535
   End
   Begin VB.ListBox lstscores 
      Height          =   4155
      Left            =   2400
      TabIndex        =   0
      Top             =   720
      Width           =   6015
   End
End
Attribute VB_Name = "frmhighscores"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmddone_Click()
frmhighscores.Hide
frmmario.Show
End Sub

Private Sub Command1_Click()
End Sub

Private Sub cmdscores_Click()
lstscores.Clear
Dim i As Integer
For i = 1 To 10
    lstscores.AddItem Str(i) + " " + arrscores(i).initials + " " + arrscores(i).score
Next i
End Sub

