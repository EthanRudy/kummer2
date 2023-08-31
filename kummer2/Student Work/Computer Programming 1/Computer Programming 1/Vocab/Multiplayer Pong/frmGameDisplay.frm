VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmGameDisplay 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Network Pong"
   ClientHeight    =   3495
   ClientLeft      =   945
   ClientTop       =   1455
   ClientWidth     =   7005
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3495
   ScaleMode       =   0  'User
   ScaleWidth      =   4735.467
   Begin MSWinsockLib.Winsock tcpClient 
      Left            =   0
      Top             =   420
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemotePort      =   55555
   End
   Begin MSWinsockLib.Winsock tcpServer 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   55555
   End
   Begin VB.Shape pad 
      BorderColor     =   &H008080FF&
      FillColor       =   &H008080FF&
      FillStyle       =   0  'Solid
      Height          =   90
      Index           =   2
      Left            =   3105
      Top             =   15
      Width           =   810
   End
   Begin VB.Shape pad 
      BorderColor     =   &H008080FF&
      FillColor       =   &H008080FF&
      FillStyle       =   0  'Solid
      Height          =   105
      Index           =   1
      Left            =   3105
      Top             =   3375
      Width           =   810
   End
   Begin VB.Shape ball 
      BorderColor     =   &H00FFFFFF&
      FillColor       =   &H0000FFFF&
      FillStyle       =   0  'Solid
      Height          =   150
      Left            =   3405
      Shape           =   3  'Circle
      Top             =   120
      Width           =   225
   End
End
Attribute VB_Name = "frmGameDisplay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public gameOn As Boolean
Public X As Integer
Public Y As Integer
Public dx As Integer
Public dy As Integer
Public pospad1 As Integer
Public pospad2 As Integer
Private coord() As String
Private ppads() As String
Public winner1 As Boolean

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
 If frmSetup.serverside = True Then
  If KeyCode = vbKeyLeft Then pospad1 = pospad1 - 270
  If KeyCode = vbKeyRight Then pospad1 = pospad1 + 270
  If pospad1 < -270 Then pospad1 = -270
  If pospad1 > 4343 Then pospad1 = 4343
  pad(1).Left = pospad1
 Else
  If KeyCode = vbKeyLeft Then pospad2 = pospad2 - 270
  If KeyCode = vbKeyRight Then pospad2 = pospad2 + 270
  If pospad2 < -270 Then pospad2 = -270
  If pospad2 > 4343 Then pospad2 = 4343
  pad(2).Left = pospad2
 End If
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
 If frmSetup.serverside = True Then
  pad(1).Left = pospad1
  tcpServer.SendData "ppads|" + Str(pospad1) + "|" + Str(pospad2)
 Else
  pad(2).Left = pospad2
  tcpClient.SendData "ppads|" + Str(pospad1) + "|" + Str(pospad2)
 End If
End Sub

Private Sub tcpClient_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
 MsgBox "Attempt to connect to server was unsuccessful", vbExclamation, "CONNECT UNSUCCESSFUL"
 frmSetup.unsuccessful = True
 tcpClient.Close
End Sub

Private Sub tcpServer_ConnectionRequest(ByVal requestID As Long)
 If tcpServer.State <> sckClosed Then
  tcpServer.Close
 End If
 
 tcpServer.Accept requestID
 
 tcpServer.SendData "names|" + frmSetup.nameServer + "|"
 frmWait.cmdReady.Enabled = True
 
End Sub

Private Sub tcpServer_DataArrival(ByVal bytesTotal As Long)
Dim strdata As String
tcpServer.GetData strdata

If Left(strdata, 5) = "names" Then
 frmSetup.nameClient = getName(strdata)
 frmWait.txtPlayers = frmSetup.nameServer + vbCrLf + frmSetup.nameClient
End If
 
If strdata = "ready" Then
 frmWait.Hide
 frmGameDisplay.Show
 gameOn = True
 dx = 20
 dy = 20
 pospad1 = pad(1).Left
 pospad2 = pad(2).Left
 Randomize
 X = Int(Rnd() * (4460))
 Y = 10
 ball.Left = X
 ball.Top = Y
 tcpServer.SendData "coord|" + Str(X) + "|" + Str(Y) + "|" + Str(dx) + "|" + Str(dy)
 tcpServer.SendData "ppads|" + Str(pospad1) + "|" + Str(pospad2)
 playGame
End If

If Left(strdata, 5) = "coord" Then
 coord = Split(strdata, "|")
 X = Val(coord(1))
 Y = Val(coord(2))
 dx = Val(coord(3))
 dy = Val(coord(4))
End If

