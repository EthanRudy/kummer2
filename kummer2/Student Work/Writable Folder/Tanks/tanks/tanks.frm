VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H8000000D&
   Caption         =   "Form1"
   ClientHeight    =   7890
   ClientLeft      =   2520
   ClientTop       =   3090
   ClientWidth     =   14385
   LinkTopic       =   "Form1"
   ScaleHeight     =   7890
   ScaleWidth      =   14385
   Begin VB.Timer Timer7 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   4560
      Top             =   960
   End
   Begin VB.Timer Timer6 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   4080
      Top             =   960
   End
   Begin VB.Timer Timer5 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   3600
      Top             =   960
   End
   Begin VB.Timer Timer4 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   3120
      Top             =   960
   End
   Begin VB.Timer tmrball2 
      Interval        =   30
      Left            =   600
      Top             =   240
   End
   Begin VB.Timer tmrnetwork 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   6360
      Top             =   360
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   10800
      Top             =   480
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   11160
      Top             =   480
   End
   Begin VB.Timer tmr_move_right 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   3480
      Top             =   360
   End
   Begin VB.Timer tmr_move_left 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   3120
      Top             =   360
   End
   Begin VB.Timer Timer1 
      Interval        =   30
      Left            =   120
      Top             =   240
   End
   Begin VB.Label lblp2score 
      BackStyle       =   0  'Transparent
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
      Height          =   735
      Left            =   7680
      TabIndex        =   1
      Top             =   360
      Width           =   2775
   End
   Begin VB.Label lblp1score 
      BackStyle       =   0  'Transparent
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
      Height          =   615
      Left            =   1200
      TabIndex        =   0
      Top             =   360
      Width           =   1575
   End
   Begin VB.Shape imgpb2 
      BorderColor     =   &H00000000&
      FillStyle       =   0  'Solid
      Height          =   135
      Left            =   10920
      Shape           =   3  'Circle
      Top             =   600
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Image Image2 
      Height          =   375
      Left            =   12960
      Picture         =   "tanks.frx":0000
      Top             =   6240
      Width           =   660
   End
   Begin VB.Image Image1 
      Height          =   345
      Left            =   480
      Picture         =   "tanks.frx":0472
      Top             =   6240
      Width           =   660
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H0000C000&
      BackStyle       =   1  'Opaque
      Height          =   1455
      Left            =   0
      Top             =   6480
      Width           =   14415
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   14640
      Y1              =   6480
      Y2              =   6480
   End
   Begin VB.Shape imgpb 
      BackColor       =   &H80000006&
      FillStyle       =   0  'Solid
      Height          =   135
      Left            =   720
      Shape           =   3  'Circle
      Top             =   360
      Width           =   135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim pmx As Single, pmy As Single, pmxo As Single, pmyo As Single
Dim tx As Single, theta As Single, i As Integer
Dim v As Single, ty As Single
Dim pwr As Integer
Dim ang As Single
Dim pmx2 As Single, pmy2 As Single, pmxo2 As Single, pmyo2 As Single
Dim tx2 As Single, theta2 As Single
Dim v2 As Single, ty2 As Single
Dim pwr2 As Integer
Dim ang2 As Single
Dim f As Integer
Dim b As Integer
Dim h As Integer
Dim q As Integer
Dim o As Integer
Dim p2score As Integer
Dim KeyCode As Integer
Dim Shift As Integer
Dim p1score As Integer

Private Sub cmdfire_Click()
f = 1
pwr = 600
ang = 2.1
If pwr > 700 Then
temp = MsgBox("Over the limit", vbOKOnly, "Over")
f = 0
End If
tx = 0
ty = 0
i = 1
theta = ang / 2.1
v = pwr

End Sub

Private Sub Form_Activate()
Scale (0, Form1.Height)-(Form1.Width, 0)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyUp Then
    Timer4.Enabled = True
End If
If KeyCode = vbKeyDown Then
    Timer5.Enabled = True
