VERSION 5.00
Begin VB.Form frmmario 
   BackColor       =   &H00FFFFFF&
   Caption         =   "mario"
   ClientHeight    =   12120
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   13995
   FillColor       =   &H00FFFFFF&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   12120
   ScaleWidth      =   13995
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   720
      Top             =   240
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   120
      Top             =   240
   End
   Begin VB.Label Label4 
      Caption         =   "Level:"
      Height          =   255
      Left            =   10320
      TabIndex        =   6
      Top             =   120
      Width           =   495
   End
   Begin VB.Label Label3 
      Caption         =   "Press H to access Highscores (at your own risk)"
      Height          =   615
      Left            =   5520
      TabIndex        =   5
      Top             =   0
      Width           =   1335
   End
   Begin VB.Label lbllvl 
      Height          =   255
      Left            =   10920
      TabIndex        =   4
      Top             =   120
      Width           =   615
   End
   Begin VB.Label lblscore 
      Caption         =   "0"
      Height          =   255
      Left            =   9360
      TabIndex        =   3
      Top             =   120
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Score:"
      Height          =   255
      Left            =   8640
      TabIndex        =   2
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lbllives 
      Caption         =   "3"
      Height          =   255
      Left            =   7920
      TabIndex        =   1
      Top             =   120
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "LIVES:"
      Height          =   255
      Left            =   7320
      TabIndex        =   0
      Top             =   120
      Width           =   495
   End
   Begin VB.Image imgkoopa 
      Height          =   855
      Left            =   1560
      Picture         =   "frmmario.frx":0000
      Top             =   1680
      Width           =   735
   End
   Begin VB.Image imgpow 
      Height          =   735
      Index           =   1
      Left            =   4200
      Picture         =   "frmmario.frx":2136
      Top             =   -240
      Width           =   795
   End
   Begin VB.Image imgmario 
      Height          =   1035
      Left            =   6600
      Picture         =   "frmmario.frx":4018
      Top             =   10560
      Width           =   780
   End
   Begin VB.Image imgrt 
      Height          =   1050
      Left            =   12480
      Picture         =   "frmmario.frx":6A66
      Top             =   1560
      Width           =   1530
   End
   Begin VB.Image imglt 
      Height          =   1050
      Left            =   0
      Picture         =   "frmmario.frx":BEE0
      Top             =   1560
      Width           =   1530
   End
   Begin VB.Shape shprb 
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   3
      Left            =   8280
      Top             =   2640
      Width           =   5775
   End
   Begin VB.Shape shprb 
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   4
      Left            =   0
      Top             =   2640
      Width           =   5295
   End
   Begin VB.Shape shprb 
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   1
      Left            =   12000
      Top             =   6600
      Width           =   2055
   End
   Begin VB.Shape shprb 
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   2
      Left            =   3360
      Top             =   5640
      Width           =   7095
   End
   Begin VB.Shape shprb 
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   5
      Left            =   0
      Top             =   6600
      Width           =   1695
   End
   Begin VB.Image imgrb 
      Height          =   1050
      Left            =   12480
      Picture         =   "frmmario.frx":1135A
      Top             =   10560
      Width           =   1530
   End
   Begin VB.Image imglb 
      Height          =   1050
      Left            =   0
      Picture         =   "frmmario.frx":167D4
      Top             =   10560
      Width           =   1530
   End
   Begin VB.Shape shprb 
      BorderColor     =   &H00000000&
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   7
      Left            =   0
      Top             =   11640
      Width           =   14055
   End
   Begin VB.Shape shprb 
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   0
      Left            =   9360
      Top             =   9120
      Width           =   4695
   End
   Begin VB.Shape shprb 
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   6
      Left            =   0
      Top             =   9120
      Width           =   4455
   End
   Begin VB.Image imgpow 
      Height          =   735
      Index           =   0
      Left            =   6600
      Picture         =   "frmmario.frx":1BC4E
      Top             =   8400
      Width           =   795
   End
