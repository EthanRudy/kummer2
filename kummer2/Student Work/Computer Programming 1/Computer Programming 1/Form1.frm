VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Beep"
   ClientHeight    =   1305
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   1560
   LinkTopic       =   "Form1"
   ScaleHeight     =   1305
   ScaleWidth      =   1560
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtLength 
      Height          =   285
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Beep"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   1335
   End
   Begin VB.TextBox txtFrequency 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function APIBeep Lib "kernel32" Alias _
    "Beep" (ByVal dwFreq As Long, ByVal dwDuration As Long) _
    As Long

Private Sub Command1_Click()
Dim frequency As Long
Dim length As Long
    length = CLng(txtLength.Text)
    frequency = CLng(txtFrequency.Text)
    APIBeep frequency, length
End Sub

