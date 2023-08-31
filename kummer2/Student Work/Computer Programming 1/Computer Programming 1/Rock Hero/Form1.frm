VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3225
   ClientLeft      =   4230
   ClientTop       =   4500
   ClientWidth     =   7950
   LinkTopic       =   "Form1"
   ScaleHeight     =   3225
   ScaleWidth      =   7950
   Begin VB.Timer Timer3 
      Left            =   1440
      Top             =   1200
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   5640
      Top             =   1080
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   5640
      Top             =   480
   End
   Begin VB.Label lbl4 
      Alignment       =   2  'Center
      BackColor       =   &H0000C0C0&
      Caption         =   "4"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   2
      Left            =   3600
      TabIndex        =   11
      Top             =   2280
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl4 
      Alignment       =   2  'Center
      BackColor       =   &H0000C0C0&
      Caption         =   "4"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   1
      Left            =   3480
      TabIndex        =   10
      Top             =   2280
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl3 
      Alignment       =   2  'Center
      BackColor       =   &H00FF0000&
      Caption         =   "3"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   2
      Left            =   3600
      TabIndex        =   9
      Top             =   1560
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl3 
      Alignment       =   2  'Center
      BackColor       =   &H00FF0000&
      Caption         =   "3"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   1
      Left            =   3480
      TabIndex        =   8
      Top             =   1560
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl2 
      Alignment       =   2  'Center
      BackColor       =   &H00008000&
      Caption         =   "2"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   2
      Left            =   3600
      TabIndex        =   7
      Top             =   840
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl2 
      Alignment       =   2  'Center
      BackColor       =   &H00008000&
      Caption         =   "2"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   1
      Left            =   3480
      TabIndex        =   6
      Top             =   840
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl1 
      Alignment       =   2  'Center
      BackColor       =   &H000000FF&
      Caption         =   "1"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   2
      Left            =   3600
      TabIndex        =   5
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl1 
      Alignment       =   2  'Center
      BackColor       =   &H000000FF&
      Caption         =   "1"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   1
      Left            =   3480
      TabIndex        =   4
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl4 
      Alignment       =   2  'Center
      BackColor       =   &H0000C0C0&
      Caption         =   "4"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   0
      Left            =   3555
      TabIndex        =   3
      Top             =   2280
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl3 
      Alignment       =   2  'Center
      BackColor       =   &H00FF0000&
      Caption         =   "3"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   0
      Left            =   3555
      TabIndex        =   2
      Top             =   1560
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl2 
      Alignment       =   2  'Center
      BackColor       =   &H00008000&
      Caption         =   "2"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   0
      Left            =   3555
      TabIndex        =   1
      Top             =   840
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbl1 
      Alignment       =   2  'Center
      BackColor       =   &H000000FF&
      Caption         =   "1"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   0
      Left            =   3555
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Const SND_ASYNC = &H1
Const SND_LOOP = &H8
Const SND_NODEFAULT = &H2
Const SND_SYNC = &H0
Const SND_NOSTOP = &H10
Const SND_MEMORY = &H4
Private Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long 'Sound


Private Sub Form_Activate()
    sndPlaySound "E:\guitarvspiano.wav", SND_ASYNC
    counters = 1
    body = ""
End Sub

Private Sub Form_keydown(KeyCode As Integer, Shift As Integer)
If KeyCode = 192 Then
    sndPlaySound "E:\crowdohh-1.wav", SND_ASYNC
    Form1.Hide
    Form3.Show
End If
If KeyCode = 32 Then
    sndPlaySound "E:\crowdohh-1.wav", SND_ASYNC
    Form1.Hide
    Form2.Show
End If
If Shift = 0 Then
    If KeyCode = 49 Then
        If key1(1).moving <> 1 Then
            lbl1(0).Enabled = True
            lbl1(0).Visible = True
            key1(1).moving = 1
        ElseIf key1(2).moving <> 1 Then
            lbl1(1).Enabled = True
            lbl1(1).Visible = True
            key1(2).moving = 1
        ElseIf key1(3).moving <> 1 Then
            lbl1(2).Enabled = True
            lbl1(2).Visible = True
            key1(3).moving = 1
        End If
    ElseIf KeyCode = 50 Then
        If key2(1).moving <> 1 Then
            lbl2(0).Enabled = True
            lbl2(0).Visible = True
            key2(1).moving = 1
        ElseIf key2(2).moving <> 1 Then
            lbl2(1).Enabled = True
            lbl2(1).Visible = True
            key2(2).moving = 1
        ElseIf key2(3).moving <> 1 Then
            lbl2(2).Enabled = True
            lbl2(2).Visible = True
            key2(3).moving = 1
        End If
    ElseIf KeyCode = 51 Then
        If key3(1).moving <> 1 Then
            lbl3(0).Enabled = True
            lbl3(0).Visible = True
            key3(1).moving = 1
        ElseIf key3(2).moving <> 1 Then
            lbl3(1).Enabled = True
            lbl3(1).Visible = True
            key3(2).moving = 1
        ElseIf key3(3).moving <> 1 Then
            lbl3(2).Enabled = True
            lbl3(2).Visible = True
            key3(3).moving = 1
        End If
    ElseIf KeyCode = 52 Then
        If key4(1).moving <> 1 Then
            lbl4(0).Enabled = True
            lbl4(0).Visible = True
            key4(1).moving = 1
        ElseIf key4(2).moving <> 1 Then
            lbl4(1).Enabled = True
            lbl4(1).Visible = True
            key4(2).moving = 1
        ElseIf key4(3).moving <> 1 Then
            lbl4(2).Enabled = True
            lbl4(2).Visible = True
            key4(3).moving = 1
        End If
    End If
    notes(counters).what = KeyCode
    notes(counters).when = jim
    
    Form2.List1.AddItem (notes(counters).what & " - " & notes(counters).when)
    body = body & vbCrLf & (notes(counters).what & " - " & notes(counters).when)
    counters = counters + 1
