VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5415
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7500
   LinkTopic       =   "Form1"
   ScaleHeight     =   5415
   ScaleWidth      =   7500
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   360
      Top             =   2280
   End
   Begin VB.PictureBox pic1 
      Height          =   3615
      Left            =   1800
      ScaleHeight     =   3555
      ScaleWidth      =   3795
      TabIndex        =   0
      Top             =   1080
      Width           =   3855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim nx As Integer
Dim ny As Integer
Dim theta As Single

Private Sub Form_Activate()
pic1.Scale (-20, 20)-(20, -20)
pic1.Line (-20, 0)-(20, 0)
pic1.Line (0, 20)-(0, -20)
End Sub

Private Sub Form_Load()
nx = 0
ny = 0
theta = 0
End Sub

Private Sub Timer1_Timer()
pic1.Cls
theta = theta + 0.1
nx = 18 * Cos(theta)
ny = 18 * Sin(theta)
pic1.Line (-20, 0)-(20, 0)
pic1.Line (0, 20)-(0, -20)
pic1.Line (0, 0)-(nx, ny)

If theta = 6.28 Then
    theta = 0
End If
End Sub