End If
If KeyCode = vbKeyW Then
    Timer6.Enabled = True
End If
If KeyCode = vbKeyS Then
    Timer7.Enabled = True
End If
If KeyCode = vbKeyLeft Then
    tmr_move_left.Enabled = True
End If
If KeyCode = vbKeyRight Then
    tmr_move_right.Enabled = True
End If
If KeyCode = vbKeySpace Then
    imgpb.Visible = True
    f = 1
    pwr = 600
If pwr > 700 Then
pwr = 690
End If
tx = 0
ty = 0
i = 1
v = pwr
End If
If KeyCode = vbKeyA Then
    Timer3.Enabled = True
End If
If KeyCode = vbKeyD Then
    Timer2.Enabled = True
End If
If KeyCode = vbKeyShift Then
imgpb2.Visible = True
    h = 1
    pwr2 = 600
If pwr2 > 700 Then
pwr2 = 690
End If
tx2 = 0
ty2 = 0
o = 1
v2 = pwr2
End If
End Sub



Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyLeft Then
        tmr_move_left.Enabled = False
    End If
    If KeyCode = vbKeyRight Then
        tmr_move_right.Enabled = False
    End If
        If KeyCode = vbKeyA Then
        Timer3.Enabled = False
    End If
    If KeyCode = vbKeyD Then
        Timer2.Enabled = False
    End If
End Sub

Private Sub Form_Load()
theta = 2.1 / 2.1
theta2 = 4.1 / 2.1
f = 1
imgpb.Visible = True
Kill ("\\Gk08\student work\Writable Folder\Tanks\player2.txt")
Path = "\\Gk08\student work\Writable Folder\Tanks\player2.txt"
Open Path For Output As #1
Print #1, imgpb2.Top
Print #1, imgpb2.Left
Print #1, Image2.Left
Print #1, Image2.Top
Print #1, p2score
Close #1
End Sub





Private Sub Timer1_Timer()
'MsgBox imgpb.Top
'Do While f = 1
If f = 1 Then
For b = 1 To i
'MsgBox imgpb.Top
tx = tx + 1
ty = ty + 1
pmx = v * Cos(theta) * tx + Image1.Left
imgpb.Left = pmx
pmy = (-0.5 * 32 * ty ^ 2) + (v / i * Sin(theta) * ty) + Image1.Top
imgpb.Top = pmy
'If pmy < pmyo + 40 Then
    'i = i + 1
    'ty = 0
'End If
'If imgpb.Left > Width Then
'imgpb.Left = Image1.Left
'imgpb.Top = Image1.Top
'tx = 0
'ty = 0
'f = 0
'imgpb.Visible = False
'Exit For
'End If
'If imgpb.Top < Image1.Top + Image1.Height Then
'imgpb.Left = Image1.Left
'imgpb.Top = Image1.Top
'tx = 0
'ty = 0
'f = 0
'imgpb.Visible = False
'Exit For
'End If
If imgpb.Left > Image2.Left - Image2.Width And imgpb.Left < Image2.Left + 650 And imgpb.Top < Image2.Top + Image2.Height And imgpb.Top > Image2.Top Then
lblp1score = Val(lblp1score) + 10
p1score = p1score + 10
End If
Next b
b = 1
i = 1

End If

'Loop
 '   pmx = pmxo
 '   pmy = pmyo
 '   imgpb.Left = pmx
 '   imgpb.Top = pmy
 '   tx = 0
 '   ty = 0
 '   v = v + 100
 '   i = 1
'End If
'If pmy > Height Then
'    theta = theta - 0.1
 '   v = 400
 '   pmx = pmxo
 '   pmy = pmyo
 '   imgpb.Left = pmx
 '   imgpb.Top = pmy
'End If
End Sub

Private Sub Timer2_Timer()
Image2.Left = Image2.Left + 100
End Sub

