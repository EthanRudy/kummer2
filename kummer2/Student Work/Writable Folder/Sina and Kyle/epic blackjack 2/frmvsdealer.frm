VERSION 5.00
Begin VB.Form frmvsdealer 
   Caption         =   "Playing Versus Dealer"
   ClientHeight    =   9225
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   13155
   LinkTopic       =   "Form1"
   Picture         =   "frmvsdealer.frx":0000
   ScaleHeight     =   9225
   ScaleWidth      =   13155
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdstand 
      Caption         =   "Stand"
      Height          =   495
      Left            =   9360
      TabIndex        =   8
      Top             =   7320
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CommandButton cmdhit 
      Caption         =   "Hit"
      Height          =   495
      Left            =   7560
      TabIndex        =   7
      Top             =   7320
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.CommandButton cmddeal 
      Caption         =   "Deal"
      Height          =   495
      Left            =   5880
      TabIndex        =   6
      Top             =   7920
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton cmdbet 
      Caption         =   "Place your bet"
      Height          =   495
      Left            =   7560
      TabIndex        =   4
      Top             =   7920
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.CommandButton cmdback 
      Caption         =   "Back to main menu"
      Height          =   495
      Left            =   10920
      TabIndex        =   3
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdstart 
      Caption         =   "Start"
      Height          =   495
      Left            =   9360
      TabIndex        =   1
      Top             =   7920
      Width           =   1335
   End
   Begin VB.ListBox List1 
      Height          =   1230
      Left            =   360
      TabIndex        =   0
      Top             =   7440
      Width           =   615
   End
   Begin VB.Label lbltotalbets 
      Caption         =   "Chips in the pot:"
      Height          =   255
      Left            =   8520
      TabIndex        =   5
      Top             =   1800
      Width           =   3375
   End
   Begin VB.Label lblplayerchips 
      Caption         =   "You currently have 100 chips"
      Height          =   255
      Left            =   1680
      TabIndex        =   2
      Top             =   7920
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   0
      Left            =   1080
      Picture         =   "frmvsdealer.frx":2B9B6
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   1
      Left            =   1680
      Picture         =   "frmvsdealer.frx":2BB93
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   2
      Left            =   2280
      Picture         =   "frmvsdealer.frx":2BD8F
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   3
      Left            =   2760
      Picture         =   "frmvsdealer.frx":2BFAA
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   4
      Left            =   3120
      Picture         =   "frmvsdealer.frx":2C1E7
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   5
      Left            =   3600
      Picture         =   "frmvsdealer.frx":2C440
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   6
      Left            =   3960
      Picture         =   "frmvsdealer.frx":2C6C8
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   7
      Left            =   4320
      Picture         =   "frmvsdealer.frx":2C96D
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   8
      Left            =   4560
      Picture         =   "frmvsdealer.frx":2CC42
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   9
      Left            =   4920
      Picture         =   "frmvsdealer.frx":2CF2C
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   10
      Left            =   5280
      Picture         =   "frmvsdealer.frx":2D233
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   11
      Left            =   5640
      Picture         =   "frmvsdealer.frx":2D72B
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   12
      Left            =   6000
      Picture         =   "frmvsdealer.frx":2DC34
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   13
      Left            =   360
      Picture         =   "frmvsdealer.frx":2E145
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   14
      Left            =   720
      Picture         =   "frmvsdealer.frx":2E30C
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   15
      Left            =   960
      Picture         =   "frmvsdealer.frx":2E4E2
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   16
      Left            =   1200
      Picture         =   "frmvsdealer.frx":2E6D3
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   17
      Left            =   1440
      Picture         =   "frmvsdealer.frx":2E8E3
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   18
      Left            =   1800
      Picture         =   "frmvsdealer.frx":2EB05
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   19
      Left            =   2160
      Picture         =   "frmvsdealer.frx":2ED34
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   20
      Left            =   2520
      Picture         =   "frmvsdealer.frx":2EF78
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   21
      Left            =   2760
      Picture         =   "frmvsdealer.frx":2F1D7
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   22
      Left            =   3000
      Picture         =   "frmvsdealer.frx":2F450
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   23
      Left            =   3360
      Picture         =   "frmvsdealer.frx":2F6F8
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   24
      Left            =   3720
      Picture         =   "frmvsdealer.frx":2FBDA
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   25
      Left            =   4200
      Picture         =   "frmvsdealer.frx":300D1
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   26
      Left            =   6840
      Picture         =   "frmvsdealer.frx":305B3
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   27
      Left            =   7200
      Picture         =   "frmvsdealer.frx":3078D
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   28
      Left            =   7440
      Picture         =   "frmvsdealer.frx":3098A
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   29
      Left            =   7800
      Picture         =   "frmvsdealer.frx":30BA2
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   30
      Left            =   8160
      Picture         =   "frmvsdealer.frx":30DDE
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   31
      Left            =   8520
      Picture         =   "frmvsdealer.frx":31033
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   32
      Left            =   8880
      Picture         =   "frmvsdealer.frx":312AB
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   33
      Left            =   9240
      Picture         =   "frmvsdealer.frx":3153F
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   34
      Left            =   9600
      Picture         =   "frmvsdealer.frx":317EA
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   35
      Left            =   9960
      Picture         =   "frmvsdealer.frx":31ABC
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   36
      Left            =   10320
      Picture         =   "frmvsdealer.frx":31DC1
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   37
      Left            =   10680
      Picture         =   "frmvsdealer.frx":322A2
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   38
      Left            =   11040
      Picture         =   "frmvsdealer.frx":327AF
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   39
      Left            =   1200
      Picture         =   "frmvsdealer.frx":32C9F
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   40
      Left            =   1560
      Picture         =   "frmvsdealer.frx":32F1F
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   41
      Left            =   1920
      Picture         =   "frmvsdealer.frx":3311B
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   42
      Left            =   2280
      Picture         =   "frmvsdealer.frx":33342
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   43
      Left            =   2640
      Picture         =   "frmvsdealer.frx":3357B
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   44
      Left            =   2880
      Picture         =   "frmvsdealer.frx":337D8
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   45
      Left            =   3240
      Picture         =   "frmvsdealer.frx":33A58
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   46
      Left            =   3600
      Picture         =   "frmvsdealer.frx":33CF4
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   47
      Left            =   3960
      Picture         =   "frmvsdealer.frx":33FBB
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   48
      Left            =   4320
      Picture         =   "frmvsdealer.frx":34298
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   49
      Left            =   4680
      Picture         =   "frmvsdealer.frx":345A0
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   50
      Left            =   5040
      Picture         =   "frmvsdealer.frx":34A2C
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image CardImage 
      Height          =   2055
      Index           =   51
      Left            =   8400
      Picture         =   "frmvsdealer.frx":34F0E
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Image Image1 
      Height          =   9315
      Left            =   0
      Picture         =   "frmvsdealer.frx":353D9
      Stretch         =   -1  'True
      Top             =   0
      Width           =   13200
   End
