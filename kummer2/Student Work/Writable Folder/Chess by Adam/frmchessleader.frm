VERSION 5.00
Begin VB.Form frmchessleader 
   Caption         =   "Leader Board"
   ClientHeight    =   9135
   ClientLeft      =   60
   ClientTop       =   750
   ClientWidth     =   11235
   LinkTopic       =   "Form1"
   ScaleHeight     =   9135
   ScaleWidth      =   11235
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdback 
      Caption         =   "Back To Game"
      Height          =   855
      Left            =   4680
      TabIndex        =   4
      Top             =   8160
      Width           =   1575
   End
   Begin VB.ListBox List1 
      Height          =   6690
      Left            =   1320
      TabIndex        =   0
      Top             =   1080
      Width           =   8415
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Games Won"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6840
      TabIndex        =   3
      Top             =   600
      Width           =   2055
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Games Played"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3840
      TabIndex        =   2
      Top             =   600
      Width           =   2175
   End
   Begin VB.Label lblname 
      Alignment       =   2  'Center
      Caption         =   "Name"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1320
      TabIndex        =   1
      Top             =   600
      Width           =   1935
   End
   Begin VB.Menu mnuexit 
      Caption         =   "Exit"
   End
End
Attribute VB_Name = "frmchessleader"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdback_Click()
frmchess.Show
frmchessleader.Hide
End Sub

Private Sub Form_Activate()
    Dim strLine As String, i As Integer
    List1.Clear
    numnames = 0
    Open App.Path + "\Data\highscore.dat" For Random Access Read As #1 Len = 14
        Do While Not EOF(1)
            numnames = numnames + 1
            Get #1, , players(numnames)
        Loop
    Close #1
    numnames = numnames - 1
    modchess.sort players(), 1, numnames
    For i = 1 To numnames
        strLine = players(i).name + vbTab + Str(players(i).played) + vbTab + Str(players(i).wins)
        List1.AddItem strLine
    Next i
End Sub

Private Sub mnuexit_Click()
End
End Sub
