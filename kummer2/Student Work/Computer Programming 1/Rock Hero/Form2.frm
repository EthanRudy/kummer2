VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3060
   ClientLeft      =   6135
   ClientTop       =   4125
   ClientWidth     =   4560
   LinkTopic       =   "Form2"
   ScaleHeight     =   3060
   ScaleWidth      =   4560
   Begin VB.ListBox List1 
      Height          =   2205
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Unload(Cancel As Integer)

Open "E:\guitarvspianorecording.txt" For Output As #1
    Print #1, body
Close #1

End Sub