If Left(strdata, 5) = "ppads" Then
 ppads = Split(strdata, "|")
 pospad2 = Val(ppads(2))
 pad(2).Left = pospad2
End If

End Sub

Private Sub tcpClient_DataArrival(ByVal bytesTotal As Long)
Dim strdata As String
tcpClient.GetData strdata

If Left(strdata, 5) = "names" Then
 frmSetup.nameServer = getName(strdata)
 frmWait.txtPlayers = frmSetup.nameServer + vbCrLf + frmSetup.nameClient
 tcpClient.SendData "names|" + frmSetup.nameClient + "|"
End If

If strdata = "ready" Then
 frmWait.Hide
 frmGameDisplay.Show
 gameOn = True
 dx = 20
 dy = 20
 pospad1 = pad(1).Left
 pospad2 = pad(2).Left
 Randomize
 X = Int(Rnd() * (4460))
 Y = 10
 ball.Left = X
 ball.Top = Y
 tcpClient.SendData "coord|" + Str(X) + "|" + Str(Y) + "|" + Str(dx) + "|" + Str(dy) + "|" + Str(pospad1) + "|" + Str(pospad2)
 tcpClient.SendData "ppads|" + Str(pospad1) + "|" + Str(pospad2)
 playGame
End If

If Left(strdata, 5) = "coord" Then
 coord = Split(strdata, "|")
 X = Val(coord(1))
 Y = Val(coord(2))
 dx = Val(coord(3))
 dy = Val(coord(4))
End If

If Left(strdata, 5) = "ppads" Then
 ppads = Split(strdata, "|")
 pospad1 = Val(ppads(1))
 pad(1).Left = pospad1
End If

If Left(strdata, 6) = "winner" Then
 If Mid(strdata, 8, 1) = "1" Then winner1 = True
 If Mid(strdata, 8, 1) = "2" Then winner1 = False
 gameOn = False
End If

End Sub

Private Function getName(strdata As String) As String
Dim i As Integer
  
  For i = 7 To Len(strdata)
   If Mid(strdata, i, 1) <> "|" Then getName = getName + Mid(strdata, i, 1)
  Next i

End Function

Public Sub playGame()

 While gameOn = True
  DoEvents
  If frmSetup.serverside = True Then
   
   Delay (15)
   ball.Left = X
   ball.Top = Y
   
   If (X > 4613) Then
    dx = -(dx)
    tcpServer.SendData "coord|" + Str(X) + "|" + Str(Y) + "|" + Str(dx) + "|" + Str(dy)
   End If
   
   If (X < 0) Then
    dx = -(dx)
    tcpServer.SendData "coord|" + Str(X) + "|" + Str(Y) + "|" + Str(dx) + "|" + Str(dy)
   End If
   
   If (Y > 3240) And ((X > pospad1 - 60) And (X < pospad1 + 488)) Then
    dy = -(dy)
    tcpServer.SendData "coord|" + Str(X) + "|" + Str(Y) + "|" + Str(dx) + "|" + Str(dy)
   End If
   
   If (Y < 100) And ((X > pospad2 - 60) And (X < pospad2 + 488)) Then
    dy = -(dy)
    tcpServer.SendData "coord|" + Str(X) + "|" + Str(Y) + "|" + Str(dx) + "|" + Str(dy)
   End If
   
   If ((Y > 3345) And Not ((X > pospad1 - 60) And (X < pospad1 + 488))) Then
    winner1 = False
    gameOn = False
    tcpServer.SendData "winner|2"
   End If
   
   If ((Y < 0) And Not ((X > pospad2 - 60) And (X < pospad2 + 488))) Then
    winner1 = True
    gameOn = False
    tcpServer.SendData "winner|1"
   End If
   
   X = X + dx
   Y = Y + dy
   
  Else
  
   Delay (15)
   ball.Left = X
   ball.Top = Y
   X = X + dx
   Y = Y + dy
  End If
 Wend
  
 If winner1 = True Then
  MsgBox Replace(frmSetup.nameServer, "...Ready", "") + " is the winner.", vbInformation, "WE HAVE A WINNER"
 Else
  MsgBox Replace(frmSetup.nameClient, "...Ready", "") + " is the winner.", vbInformation, "WE HAVE A WINNER"
 End If
 
 If tcpServer.State <> sckClosed Then
  tcpServer.Close
 End If
 
 If tcpClient.State <> sckClosed Then
  tcpClient.Close
 End If
 
 frmWait.cmdReady.Enabled = True
 frmGameDisplay.Hide
 frmSetup.Show
 frmSetup.unsuccessful = False
 frmSetup.nameClient = ""
 frmSetup.nameServer = ""
 frmSetup.serverside = False
End Sub