Else
    Timer3.Interval = 1
    If KeyCode = 49 Then
        If key1(1).moving <> 1 Then
            lbl1(0).Enabled = True
            lbl1(0).Visible = True
            key1(1).moving = 1
        ElseIf key1(2).moving <> 1 Then
            lbl1(1).Enabled = True
            lbl1(1).Visible = True
            key1(2).moving = 1
        ElseIf key1(3).moving <> 1 Then
            lbl1(2).Enabled = True
            lbl1(2).Visible = True
            key1(3).moving = 1
        End If
    ElseIf KeyCode = 50 Then
        If key2(1).moving <> 1 Then
            lbl2(0).Enabled = True
            lbl2(0).Visible = True
            key2(1).moving = 1
        ElseIf key2(2).moving <> 1 Then
            lbl2(1).Enabled = True
            lbl2(1).Visible = True
            key2(2).moving = 1
        ElseIf key2(3).moving <> 1 Then
            lbl2(2).Enabled = True
            lbl2(2).Visible = True
            key2(3).moving = 1
        End If
    ElseIf KeyCode = 51 Then
        If key3(1).moving <> 1 Then
            lbl3(0).Enabled = True
            lbl3(0).Visible = True
            key3(1).moving = 1
        ElseIf key3(2).moving <> 1 Then
            lbl3(1).Enabled = True
            lbl3(1).Visible = True
            key3(2).moving = 1
        ElseIf key3(3).moving <> 1 Then
            lbl3(2).Enabled = True
            lbl3(2).Visible = True
            key3(3).moving = 1
        End If
    ElseIf KeyCode = 52 Then
        If key4(1).moving <> 1 Then
            lbl4(0).Enabled = True
            lbl4(0).Visible = True
            key4(1).moving = 1
        ElseIf key4(2).moving <> 1 Then
            lbl4(1).Enabled = True
            lbl4(1).Visible = True
            key4(2).moving = 1
        ElseIf key4(3).moving <> 1 Then
            lbl4(2).Enabled = True
            lbl4(2).Visible = True
            key4(3).moving = 1
        End If
    End If
    notes(counters).what = KeyCode
    notes(counters).when = jim
    
    Form2.List1.AddItem (notes(counters).what & " - " & notes(counters).when)
    body = body & vbCrLf & (notes(counters).what & " - " & notes(counters).when)
    counters = counters + 1
End If
End Sub



Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
For x = 0 To 2
    lbl1(x).Width = 375
    lbl2(x).Width = 375
    lbl3(x).Width = 375
    lbl4(x).Width = 375
Next x
Timer3.Interval = 0

End Sub

Private Sub Form_Unload(Cancel As Integer)
    sndPlaySound "E:\crowdohh-1.wav", SND_ASYNC
End Sub

Private Sub Timer1_Timer()
For x = 0 To 2
    If lbl1(x).Enabled = True Then
        lbl1(x).Left = lbl1(x).Left - 50
    End If
Next x
For x = 0 To 2
    If lbl2(x).Enabled = True Then
        lbl2(x).Left = lbl2(x).Left - 50
    End If
Next x
For x = 0 To 2
    If lbl3(x).Enabled = True Then
        lbl3(x).Left = lbl3(x).Left - 50
    End If
Next x
For x = 0 To 2
    If lbl4(x).Enabled = True Then
        lbl4(x).Left = lbl4(x).Left - 50
    End If
Next x
For x = 0 To 2
    If lbl1(x).Left < 10 Then
        lbl1(x).Left = 2840
        lbl1(x).Enabled = False
        lbl1(x).Visible = False
        key1(x + 1).moving = 0
    End If
Next x
For x = 0 To 2
    If lbl2(x).Left < 10 Then
        lbl2(x).Left = 2840
        lbl2(x).Enabled = False
        lbl2(x).Visible = False
        key2(x + 1).moving = 0
    End If
Next x
For x = 0 To 2
    If lbl3(x).Left < 10 Then
        lbl3(x).Left = 2840
        lbl3(x).Enabled = False
        lbl3(x).Visible = False
        key3(x + 1).moving = 0
    End If
Next x
For x = 0 To 2
    If lbl4(x).Left < 10 Then
        lbl4(x).Left = 2840
        lbl4(x).Enabled = False
        lbl4(x).Visible = False
        key4(x + 1).moving = 0
    End If
Next x
End Sub

Private Sub Timer2_Timer()
jim = jim + 1
End Sub

Private Sub Timer3_Timer()
For x = 1 To 3
    If key1(x).moving = 1 Then
        lbl1(x - 1).Width = lbl1(x - 1).Width + 50
    End If
Next x
For x = 1 To 3
    If key2(x).moving = 1 Then
        lbl2(x - 1).Width = lbl2(x - 1).Width + 50
    End If
Next x
For x = 1 To 3
    If key3(x).moving = 1 Then
        lbl3(x - 1).Width = lbl3(x - 1).Width + 50
    End If
Next x
For x = 1 To 3
    If key4(x).moving = 1 Then
        lbl4(x - 1).Width = lbl4(x - 1).Width + 50
    End If
Next x
End Sub

Private Sub Timer4_Timer()

End Sub
