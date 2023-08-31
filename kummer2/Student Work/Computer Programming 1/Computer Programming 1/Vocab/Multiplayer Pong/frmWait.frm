VERSION 5.00
Begin VB.Form frmWait 
   Caption         =   "Player Lobby"
   ClientHeight    =   1245
   ClientLeft      =   2550
   ClientTop       =   2820
   ClientWidth     =   3405
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   1245
   ScaleWidth      =   3405
   Begin VB.TextBox txtPlayers 
      Height          =   540
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   210
      Width           =   1875
   End
   Begin VB.CommandButton cmdReady 
      Caption         =   "Ready"
      Height          =   375
      Left            =   2100
      TabIndex        =   0
      Top             =   375
      Width           =   1305
   End
   Begin VB.Label Label2 
      Caption         =   "Use left and right (not on numpad) to direct your pad."
      Height          =   405
      Left            =   15
      TabIndex        =   3
      Top             =   840
      Width           =   3315
   End
   Begin VB.Label Label1 
      Caption         =   "Players"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   945
   End
End
Attribute VB_Name = "frmWait"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdReady_Click()
 cmdReady.Enabled = False
 If frmSetup.serverside = True Then
  frmSetup.nameServer = frmSetup.nameServer + "...Ready"
  txtPlayers.Text = frmSetup.nameServer + vbCrLf + frmSetup.nameClient
  frmGameDisplay.tcpServer.SendData "names|" + frmSetup.nameServer + "|"
 Else
  frmSetup.nameClient = frmSetup.nameClient + "...Ready"
  txtPlayers.Text = frmSetup.nameServer + vbCrLf + frmSetup.nameClient
  frmGameDisplay.tcpClient.SendData "names|" + frmSetup.nameClient + "|"
 End If
 If Right(frmSetup.nameClient, 8) = "...Ready" And Right(frmSetup.nameServer, 8) = "...Ready" Then
  Delay (500)
  frmWait.Hide
  frmGameDisplay.Show
  If frmSetup.serverside = True Then
   frmGameDisplay.tcpServer.SendData "ready"
  Else
   frmGameDisplay.tcpClient.SendData "ready"
  End If
  frmGameDisplay.gameOn = True
  frmGameDisplay.playGame
 End If
End Sub
