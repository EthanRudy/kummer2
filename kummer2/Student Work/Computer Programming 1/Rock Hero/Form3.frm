VERSION 5.00
Begin VB.Form Form3 
   BackColor       =   &H80000008&
   Caption         =   "Rock Hero"
   ClientHeight    =   4080
   ClientLeft      =   3090
   ClientTop       =   4125
   ClientWidth     =   10005
   LinkTopic       =   "Form3"
   ScaleHeight     =   4080
   ScaleWidth      =   10005
   Begin VB.Timer timerscore 
      Left            =   2040
      Top             =   2760
   End
   Begin VB.Timer Timer6 
      Interval        =   1
      Left            =   8760
      Top             =   1680
   End
   Begin VB.Timer Timer5 
      Interval        =   1
      Left            =   8280
      Top             =   960
   End
   Begin VB.PictureBox picMan 
      DrawWidth       =   3
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      ForeColor       =   &H00FFFFFF&
      Height          =   3000
      Left            =   7920
      Picture         =   "Form3.frx":0000
      ScaleHeight     =   2940
      ScaleWidth      =   1935
      TabIndex        =   30
      Top             =   120
      Width           =   2000
   End
   Begin VB.Timer Timer4 
      Interval        =   500
      Left            =   2520
      Top             =   2760
   End
   Begin VB.Timer Timer3 
      Interval        =   1
      Left            =   120
      Top             =   3360
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   5880
      Top             =   1080
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   5880
      Top             =   1680
   End
   Begin VB.Label lblopp 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "Oppenent Score: 0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   360
      TabIndex        =   31
      Top             =   3240
      Width           =   3375
   End
   Begin VB.Label lblm1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "MISS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   300
      Index           =   3
      Left            =   360
      TabIndex        =   29
      Top             =   2880
      Visible         =   0   'False
      Width           =   600
   End
   Begin VB.Label lblm1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "MISS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   300
      Index           =   2
      Left            =   360
      TabIndex        =   28
      Top             =   2040
      Visible         =   0   'False
      Width           =   600
   End
   Begin VB.Label lblm1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "MISS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   300
      Index           =   1
      Left            =   360
      TabIndex        =   27
      Top             =   1200
      Visible         =   0   'False
      Width           =   600
   End
   Begin VB.Label lblm1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "MISS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   300
      Index           =   0
      Left            =   360
      TabIndex        =   26
      Top             =   360
      Visible         =   0   'False
      Width           =   600
   End
   Begin VB.Label lblp1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "Perfect"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Index           =   3
      Left            =   360
      TabIndex        =   25
      Top             =   2880
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label lblp1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "Perfect"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Index           =   2
      Left            =   360
      TabIndex        =   24
      Top             =   2040
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label lblp1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "Perfect"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Index           =   1
      Left            =   360
      TabIndex        =   23
      Top             =   1200
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label lbl1g 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "Good"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   300
      Index           =   3
      Left            =   360
      TabIndex        =   22
      Top             =   2760
      Visible         =   0   'False
      Width           =   600
   End
   Begin VB.Label lbl1g 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "Good"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   300
      Index           =   2
      Left            =   360
      TabIndex        =   21
      Top             =   1920
      Visible         =   0   'False
      Width           =   600
   End
   Begin VB.Label lbl1g 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "Good"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   300
      Index           =   1
      Left            =   360
      TabIndex        =   20
      Top             =   1080
      Visible         =   0   'False
      Width           =   600
   End
   Begin VB.Label lblp1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "Perfect"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Index           =   0
      Left            =   360
      TabIndex        =   19
      Top             =   360
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label lbl1g 
      AutoSize        =   -1  'True
      BackColor       =   &H80000008&
      Caption         =   "Good"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   300
      Index           =   0
      Left            =   360
      TabIndex        =   18
      Top             =   240
      Visible         =   0   'False
      Width           =   600
   End
   Begin VB.Label lblMP 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "Multiplyer:  1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   3720
      TabIndex        =   17
      Top             =   3240
      Width           =   3135
   End
   Begin VB.Label lblscore 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "Score: 0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   6960
      TabIndex        =   16
      Top             =   3240
      Width           =   2775
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000009&
      Index           =   1
      X1              =   960
      X2              =   960
      Y1              =   120
      Y2              =   3600
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000009&
      Index           =   0
      X1              =   360
      X2              =   360
      Y1              =   120
      Y2              =   3600
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
      Left            =   5235
      TabIndex        =   15
      Top             =   2520
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
      Left            =   5235
      TabIndex        =   14
      Top             =   2520
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
      Left            =   5235
      TabIndex        =   13
      Top             =   1800
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
      Left            =   5235
      TabIndex        =   12
      Top             =   1800
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
      Left            =   5235
      TabIndex        =   11
      Top             =   1080
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
      Left            =   5235
      TabIndex        =   10
      Top             =   1080
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
      Left            =   5235
      TabIndex        =   9
      Top             =   360
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
      Left            =   5235
      TabIndex        =   8
      Top             =   360
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
      Left            =   5235
      TabIndex        =   7
      Top             =   2520
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
      Left            =   5235
      TabIndex        =   6
      Top             =   1800
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
      Left            =   5235
      TabIndex        =   5
      Top             =   1080
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
      Left            =   5235
      TabIndex        =   4
      Top             =   360
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
      Index           =   3
      Left            =   5880
      TabIndex        =   3
      Top             =   2520
      Visible         =   0   'False
      Width           =   2175
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
      Index           =   3
      Left            =   5880
      TabIndex        =   2
      Top             =   1800
      Visible         =   0   'False
      Width           =   2175
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
      Index           =   3
      Left            =   5880
      TabIndex        =   1
      Top             =   1080
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Label lbll1 
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
      Left            =   5880
      TabIndex        =   0
      Top             =   360
      Visible         =   0   'False
      Width           =   2175
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim bob(1000000) As note
Dim cnts As Long
Dim mp As Double
Dim score As Long
Dim nir As Long
Dim ns As Long
Dim jimy As Long
Dim ter As Long
Dim i As Integer, c As Integer, style As Integer
Dim otherguysscore As Double
Dim rArmX As Integer, rArmY As Integer, lArmX As Integer, lArmY As Integer
Dim rHandX As Integer, rHandY As Integer, lHandX As Integer, lHandY As Integer
Dim rKneeX As Integer, rKneeY As Integer, lKneeX As Integer, lKneeY As Integer
Dim rFootX As Integer, rFootY As Integer, lFootX As Integer, lFootY As Integer
Dim headX As Integer, headY As Integer, bodyX As Integer, bodyY As Integer
   Const SND_SYNC = &H0
   Const SND_ASYNC = &H1
   Const SND_NODEFAULT = &H2
   Const SND_LOOP = &H8
   Const SND_NOSTOP = &H10
