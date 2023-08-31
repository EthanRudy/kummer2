VERSION 5.00
Begin VB.Form frmjump 
   Caption         =   "jump"
   ClientHeight    =   5520
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9585
   LinkTopic       =   "Form1"
   ScaleHeight     =   5520
   ScaleWidth      =   9585
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   50
      Left            =   8160
      Top             =   4320
   End
   Begin VB.Image imgbb 
      Height          =   180
      Left            =   3000
      Picture         =   "frmjump.frx":0000
      Top             =   3600
      Width           =   180
   End
End
Attribute VB_Name = "frmjump"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim bsx As Integer
Dim bsy As Integer
Dim flag As Integer
Dim obottom  As Integer
Dim otop As Integer

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyUp Then
 flag = 1
End If
End Sub

Private Sub Form_Load()
bsx = 1
bsy = -1
obottom = imgbb.Top + imgbb.Height
otop = imgbb.Top
flag = 0
End Sub

Private Sub Timer1_Timer()
imgbb.Left = imgbb.Left + bsx * 80
If imgbb.Left > Width Then
    imgbb.Left = 0
End If
If flag = 1 Then
    bsx = 0
    imgbb.Move imgbb.Left + bsx * 80, imgbb.Top + bsy * 80
    If imgbb.Top < otop - 800 Then
        bsy = 1
    End If
    If imgbb.Top + imgbb.Height > obottom Then
        flag = 0
        bsx = 1
        bsy = -1
    End If
End If
End Sub
