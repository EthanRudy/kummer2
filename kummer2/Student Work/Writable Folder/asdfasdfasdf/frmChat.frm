VERSION 5.00
Begin VB.Form frmChat 
   Caption         =   "Form1"
   ClientHeight    =   7050
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11370
   LinkTopic       =   "Form1"
   ScaleHeight     =   7050
   ScaleWidth      =   11370
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Enter 
      Caption         =   "Enter"
      Height          =   495
      Left            =   4800
      TabIndex        =   1
      Top             =   6240
      Width           =   1935
   End
   Begin VB.Timer tmrChat 
      Interval        =   500
      Left            =   600
      Top             =   5400
   End
   Begin VB.TextBox txtChat 
      Height          =   735
      Left            =   1800
      TabIndex        =   0
      Top             =   5400
      Width           =   8175
   End
   Begin VB.Label lblChat 
      Height          =   4215
      Left            =   1800
      TabIndex        =   2
      Top             =   600
      Width           =   8415
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Chatput As String
Dim chat As String
Dim path As String, fs As Integer
Private Sub Enter_Click()
Chatput = Chatput + Trim(txtChat.Text)
Open path For Output As #1
Print #1, Chatput
Close #1

End Sub

Private Sub Form_Load()
path = "\\Gk08\student work\Writable Folder\Will and Naina\Chat.txt"
End Sub

Private Sub tmrChat_Timer()
    Open path For Input As #1
            fs = LOF(1)
            chat = Input(fs, #1)
            chat = Trim(chat)
    Close #1
    lblChat = chat
End Sub
