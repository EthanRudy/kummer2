VERSION 5.00
Begin VB.Form frmSetup 
   Caption         =   "Game Setup"
   ClientHeight    =   3270
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5205
   LinkTopic       =   "Form1"
   ScaleHeight     =   3270
   ScaleWidth      =   5205
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Connect to Game"
      Height          =   3225
      Left            =   2610
      TabIndex        =   1
      Top             =   0
      Width           =   2535
      Begin VB.TextBox txtIPaddress 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1020
         TabIndex        =   9
         Top             =   1230
         Width           =   1425
      End
      Begin VB.TextBox txtNameConnector 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1020
         MaxLength       =   10
         TabIndex        =   6
         Top             =   675
         Width           =   1425
      End
      Begin VB.CommandButton cmdConnect 
         Caption         =   "Connect"
         Height          =   510
         Left            =   615
         TabIndex        =   3
         Top             =   2655
         Width           =   1320
      End
      Begin VB.Label Label3 
         Caption         =   "IP address :"
         Height          =   270
         Left            =   90
         TabIndex        =   8
         Top             =   1245
         Width           =   840
      End
      Begin VB.Label Label2 
         Caption         =   "Your name :"
         Height          =   270
         Left            =   75
         TabIndex        =   7
         Top             =   690
         Width           =   870
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Create Game"
      Height          =   3225
      Left            =   15
      TabIndex        =   0
      Top             =   0
      Width           =   2535
      Begin VB.TextBox txtNameCreator 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1020
         MaxLength       =   10
         TabIndex        =   4
         Top             =   675
         Width           =   1425
      End
      Begin VB.CommandButton cmdCreate 
         Caption         =   "Create Game"
         Height          =   510
         Left            =   600
         TabIndex        =   2
         Top             =   2655
         Width           =   1320
      End
      Begin VB.Label Label1 
         Caption         =   "Your name :"
         Height          =   270
         Left            =   75
         TabIndex        =   5
         Top             =   690
         Width           =   870
      End
   End
End
Attribute VB_Name = "frmSetup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public nameServer As String
Public nameClient As String
Public unsuccessful As Boolean
Public serverside As Boolean

Private Sub cmdConnect_Click()
 nameClient = txtNameConnector.Text
 
 If txtNameConnector.Text = "" Or txtIPaddress.Text = "" Then
  MsgBox "You are missing a required field.", vbExclamation, "MISSING FIELD"
  Exit Sub
 End If
 
 frmGameDisplay.tcpClient.RemoteHost = txtIPaddress.Text
 
 On Error GoTo endit
 frmGameDisplay.tcpClient.Connect
 frmConnecting.Show
 Delay (1500)
 frmConnecting.Hide
 If unsuccessful = True Then Exit Sub
 frmSetup.Hide
 frmWait.Show
 Exit Sub
 
endit:
 frmConnecting.Show
 Delay (1500)
 frmConnecting.Hide
 MsgBox "No route to the specified host.", vbExclamation, "NO ROUTE"
End Sub

Private Sub cmdCreate_Click()
 serverside = True
 nameServer = txtNameCreator.Text

 If txtNameCreator.Text = "" Then
  MsgBox "Enter a name please.", vbExclamation, "NO NAME ENTERED"
  Exit Sub
 End If
 
 frmGameDisplay.tcpServer.Listen
 frmSetup.Hide
 frmWait.cmdReady.Enabled = False
 frmWait.Show
 frmWait.txtPlayers.Text = nameServer
 
End Sub