Private Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long 'Sound
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Sub Basic()
If i Mod 2 = 0 Then
    rHandX = 1200
    rHandY = 1700
Else
    rHandX = 1100
    rHandY = 1600
End If
End Sub
Private Sub Medium()
If i Mod 2 = 0 Then
    rHandX = 1200
    rHandY = 1700
    lHandY = 1000
    lKneeY = 2300
    lFootY = 2800
    headY = 500
    picMan.ScaleTop = -50
    picMan.ScaleLeft = -50
Else
    rHandX = 1100
    rHandY = 1600
    lHandY = 1100
    lKneeY = 2200
    lFootY = 2700
    headY = 600
    picMan.ScaleTop = 0
    picMan.ScaleLeft = 0
End If
End Sub
Private Sub Good()
bodyX = 1300
headX = 1300
lArmX = 1000
lArmY = 1400
lHandY = 900
If i Mod 2 = 0 Then
    rHandX = 1100
    rHandY = 1800
    lHandX = 700
    headY = 500
    picMan.ScaleTop = -50
    picMan.ScaleLeft = -50
Else
    rHandX = 1000
    rHandY = 1700
    lHandX = 800
    headY = 600
    picMan.ScaleTop = 0
    picMan.ScaleLeft = 0
End If
End Sub
Private Sub Amazing()
headY = 900
bodyY = 2300
lArmY = 1900
lHandY = 1700
rArmY = 1900
rHandY = 2100
lKneeY = 2700
lFootX = 1100
lFootY = 2600
rKneeY = 2700
rFootY = 2500
rFootX = 1700
headX = 1300
bodyX = 1300