End
Attribute VB_Name = "frmmario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim gflag As Integer
Dim r As Integer
Dim l As Integer
Dim u As Integer
Dim d As Integer
Dim t As Single
Dim tl As Single
Dim tr As Single
Dim flag As Integer
Dim rb As Integer
Dim lvl As Integer
Dim drop As Integer
Dim found As Integer
Dim curk As Integer
Dim pow As Integer
Dim powd As Integer
Dim powd2 As Integer
Dim foundk As Integer
Dim cur As Integer
Dim dropk As Integer
Dim lvlscore As Integer
Dim flip As Integer
Dim kill As Integer
Dim lives As Integer
Dim score As Integer
Dim hit As Integer
Dim down As Integer
Dim dflag As Integer
Dim direction As Integer
Dim hits As Integer
Dim ti As Double
Dim tf As Integer
Dim face As Integer

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
    Case vbKeyRight
        r = 1
        tr = Timer
        imgmario.Move imgmario.Left + 200
        If gflag = 1 Then
            imgmario.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\mariojr.bmp")
        ElseIf gflag = 0 Then
            imgmario.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\mario.bmp")
        End If
        face = 1
    Case vbKeyLeft
        l = 1
        imgmario.Move imgmario.Left - 200
        If gflag = 1 Then
            imgmario.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\mariojl.bmp")
        ElseIf gflag = 0 Then
            imgmario.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\mariol.bmp")
        End If
        face = -1
        tl = Timer
    Case vbKeyUp
        If gflag <> 1 Then
            u = 1
            t = Timer
            If face = 1 Then
                imgmario.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\mariojr.bmp")
            ElseIf face = -1 Then
                imgmario.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\mariojl.bmp")
            End If
        End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
If KeyAscii = 104 Then
    frmmario.Hide
    frmhighscores.Show
End If
End Sub

Private Sub Form_Load()
gflag = 0
dropk = 0
hits = 1
lvl = 1
flip = 0
found = 0
direction = 1
lives = 3
Dim i As Integer
i = 0
Open "\\kummer2\Student Work\Writable Folder\Mario by Reece\mariohigh.dat" For Random Access Read As #1 Len = 9
Do While Not EOF(1)
    i = i + 1
    Get #1, , arrscores(i)
Loop
Close #1
End Sub

Private Sub Timer1_Timer()
Dim ans As String
Dim name As String
Dim i As Integer
lbllvl = lvl
Dim j As Integer
Dim temp As highscore
If lives = 0 Then
    ans = MsgBox("Would you like to submit your score?", vbYesNo, "GAME OVER")
    If ans = vbYes Then
                If score > Val(arrscores(10).score) Then
                    name = InputBox("ENTER 3 INITIALS HERERERERE")
                    arrscores(10).score = score
                    arrscores(10).initials = name
                    For i = 1 To 10
                        For j = 1 To 9
                        If Val(arrscores(i).score) > Val(arrscores(j).score) Then
                            temp = arrscores(j)
                            arrscores(j) = arrscores(i)
                            arrscores(i) = temp
                        End If
                        Next j
                    Next i
                Else
                    MsgBox "WOW. You couldn't even beat player: " + arrscores(10).initials + "'s score? YOU LOSER!"
                End If
        Open "\\Gk08\student work\Writable Folder\Mario by Reece\mariohigh.dat" For Random Access Write As #1 Len = 9
        For i = 1 To 10
            Put #1, i, arrscores(i)
        Next i
        Close #1
    End If
    lives = 3
    score = 0
    lblscore = score
    lbllives = lives
    imgmario.Top = 10600
    drop = 1
    imgkoopa.Top = 1300
    dropk = 1
    lvl = 1
End If
Dim dflag As Integer
Dim time As Single
Dim lj As Integer
Dim rj As Integer
Dim dn As Integer
Dim up As Integer
Dim p As Integer
p = 0
If found = 0 Then
    For i = 1 To 8
        If imgmario.Left + imgmario.Width > shprb(i - 1).Left And imgmario.Left < shprb(i - 1).Left + shprb(i - 1).Width And imgmario.Top + imgmario.Height < shprb(i - 1).Top + 70 And imgmario.Top + imgmario.Height > shprb(i - 1).Top - 100 Then
            cur = i - 1
            found = 1
        End If
    Next i
End If
If u = 1 Then
    gflag = 1
End If
If imgmario.Left + imgmario.Width - 100 > frmmario.Width Then
    imgmario.Left = -100
    found = 0
End If
If imgmario.Left + 100 < 0 Then
    imgmario.Left = 13200
    found = 0
