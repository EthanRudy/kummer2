VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   30
      Left            =   1800
      Top             =   1800
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim r, g, b, dr, dg, db As Integer


Private Sub Form_Load()
r = 0
g = 0
b = 0
dr = 1
dg = 1
db = 1


End Sub

Private Sub Timer1_Timer()
r = r + 2 * dr
If r > 255 Then
    dr = dr * -1
    r = 255
ElseIf r < 0 Then
    dr = dr * -1
    r = 0
End If

g = g + 3 * dg
If g > 255 Then
    dg = dg * -1
    g = 255
ElseIf g < 0 Then
    dg = dg * -1
    g = 0
End If

b = b + 4 * db
If b > 255 Then
    db = db * -1
    b = 255
ElseIf b < 0 Then
    db = db * -1
    b = 0
End If

Form1.BackColor = RGB(r, g, b)


End Sub
