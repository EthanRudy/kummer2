VERSION 5.00
Begin VB.Form frmt10 
   Caption         =   "Top Ten"
   ClientHeight    =   5220
   ClientLeft      =   4005
   ClientTop       =   2880
   ClientWidth     =   7485
   LinkTopic       =   "Form5"
   Picture         =   "frmt10.frx":0000
   ScaleHeight     =   5220
   ScaleWidth      =   7485
   Begin VB.ListBox List1 
      Height          =   2010
      Left            =   840
      TabIndex        =   0
      Top             =   1800
      Width           =   1455
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      Caption         =   "Back To Rocking"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   3240
      TabIndex        =   2
      Top             =   2880
      Width           =   1275
   End
   Begin VB.Label lbltops 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H80000009&
      Caption         =   "The Best of the Rockers"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   2400
      TabIndex        =   1
      Top             =   0
      Width           =   3000
   End
End
Attribute VB_Name = "frmt10"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Activate()
List1.Clear
Dim temp As String
q = 1

Open "\\gk08\Student Work\this is not rockhero beta\top10.dat" For Random Access Read As #1 Len = 24
Do While q <= 10
    Get #1, q, arrdude(q)

     List1.AddItem Trim(arrdude(q).name) & " : " & Str(arrdude(q).score)
    q = q + 1
Loop
Close #1
If scorez > arrdude(10).score Then
    arrdude(10).score = scorez
    temp = Trim(InputBox("Enter your name", "You are a true rock hero", "Kevin"))
    arrdude(10).name = Mid(temp, 1, 3)
End If
Call sorter




Open "\\gk08\Student Work\this is not rockhero beta\top10.dat" For Random Access Write As #1 Len = 24
For z = 1 To 10
    Put #1, , arrdude(z)
Next z
Close #1
End Sub
Private Sub sorter()
List1.Clear
Dim front As Integer, back As Integer, tmp As dude
For front = 1 To 10 - 1
    For back = front + 1 To 10
        If arrdude(front).score < arrdude(back).score Then
            tmp = arrdude(front)
            arrdude(front) = arrdude(back)
            arrdude(back) = tmp
        End If
    Next back
Next front
For q = 1 To 10
    List1.AddItem Trim(arrdude(q).name) & " : " & Str(arrdude(q).score)
Next q

End Sub

Private Sub Form_Unload(Cancel As Integer)
End
End Sub

Private Sub Label1_Click()
score = 0
frmt10.Hide
Form4.Show
End Sub
