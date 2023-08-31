VERSION 5.00
Begin VB.Form frmstart 
   Caption         =   "Space Invaders"
   ClientHeight    =   8580
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9510
   LinkTopic       =   "Form1"
   ScaleHeight     =   8580
   ScaleWidth      =   9510
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtinstructions 
      BackColor       =   &H80000001&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   3615
      Left            =   1080
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "frmstart.frx":0000
      Top             =   3240
      Width           =   7335
   End
   Begin VB.Label lblstart 
      BackStyle       =   0  'Transparent
      Height          =   615
      Left            =   1560
      TabIndex        =   0
      Top             =   7560
      Width           =   6615
   End
   Begin VB.Image Image1 
      Height          =   8595
      Left            =   0
      Picture         =   "frmstart.frx":0008
      Top             =   0
      Width           =   9540
   End
End
Attribute VB_Name = "frmstart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
txtinstructions = "Instructions: The invaders are closing in! They're here to destroy Earth! It's your responsibility to take them out. Use the space bar to fire, and shift button to switch weapons. It will start on a lethal missle, but you can change it to a stun missle, or even a nuke. You can only use the nuke once, so don't waste it! Use the arrow keys to move your ship around. The mothership will come in at a random time, destroy it to earn a random number of points! You will get a time and accuracy bonus when you finish. Kill the invaders before they get to the surface!"
End Sub

Private Sub lblstart_Click()
frmplay.Show
frmstart.Hide
End Sub