End If
        If imgmario.Left + imgmario.Width < shprb(cur).Left Or imgmario.Left > shprb(cur).Left + shprb(cur).Width Then
            drop = 1
            flag = 0
            found = 0
        End If
        For i = 0 To 6
            If imgmario.Top >= shprb(i).Top + 200 And imgmario.Top <= shprb(i).Top + shprb(i).Height And imgmario.Left + imgmario.Width > shprb(i).Left And imgmario.Left < shprb(i).Left + shprb(i).Width Then
                drop = 1
                found = 0
                If imgmario.Left + imgmario.Width / 2 > imgkoopa.Left - 100 And imgmario.Left + imgmario.Width / 2 < imgkoopa.Left + imgkoopa.Width + 100 And imgkoopa.Top < imgmario.Top And imgkoopa.Top > imgmario.Top - 1500 Then
                    If flip = 0 Then
                        flip = 1
                        ti = Timer
                    ElseIf flip = 1 Then
                        flip = 0
                        hits = hits + 1
                        If direction = 1 Then
                            imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopar.bmp")
                        ElseIf direction = -1 Then
                            imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopal.bmp")
                        End If
                    End If
                End If
            End If
        Next i
        For i = 0 To 1
            If imgmario.Top >= imgpow(i).Top + 600 And imgmario.Top <= imgpow(i).Top + imgpow(i).Height And imgmario.Left + imgmario.Width > imgpow(i).Left And imgmario.Left < imgpow(i).Left + imgpow(i).Width And drop = 0 Then
                drop = 1
                pow = 1
                found = 0
                If i = 0 Then
                    powd = powd + 1
                ElseIf i = 1 Then
                    powd2 = powd2 + 1
                End If
            End If
        Next i
        If powd = 3 Then
            imgpow(0).Left = -10000
        End If
        If powd2 = 3 Then
            imgpow(1).Left = -10000
        End If
        If imgmario.Top + imgmario.Height >= shprb(cur).Top And imgmario.Top + imgmario.Height < shprb(cur).Top + 79 And imgmario.Left + imgmario.Width > shprb(cur).Left And imgmario.Left < shprb(cur).Left + shprb(cur).Width Then
            flag = 1
            rb = 1
            drop = 0
            down = 0
            gflag = 1
            If face = 1 Then
                imgmario.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\mario.bmp")
            ElseIf face = -1 Then
                imgmario.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\mariol.bmp")
            End If
            imgmario.Top = shprb(cur).Top - imgmario.Height - 50
        End If
If gflag = 1 Then
    found = 0
    If Timer - t <= 0.9 And drop = 0 Then
        imgmario.Move imgmario.Left, imgmario.Top - 75
    ElseIf Timer - t > 0.9 And flag = 0 And drop <> 1 Then
        drop = 1
    End If
    If flag = 1 Then
        flag = 0
        gflag = 0
        up = 0
        dn = 0
    End If
End If
If drop = 1 Then
    imgmario.Move imgmario.Left, imgmario.Top + 75
    up = 0
    down = 1
    found = 0
ElseIf drop = 0 Then
    down = 0
End If
If flip = 1 Then
    If imgmario.Left > imgkoopa.Left And imgmario.Left < imgkoopa.Left + imgkoopa.Width And imgmario.Top + imgmario.Height - 50 < imgkoopa.Top + imgkoopa.Height And imgmario.Top + imgmario.Height > imgkoopa.Top Or imgmario.Left + imgmario.Width > imgkoopa.Left And imgmario.Left + imgmario.Width < imgkoopa.Left + imgkoopa.Width And imgmario.Top + imgmario.Height - 50 < imgkoopa.Top + imgkoopa.Height And imgmario.Top + imgmario.Height > imgkoopa.Top Then
        kill = 1
    End If
ElseIf flip = 0 Then
    If imgmario.Left > imgkoopa.Left And imgmario.Left < imgkoopa.Left + imgkoopa.Width And imgmario.Top + imgmario.Height - 50 < imgkoopa.Top + imgkoopa.Height And imgmario.Top + imgmario.Height > imgkoopa.Top Or imgmario.Left + imgmario.Width > imgkoopa.Left And imgmario.Left + imgmario.Width < imgkoopa.Left + imgkoopa.Width And imgmario.Top + imgmario.Height - 50 < imgkoopa.Top + imgkoopa.Height And imgmario.Top + imgmario.Height > imgkoopa.Top Then
        lives = lives - 1
        imgmario.Top = 300
        imgmario.Left = 7000
        found = 0
        drop = 1
        lbllives = lives
    End If
End If
u = 0
r = 0
l = 0
down = 0
End Sub