lArmX = 1000
lArmY = 1800
lHandY = 1300
If i Mod 2 = 0 Then
    rHandX = 1100
    rHandY = 2200
    lHandX = 700
    headY = 900
    picMan.ScaleTop = -50
    picMan.ScaleLeft = -50
Else
    rHandX = 1000
    rHandY = 2100
    lHandX = 800
    headY = 1000
    picMan.ScaleTop = 0
    picMan.ScaleLeft = 0
End If
End Sub
Private Sub Draw()
picMan.Circle (headX, headY), 300
picMan.Line (headX, headY + 300)-(bodyX, bodyY)
'Left arm, hand
picMan.Line (bodyX, bodyY - 700)-(lArmX, lArmY)
picMan.Line (lArmX, lArmY)-(lHandX, lHandY)
'Right arm,hand
picMan.Line (bodyX, bodyY - 700)-(rArmX, rArmY)
picMan.Line (rArmX, rArmY)-(rHandX, rHandY)
'left knee,foot
picMan.Line (bodyX, bodyY)-(lKneeX, lKneeY)
picMan.Line (lKneeX, lKneeY)-(lFootX, lFootY)
'right knee,foot
picMan.Line (bodyX, bodyY)-(rKneeX, rKneeY)
picMan.Line (rKneeX, rKneeY)-(rFootX, rFootY)
End Sub
Private Sub Reload()
headX = 1000
headY = 500
bodyX = 1000
bodyY = 1900
lArmX = 600
lArmY = 1500
lHandX = 200
lHandY = 1300
rArmX = 1500
rArmY = 1500
rHandX = 1400
rHandY = 1700
lKneeX = 600
lKneeY = 2300
lFootX = 500
lFootY = 2800
rKneeX = 1400
rKneeY = 2300
rFootX = 1500
rFootY = 2800

End Sub

Private Sub Form_Activate()
Open "\\Gk08\student work\this is not rockhero beta\ready.txt" For Output As #1
            Print #1, "not"
        Close #1
End Sub

Private Sub Form_Terminate()
sndPlaySound "\\Gk08\student work\this is not rockhero beta\rb2.wav", SND_ASYNC
End Sub

Private Sub Form_Unload(Cancel As Integer)
sndPlaySound "\\Gk08\student work\this is not rockhero beta\rb2.wav", SND_ASYNC
End
End Sub

Private Sub picman_keydown(KeyCode As Integer, Shift As Integer)
jim = nir
oldmp = mp
ns = 0
If KeyCode = 192 Then
    scorez = score
    sndPlaySound "\\Gk08\student work\this is not rockhero beta\rb2.wav", SND_ASYNC
    Form3.Hide
    frmt10.Show
ElseIf KeyCode = 49 Then
    For x = 0 To 2
        If lbl1(x).Left < 1200 And lbl1(x).Left > 300 Then
            ns = ns + 5
            nir = nir + 1
            lbl1(x).BackColor = &HC0C0C0
            If lbl1(x).Left < 960 And lbl1(x).Left > 360 Then
                lblp1(0).Visible = True
                ns = ns + 5
            Else
                lbl1g(0).Visible = True
            End If
        End If
    Next x
ElseIf KeyCode = 50 Then
    For x = 0 To 2
        If lbl2(x).Left < 1200 And lbl2(x).Left > 300 Then
            ns = ns + 5
            nir = nir + 1
            lbl2(x).BackColor = &HC0C0C0
            If lbl2(x).Left < 960 And lbl2(x).Left > 360 Then
                lblp1(1).Visible = True
                ns = ns + 5
            Else
                lbl1g(1).Visible = True
            End If
        End If
    Next x
