VERSION 5.00
Begin VB.Form frmchessconnect 
   Caption         =   "Connect..."
   ClientHeight    =   3975
   ClientLeft      =   60
   ClientTop       =   750
   ClientWidth     =   4050
   LinkTopic       =   "Form1"
   ScaleHeight     =   3975
   ScaleWidth      =   4050
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   3360
      Top             =   3240
   End
   Begin VB.CommandButton cmdconnect 
      Caption         =   "Connect"
      Height          =   735
      Left            =   720
      TabIndex        =   1
      Top             =   2520
      Width           =   2295
   End
   Begin VB.TextBox txtname 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   240
      TabIndex        =   0
      Top             =   1320
      Width           =   3375
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Enter your name:"
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
      Left            =   360
      TabIndex        =   2
      Top             =   720
      Width           =   3135
   End
   Begin VB.Menu mnuexit 
      Caption         =   "Exit"
   End
End
Attribute VB_Name = "frmchessconnect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdconnect_Click()
    'Check the name
    'string * 10, integer (2), integer (2)
    Dim strLine As String, name As String, i As Integer, unique As Boolean
    i = 0
    numnames = 0
    Open App.Path + "\Data\highscore.dat" For Random Access Read As #1 Len = 14
        Do While Not EOF(1)
            numnames = numnames + 1
            Get #1, , players(numnames)
        Loop
    Close #1
    name = txtname
    unique = True
    For i = 1 To numnames
        If Trim(UCase(name)) = Trim(UCase(players(i).name)) Then
            strLine = MsgBox("That name already exists, play as " + Trim(name) + "?", vbYesNo)
            If strLine = vbYes Then
                unique = False
                yourpos = i
                connect 0, numnames
            Else
                txtname = ""
                txtname.SetFocus
            End If
        End If
    Next i
    If unique = True Then
        yourname = name
        connect 1, numnames
    End If
End Sub

Sub connect(unique As Integer, numnames As Integer)
    Dim currentplayers As Integer, uniquenames As Integer, strLine As String, i As Integer
    Open App.Path + "\Data\player.txt" For Input As #1
        Line Input #1, strLine
        currentplayers = Val(strLine)
        Line Input #1, strLine
        uniquenames = Val(strLine)
    Close #1
    If currentplayers = 0 Then
        If unique = 1 Then
            yourpos = numnames
            players(yourpos).name = yourname
            players(yourpos).played = 0
            players(yourpos).wins = 0
            Kill App.Path + "\Data\highscore.dat"
            Open App.Path + "\Data\highscore.dat" For Random Access Write As #1 Len = 14
                For i = 1 To numnames
                    Put #1, i, players(i)
                Next i
            Close #1
            strLine = "1" + vbCrLf + "1"
            Open App.Path + "\Data\player.txt" For Output As #1
                Print #1, strLine
            Close #1
        Else
            strLine = "1" + vbCrLf + "0"
            Open App.Path + "\Data\player.txt" For Output As #1
                Print #1, strLine
            Close #1
        End If
        strLine = MsgBox("You are White", vbOKOnly)
        yourplayer = 1
        Timer1.Enabled = True
    ElseIf currentplayers = 1 Then
        If unique = 1 Then
            yourpos = numnames
            players(yourpos).name = yourname
            players(yourpos).played = 0
            players(yourpos).wins = 0
            Kill App.Path + "\Data\highscore.dat"
            Open App.Path + "\Data\highscore.dat" For Random Access Write As #1 Len = 14
                For i = 1 To numnames
                    Put #1, i, players(i)
                Next i
            Close #1
            strLine = "2" + vbCrLf + "1"
            Open App.Path + "\Data\player.txt" For Output As #1
                Print #1, strLine
            Close #1
        Else
            strLine = "2" + vbCrLf + "0"
            Open App.Path + "\Data\player.txt" For Output As #1
                Print #1, strLine
            Close #1
        End If
        yourplayer = 2
        strLine = MsgBox("You are Black", vbOKOnly)
        frmchess.Show
        frmchessconnect.Hide
    Else
        strLine = MsgBox("There are already 2 people playing!", vbOKOnly)
        End
    End If
End Sub

Private Sub mnuexit_Click()
End
End Sub

Private Sub Timer1_Timer()
    Dim strLine As String
    Open App.Path + "\Data\player.txt" For Input As #1
        Line Input #1, strLine
    Close #1
    If Trim(strLine) = "2" Then
        frmchess.Show
        frmchessconnect.Hide
        Timer1.Enabled = False
    End If
End Sub
