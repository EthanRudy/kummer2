VERSION 5.00
Begin VB.Form frmmenu 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Tanks!"
   ClientHeight    =   7605
   ClientLeft      =   2670
   ClientTop       =   2415
   ClientWidth     =   9960
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7605
   ScaleWidth      =   9960
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Network"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   855
      Left            =   3960
      TabIndex        =   0
      Top             =   4080
      Width           =   3975
   End
   Begin VB.Image Image3 
      Height          =   885
      Left            =   4200
      Picture         =   "frmmenu.frx":0000
      Top             =   5160
      Width           =   1305
   End
   Begin VB.Image Image2 
      Height          =   795
      Left            =   3480
      Picture         =   "frmmenu.frx":3D1A
      Top             =   2400
      Width           =   2865
   End
   Begin VB.Image Image1 
      Height          =   765
      Left            =   3480
      Picture         =   "frmmenu.frx":B49C
      Top             =   1200
      Width           =   2865
   End
   Begin VB.Image imgbckgrd 
      Height          =   9525
      Left            =   0
      Picture         =   "frmmenu.frx":1279E
      Top             =   0
      Width           =   13485
   End
End
Attribute VB_Name = "frmmenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Image2_Click()
frmplyrchoose.Visible = True
frmmenu.Visible = False

End Sub

Private Sub Image3_Click()
End
End Sub

Private Sub Label1_Click()
Form1.tmrnetwork.Enabled = True
frmplyrchoose.Visible = True
frmmenu.Visible = False
frmplyrchoose.CP1.Visible = False
End Sub