Private Sub Timer3_Timer()
Image2.Left = Image2.Left - 100
End Sub

Private Sub Timer4_Timer()
theta = theta + 0.1
Timer4.Enabled = False
End Sub

Private Sub Timer5_Timer()
theta = theta - 0.1
Timer5.Enabled = False
End Sub

Private Sub Timer6_Timer()
theta2 = theta2 + 0.1
Timer6.Enabled = False
End Sub

Private Sub Timer7_Timer()
theta2 = theta2 - 0.1
Timer7.Enabled = False
End Sub

Private Sub tmr_move_left_Timer()
    Image1.Left = Image1.Left - 100
End Sub

Private Sub tmr_move_right_Timer()
    Image1.Left = Image1.Left + 100
End Sub

Private Sub tmrball2_Timer()
If h = 1 Then

For q = 1 To o
'MsgBox imgpb2.Top
tx2 = tx2 + 1
ty2 = ty2 + 1
pmx2 = v2 * Cos(theta2) * tx2 + Image2.Left
imgpb2.Left = pmx2
pmy2 = (-0.5 * 32 * ty2 ^ 2) + (v2 / o * Sin(theta2) * ty2) + Image2.Top
imgpb2.Top = pmy2
'If pmy2 < pmyo2 + 40 Then
    'o = o + 1
    'ty2 = 0
'End If

'If imgpb2.Left > Width Then
'imgpb2.Left = Image2.Left
'imgpb2.Top = Image2.Top
'tx2 = 0
'ty2 = 0
'h = 0
'imgpb2.Visible = False
'Exit For
'End If


'If imgpb2.Top > Image2.Top + Image2.Height + Image2.Height Then
'imgpb2.Left = Image2.Left
'imgpb2.Top = Image2.Top
'tx2 = 0
'ty2 = 0
'h = 0
'imgpb2.Visible = False
'Exit For
'End If

Next q
q = 1
o = 1


End If
'If imgpb2.Top < 1644 Then
'imgpb2.Left = Image2.Left
'imgpb2.Top = Image2.Top
'tx2 = 0
'ty2 = 0
'h = 0
'imgpb2.Visible = False
'End If
If imgpb2.Left > Image1.Left And imgpb2.Left < Image1.Left + Image1.Width And imgpb2.Top < Image1.Top + Image1.Width And imgpb2.Top > Image1.Top Then
lblp2score = Val(lblp2score) + 10
p2score = p2score + 10
End If

End Sub

Private Sub tmrnetwork_Timer()
Path = "\\Gk08\student work\Writable Folder\Tanks\player2.txt"
Open Path For Output As #1
Print #1, imgpb2.Top
Print #1, imgpb2.Left
Print #1, Image2.Left
Print #1, Image2.Top
Print #1, p2score
Print #1, arrp2(1)
Close #1
path2 = "\\Gk08\student work\Writable Folder\Tanks\player1.txt"
Open path2 For Input As #1
For r = 1 To 6
If EOF(1) Then
Exit For
End If
Line Input #1, strline
strline = Trim(strline)
If Len(strline) <> 0 Then
arrnet(r) = strline
End If
Next r
Close #1
imgpb.Top = Val(arrnet(1))
imgpb.Left = Val(arrnet(2))
Image1.Left = Val(arrnet(3))
Image1.Top = Val(arrnet(4))
p1score = Val(arrnet(5))
arrp1(1) = Val(arrnet(6))
If arrp1(1) = "1" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankred.gif")
ElseIf arrp1(1) = "2" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankblue.gif")
ElseIf arrp1(1) = "3" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankpurple.gif")
ElseIf arrp1(1) = "4" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankteal.gif")
ElseIf arrp1(1) = "5" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankyellow.gif")
ElseIf arrp1(1) = "6" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankgreen.gif")
ElseIf arrp1(1) = "7" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankblack.gif")
End If
lblp1score = p1score
End Sub