End
Attribute VB_Name = "frmvsdealer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim cardpath As String
Dim allbets As Integer
Dim playerchips As Integer
Dim bet As Integer
Dim winnings As Integer
Dim running As Integer
Sub inputbet()

playerchips = playerchips - bet
lblplayerchips = "You currently have " + Str(playerchips) + " chips."
allbets = allbets + bet
allbets = allbets + bet
cmddeal.Visible = True
cmdbet.Visible = False
lbltotalbets.Visible = True
lbltotalbets.Caption = "There are currently " + Str(allbets) + " chips in the pot."
End Sub

Private Sub cmdback_Click()
frmstart.Show
frmvsdealer.Hide
End Sub

Private Sub faceup_Click()

End Sub

Private Sub faceup1_Click()

End Sub
Private Sub cmdbet_Click()
bet = 0
Do While bet < 1

bet = Int(InputBox("How much would you like to bet? The minimum bet is 1.", "Make your bet.", "1"))

Loop
inputbet
cmddeal.Visible = True
End Sub

Private Sub cmddeal_Click()

Dim i As Integer
Dim number(5) As Integer
Randomize
For i = 0 To 51

CardImage(i).Visible = False

Next i
Dim p As Integer
p = 0
Do While p = 0
For i = 0 To 5
    number(0) = Int(Rnd * 51)