ElseIf KeyCode = 51 Then
    For x = 0 To 2
        If lbl3(x).Left < 1200 And lbl3(x).Left > 300 Then
            ns = ns + 5
            nir = nir + 1
            lbl3(x).BackColor = &HC0C0C0
            If lbl3(x).Left < 960 And lbl3(x).Left > 360 Then
                lblp1(2).Visible = True
                ns = ns + 5
            Else
                lbl1g(2).Visible = True
            End If
        End If
    Next x
ElseIf KeyCode = 52 Then
    For x = 0 To 2
        If lbl4(x).Left < 1200 And lbl4(x).Left > 300 Then
            ns = ns + 5
            nir = nir + 1
            lbl4(x).BackColor = &HC0C0C0
            If lbl4(x).Left < 960 And lbl4(x).Left > 360 Then
                lblp1(3).Visible = True
                ns = ns + 5
            Else
                lbl1g(3).Visible = True
            End If
        End If
    Next x
End If
If nir = jim Then
        score = score - 1
        nir = 0
End If
mp = Int(nir / 5)
If mp = 0 Then mp = 1
lblMP = "Multiplyer:  " & mp
ns = ns * mp
score = score + ns
lblscore = "Score:  " & score
End Sub

Private Sub Form_Load()

picMan.Width = 2000
picMan.Height = 3000
If gametype = 2 Then
    timerscore.Interval = 100
Else
    timerscore.Interval = 0
    lblopp.Visible = False
End If
Reload
Draw
Dim path As String
Open "\\Gk08\student work\this is not rockhero beta\song.txt" For Input As #1
    Input #1, song
Close #1
song = Trim(song)
'path = "E:\" & song & "recording.txt"
path = "\\Gk08\student work\this is not rockhero beta\" & song & "recording.txt"
Open path For Input As #1
Dim i As Long
Dim strline As String
For i = 1 To 100000
    If EOF(1) Then Exit For
    Line Input #1, strline
    strline = Trim(strline)
    bob(i).what = Val(Mid(strline, 1, 2))
    bob(i).when = Val(Mid(strline, 5, 20))
    'List1.AddItem bob(i)2----------.what & "-" & bob(i).when
Next i
Close #1
ter = 2
Dim songpath As String
'songpath = "E:\" & song & ".wav"
songpath = "\\Gk08\student work\this is not rockhero beta\" & song & ".wav"
    sndPlaySound songpath, SND_ASYNC
    jimy = -50
End Sub

Private Sub Timer1_Timer()
jimy = jimy + 1
'If jimy = 4600 Then
  '  sndPlaySound "E:\gmea\rb.wav", SND_ASYNC
    'sndPlaySound "\\Gk08\student work\oreh kcor\rb.wav", SND_ASYNC
'End If
If bob(ter).when = bob(ter + 1).when Then
    bob(ter + 1).when = bob(ter + 1).when + 1
End If


 If jimy = (bob(ter).when - 140) Then
    KeyCode = bob(ter).what
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
    ter = ter + 1
End If
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
        lbl1(x).Left = 5235
        lbl1(x).Enabled = False
        lbl1(x).Visible = False
        key1(x + 1).moving = 0
        lbl1(x).BackColor = &HFF&
    End If
Next x
For x = 0 To 2
    If lbl2(x).Left < 10 Then
        lbl2(x).Left = 5235
        lbl2(x).Enabled = False
        lbl2(x).Visible = False
        key2(x + 1).moving = 0
        lbl2(x).BackColor = &H8000&
    End If
Next x
For x = 0 To 2
    If lbl3(x).Left < 10 Then
        lbl3(x).Left = 5235
        lbl3(x).Enabled = False
        lbl3(x).Visible = False
        key3(x + 1).moving = 0
        lbl3(x).BackColor = &HFF0000
    End If
