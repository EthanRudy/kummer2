VERSION 5.00
Begin VB.Form frmstart 
   Caption         =   "Start Game"
   ClientHeight    =   8955
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11970
   LinkTopic       =   "Form1"
   Picture         =   "frmstart.frx":0000
   ScaleHeight     =   8955
   ScaleWidth      =   11970
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdonline 
      Caption         =   "Online"
      Height          =   615
      Left            =   8640
      TabIndex        =   3
      Top             =   3840
      Width           =   2535
   End
   Begin VB.CommandButton cmdquit 
      Caption         =   "Quit"
      Height          =   615
      Left            =   8640
      TabIndex        =   2
      Top             =   4560
      Width           =   2535
   End
   Begin VB.CommandButton cmdvsdealer 
      Caption         =   "Versus the dealer"
      Height          =   615
      Left            =   8640
      TabIndex        =   1
      Top             =   3120
      Width           =   2535
   End
   Begin VB.CommandButton cmdhowto 
      Caption         =   "How to play"
      Height          =   615
      Left            =   8640
      TabIndex        =   0
      Top             =   2400
      Width           =   2535
   End
   Begin VB.Image Image1 
      Height          =   9015
      Left            =   0
      Picture         =   "frmstart.frx":2434
      Stretch         =   -1  'True
      Top             =   0
      Width           =   11925
   End
End
Attribute VB_Name = "frmstart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdhowto_Click()

Dim ans As String
ans = "a"
Dim general As String
general = "Blackjack, the game most commonly played in casinos everywhere, is now available on your computer!"
Dim online As String
online = "To play an online game, make sure you and a friend are on the same network. Find who is going to host. Have the host create their game and note the path to your game. Have all other players join the game."
Dim dealer As String
dealer = "Versus the dealer: You will be playing single player blackjack against the dealer. You start out with 100 chips and can bet any amount per turn; the dealer matches your bet. Make sure you don't bust! If you do, the dealer wins!"
Do While ans = "a"
    ans = MsgBox(general + vbNewLine + vbNewLine + "General Rules: Each player is dealed two cards that they don't show to any of the other players. The overall goal of the game is to get the sum of the value of your cards as close to 21 as possible without going over (Queens, Kings, Jacks each equal 10, Ace can equal 11 or 1). If your first two cards are a face card and an ace, you got 21. If your first two cards were an ace and a Jack of clubs or spades, you got blackjack and will receive double the payout. Each round, you have a choice. You can either be dealed another card ('Hit me!'), or stay with the cards you currently are at ('Stay'). You make your bet before you are dealed your first two cards." + vbNewLine + vbNewLine + dealer, vbOKOnly, "How to play")
    ans = MsgBox(online, vbOKOnly, "How to play")
Loop

End Sub

Private Sub cmdquit_Click()
End
End Sub

Private Sub cmdvsdealer_Click()
frmvsdealer.Show
frmstart.Hide

End Sub