Next i
CardImage(number(0)).Visible = True
CardImage(number(0)).Left = 9840
CardImage(number(1)).Visible = True
CardImage(number(1)).Left = 9840 + 300
CardImage(number(1)).Top = 6000
CardImage(number(0)).Top = 6000
hand(0) = deck(number(0))
hand(1) = deck(number(1))
If deck(number(1)).value <> "n" And deck(number(0)).value <> "n" Then
    p = 1
End If
deck(number(1)).value = "n"
deck(number(0)).value = "n"
Loop


Randomize
For i = 0 To 51
    If deck(i).value <> "n" Then
CardImage(i).Visible = False
    End If
Next i

p = 0
Do While p = 0
For i = 0 To 5
    number(0) = Int(Rnd * 51)
Next i

CardImage(number(0)).Visible = True
CardImage(number(0)).Left = 9840
CardImage(number(1)).Visible = True
CardImage(number(1)).Left = 9840 + 300
CardImage(number(1)).Top = 6000
CardImage(number(0)).Top = 6000
hand(0) = deck(number(0))
hand(1) = deck(number(1))
If deck(number(1)).value <> "n" And deck(number(0)).value <> "n" Then
    p = 1
End If
deck(number(1)).value = "n"
deck(number(0)).value = "n"
Loop
cmddeal.Visible = False
cmdhit.Visible = True
cmdstand.Visible = True

End Sub

Private Sub cmdhit_Click()
Dim number(5) As Integer
Randomize
For i = 0 To 51

CardImage(i).Visible = False

Next i
Dim p As Integer
p = 0
Do While p = 0
For i = 0 To 5
    number(0) = Int(Rnd * 51)
Next i
CardImage(number(0)).Visible = True
CardImage(number(0)).Left = 10000
CardImage(number(0)).Top = 6000
hand(0) = deck(number(0))
hand(1) = deck(number(1))
If deck(number(0)).value <> "n" Then
    p = 1
End If
deck(number(1)).value = "n"
deck(number(0)).value = "n"
Loop


End Sub

Private Sub cmdstand_Click()
Dim tempval As Integer
For z = 0 To (numplayers - 1)
For i = 1 To 10
    
    If hand(i).value = ("0" Or "j" Or "q" Or "k") Then
        tempval = 10
    End If
    player(z).handvalue = player(z).handvalue + tempval
Next i
For i = 1 To 10

    If hand(i).value = 1 And player(z).handvalue < 12 Then
        player(z).handvalue = player(z).handvalue + 10
    End If
Next i
Next z
If player(0).handvalue > player(1).handvalue Then
    lblyouwin.Visible = True
Else
    lblyoulose.Visible = True
End If
End Sub

Private Sub cmdstart_Click()
allbets = 0
lbltotalbets.Visible = True
lbltotalbets.Caption = "There are currently " + Str(allbets) + " chips in the pot."
lblplayerchips.Visible = True
cmdbet.Visible = True

playerchips = 100
running = 1
cmdstart.Visible = False

End Sub
Private Sub Form_Load()

cardpath = "\\Gk08\student work\Writable Folder\Sina and Kyle\epic blackjack"
Dim i As Integer
running = 0
For i = 0 To 51
    CardImage(i).Visible = False
Next i
Dim p As Integer
Dim r As Integer
p = 1
r = 0
Do While p < 5
    For i = 0 To 12 Step 1
        If p = 1 Then
            deck(r).suit = "c"
        ElseIf p = 2 Then
            deck(r).suit = "d"
        ElseIf p = 3 Then
            deck(r).suit = "h"
        ElseIf p = 4 Then
            deck(r).suit = "s"
        End If
        deck(r).value = Trim(Str(i + 1))
        If i = 9 Then deck(r).value = 0
        If i = 10 Then deck(r).value = "j"
        If i = 11 Then deck(r).value = "q"
        If i = 12 Then deck(r).value = "k"
        List1.AddItem deck(r).value + deck(r).suit
        r = r + 1
    Next i
    
    p = p + 1
Loop
numplayers = 2
End Sub