Next x
For x = 0 To 2
    If lbl4(x).Left < 10 Then
        lbl4(x).Left = 5235
        lbl4(x).Enabled = False
        lbl4(x).Visible = False
        key4(x + 1).moving = 0
        lbl4(x).BackColor = &HC0C0&
    End If
Next x
End Sub

Private Sub Timer3_Timer()
For x = 0 To 2
    If lbl1(x).Left <= 360 Then
        If lbl1(x).BackColor <> &HC0C0C0 Then
            'score = score - 1
            nir = 0
            lblm1(0).Visible = True
        End If
    End If
Next x
For x = 0 To 2
    If lbl2(x).Left <= 360 Then
        If lbl2(x).BackColor <> &HC0C0C0 Then
            'score = score - 1
            nir = 0
            lblm1(1).Visible = True
        End If
    End If
Next x
For x = 0 To 2
    If lbl3(x).Left <= 360 Then
        If lbl3(x).BackColor <> &HC0C0C0 Then
            'score = score - 1
            nir = 0
            lblm1(2).Visible = True
        End If
    End If
Next x
For x = 0 To 2
    If lbl4(x).Left <= 360 Then
        If lbl4(x).BackColor <> &HC0C0C0 Then
            'score = score - 1
            nir = 0
            lblm1(3).Visible = True
        End If
    End If
Next x
'mp = Int(nir / 5)
'If mp = 0 Then mp = 1
'If score < 0 Then score = 0
'lblscore = "Score:  " & mp * score
'lblMP = "Multiplyer:  " & mp
mp = Int(nir / 5)
If mp = 0 Then mp = 1
lblMP = "Multiplyer:  " & mp
ns = 0
ns = ns * mp
score = score + ns
lblscore = "Score:  " & score + ns
End Sub

Private Sub Timer4_Timer()
For x = 0 To 3
    lbl1g(x).Visible = False
    lblp1(x).Visible = False
    lblm1(x).Visible = False
Next x
End Sub

Private Sub Timer5_Timer()
i = i + 1

If style = 0 Then
    Basic
ElseIf style = 1 Then
    Medium
ElseIf style = 2 Then
    Good
ElseIf style = 3 Then
    Amazing
End If

Draw
picMan.Cls
Draw
End Sub

Private Sub Timer6_Timer()
If mp = 1 Then
    style = 0
    Timer5.Interval = 200
    picMan.DrawWidth = 3
    picMan.FillColor = vbWhite
    picMan.ForeColor = vbWhite
    Reload
ElseIf mp <= 3 And mp > 1 Then
    style = 1
    Timer5.Interval = 100
    picMan.DrawWidth = 6
    picMan.FillColor = vbBlue
    picMan.ForeColor = vbBlue
    Reload
ElseIf mp > 3 And mp <= 5 Then
    style = 2
    Timer5.Interval = 70
    picMan.DrawWidth = 8
    picMan.FillColor = vbBlack
    picMan.ForeColor = vbBlack
    Reload
ElseIf mp > 5 Then
    style = 3
    Timer5.Interval = 40
    picMan.DrawWidth = 12
    picMan.FillColor = vbRed
    picMan.ForeColor = vbRed
    Reload
End If
End Sub

Private Sub timerscore_Timer()
On Error Resume Next
'Kill "\\Gk08\student work\this is not rockhero beta\score" & playa & ".txt"
Open "\\Gk08\student work\this is not rockhero beta\score" & playa & ".txt" For Output As #1
    Print #1, score
Close #1
If playa = 1 Then
    othaplaya = 2
ElseIf playa = 2 Then
    othaplaya = 1
End If

Open "\\Gk08\student work\this is not rockhero beta\score" & othaplaya & ".txt" For Input As #1
    Dim filesize As Long
    filesize = LOF(1)
    otherguysscore = Input(filesize, 1)
Close #1
If otherguysscore > oos Then
    lblopp = "Oppoents score:  " & Val(otherguysscore)
    oos = otherguysscore
End If
End Sub