Private Sub Timer2_Timer()
Dim time As Double
Dim lj As Integer
Dim rj As Integer
Dim dn As Integer
Dim up As Integer
Dim p As Integer
If flip = 1 And Timer > ti + 7 Then
    hits = hits + 1
    flip = 0
    If direction = 1 Then
        imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopar.bmp")
    ElseIf direction = -1 Then
        imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopal.bmp")
    End If
End If
If kill <> 1 Then
    If flip <> 1 Then
        If pause = 0 Then
            imgkoopa.Move imgkoopa.Left + 25 * direction * (1 + (lvl / 4)) * (1 + ((hits - 1) / 2))
        End If
    End If
    If flip = 1 Then
        imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopaf.bmp")
    End If
    If pow = 1 And dropk = 0 Then
        ti = Timer
        If flip = 1 Then
            flip = 0
            pow = 0
            If direction = 1 Then
                imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopar.bmp")
            ElseIf direction = -1 Then
                imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopal.bmp")
            End If
        ElseIf flip = 0 Then
            pow = 0
            flip = 1
            imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopaf.bmp")
        End If
    End If
    p = 0
    If foundk = 0 Then
        For i = 1 To 8
            If imgkoopa.Left + imgkoopa.Width > shprb(i - 1).Left And imgkoopa.Left < shprb(i - 1).Left + shprb(i - 1).Width And imgkoopa.Top + imgkoopa.Height < shprb(i - 1).Top And imgkoopa.Top + imgkoopa.Height > shprb(i - 1).Top - 100 Then
                curk = i - 1
                foundk = 1
            End If
        Next i
    End If
    If u = 1 Then
        gflag = 1
    End If
    If imgkoopa.Left + imgkoopa.Width - 100 > frmmario.Width Then
        imgkoopa.Left = -100
        foundk = 0
    End If
    If imgkoopa.Left + 100 < 0 Then
        imgkoopa.Left = 13200
        foundk = 0
    End If
    If imgkoopa.Left + imgkoopa.Width < shprb(curk).Left Or imgkoopa.Left > shprb(curk).Left + shprb(curk).Width Then
        dropk = 1
        foundk = 0
    End If
    If imgkoopa.Top + imgkoopa.Height >= shprb(curk).Top And imgkoopa.Top + imgkoopa.Height < shprb(curk).Top + 60 And imgkoopa.Left + imgkoopa.Width > shprb(curk).Left And imgkoopa.Left < shprb(curk).Left + shprb(curk).Width Then
        rb = 1
        dropk = 0
        imgkoopa.Top = shprb(curk).Top - imgkoopa.Height - 60
    End If
    If dropk = 1 Then
        imgkoopa.Move imgkoopa.Left, imgkoopa.Top + 55
        up = 0
        dn = 1
        foundk = 0
    End If
    If imgkoopa.Left > imgrb.Left And imgkoopa.Top > imgrb.Top Then
        imgkoopa.Left = 12300
        imgkoopa.Top = 1500
        foundk = 0
        dropk = 1
        direction = -1
        imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopal.bmp")
    ElseIf imgkoopa.Left + imgkoopa.Width < imglb.Left + imglb.Width And imgkoopa.Top > imglb.Top Then
        imgkoopa.Left = 300
        imgkoopa.Top = 1500
        foundk = 0
        dropk = 1
        direction = 1
        imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopar.bmp")
    End If
ElseIf kill = 1 Then
    imgkoopa.Move imgkoopa.Left, imgkoopa.Top + 100
End If
If imgkoopa.Top > frmmario.Height Then
    If direction = 1 Then
        imgkoopa.Left = 12300
        imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopal.bmp")
    Else
        imgkoopa.Left = 300
        imgkoopa.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Mario by Reece\koopar.bmp")
    End If
    direction = direction * -1
    imgkoopa.Top = 1500
    flip = 0
    kill = 0
    dropk = 1
    score = score + 100
    hits = 1
    lvlscore = lvlscore + 100
    If lvlscore = lvl * 100 Then
        lvl = lvl + 1
        lvlscore = 0
        MsgBox "proceed to lvl " + Str(lvl)
    End If
    lblscore = score
    imgpow(0).Left = 6600
    powd = 0
    powd2 = 1
    imgpow(1).Left = 4440
End If
If dropk = 1 Then
    dflag = 0
ElseIf dropk = 0 Then
    dflag = 1
End If
pow = 0
End Sub
