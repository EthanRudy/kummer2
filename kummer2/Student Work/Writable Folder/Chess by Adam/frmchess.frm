VERSION 5.00
Begin VB.Form frmchess 
   Caption         =   "Chess"
   ClientHeight    =   11985
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   13320
   LinkTopic       =   "Form1"
   ScaleHeight     =   11985
   ScaleWidth      =   13320
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   120
      Top             =   11400
   End
   Begin VB.Label lblplayerblack 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4920
      TabIndex        =   1
      Top             =   240
      Width           =   2295
   End
   Begin VB.Label lblplayerwhite 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5400
      TabIndex        =   0
      Top             =   11160
      Width           =   2295
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   88
      Left            =   9960
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   78
      Left            =   8760
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   68
      Left            =   7560
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   58
      Left            =   6360
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   48
      Left            =   5160
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   38
      Left            =   3960
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   28
      Left            =   2760
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   18
      Left            =   1560
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   87
      Left            =   9960
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   77
      Left            =   8760
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   67
      Left            =   7560
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   57
      Left            =   6360
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   47
      Left            =   5160
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   37
      Left            =   3960
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   27
      Left            =   2760
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   86
      Left            =   9960
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   76
      Left            =   8760
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   66
      Left            =   7560
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   56
      Left            =   6360
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   46
      Left            =   5160
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   36
      Left            =   3960
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   26
      Left            =   2760
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   85
      Left            =   9960
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   75
      Left            =   8760
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   65
      Left            =   7560
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   55
      Left            =   6360
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   45
      Left            =   5160
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   35
      Left            =   3960
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   25
      Left            =   2760
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   84
      Left            =   9960
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   74
      Left            =   8760
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   64
      Left            =   7560
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   54
      Left            =   6360
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   44
      Left            =   5160
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   34
      Left            =   3960
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   24
      Left            =   2760
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   83
      Left            =   9960
      Top             =   7200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   73
      Left            =   8760
      Top             =   7200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   63
      Left            =   7560
      Top             =   7200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   53
      Left            =   6360
      Top             =   7200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   43
      Left            =   5160
      Top             =   7200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   33
      Left            =   3960
      Top             =   7200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   23
      Left            =   2760
      Top             =   7200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   17
      Left            =   1560
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   16
      Left            =   1560
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   15
      Left            =   1560
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   14
      Left            =   1560
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   13
      Left            =   1560
      Top             =   7200
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   82
      Left            =   9960
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   72
      Left            =   8760
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   62
      Left            =   7560
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   52
      Left            =   6360
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   42
      Left            =   5160
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   32
      Left            =   3960
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   22
      Left            =   2760
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   12
      Left            =   1560
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   81
      Left            =   9960
      Top             =   9600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   71
      Left            =   8760
      Top             =   9600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   61
      Left            =   7560
      Top             =   9600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   51
      Left            =   6360
      Top             =   9600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   41
      Left            =   5160
      Top             =   9600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   31
      Left            =   3960
      Top             =   9600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   21
      Left            =   2760
      Top             =   9600
      Width           =   1215
   End
   Begin VB.Image imgtile 
      Height          =   1215
      Index           =   11
      Left            =   1560
      Top             =   9600
      Width           =   1215
   End
   Begin VB.Menu mnuleader 
      Caption         =   "Leader Board"
   End
   Begin VB.Menu mnuexit 
      Caption         =   "Exit"
   End
End
Attribute VB_Name = "frmchess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim newgame As Boolean, turn As Integer, start As Integer, dest As Integer, win As Integer
Dim stage As Integer

Sub begingame() 'Sets up the board.
    Dim i As Integer, b As Integer, strLine As String
    For i = 1 To 8
        imgtile((i * 10) + 2).Picture = LoadPicture(App.Path + "\Images\wp.jpg")
        tiles((i * 10) + 2).team = 1
        tiles((i * 10) + 2).type = 1
        imgtile((i * 10) + 7).Picture = LoadPicture(App.Path + "\Images\bp.jpg")
        tiles((i * 10) + 7).team = 2
        tiles((i * 10) + 7).type = 1
    Next i
    For i = 1 To 8 Step 7
        imgtile((i * 10) + 1).Picture = LoadPicture(App.Path + "\Images\wr.jpg")
        tiles((i * 10) + 1).team = 1
        tiles((i * 10) + 1).type = 2
        imgtile((i * 10) + 8).Picture = LoadPicture(App.Path + "\Images\br.jpg")
        tiles((i * 10) + 8).team = 2
        tiles((i * 10) + 8).type = 2
    Next i
    For i = 2 To 7 Step 5
        imgtile((i * 10) + 1).Picture = LoadPicture(App.Path + "\Images\wn.jpg")
        tiles((i * 10) + 1).team = 1
        tiles((i * 10) + 1).type = 3
        imgtile((i * 10) + 8).Picture = LoadPicture(App.Path + "\Images\bn.jpg")
        tiles((i * 10) + 8).team = 2
        tiles((i * 10) + 8).type = 3
    Next i
    For i = 3 To 6 Step 3
        imgtile((i * 10) + 1).Picture = LoadPicture(App.Path + "\Images\wb.jpg")
        tiles((i * 10) + 1).team = 1
        tiles((i * 10) + 1).type = 4
        imgtile((i * 10) + 8).Picture = LoadPicture(App.Path + "\Images\bb.jpg")
        tiles((i * 10) + 8).team = 2
        tiles((i * 10) + 8).type = 4
    Next i
    imgtile(41).Picture = LoadPicture(App.Path + "\Images\wq.jpg")
    tiles(41).team = 1
    tiles(41).type = 5
    imgtile(51).Picture = LoadPicture(App.Path + "\Images\wk.jpg")
    tiles(51).team = 1
    tiles(51).type = 6
    imgtile(58).Picture = LoadPicture(App.Path + "\Images\bq.jpg")
    tiles(58).team = 2
    tiles(58).type = 5
    imgtile(48).Picture = LoadPicture(App.Path + "\Images\bk.jpg")
    tiles(48).team = 2
    tiles(48).type = 6
    For i = 1 To 7 Step 2
        imgtile((i * 10) + 3).Picture = LoadPicture(App.Path + "\Images\whitesquare.jpg")
        tiles((i * 10) + 3).team = 0
        tiles((i * 10) + 3).type = 0
        imgtile((i * 10) + 4).Picture = LoadPicture(App.Path + "\Images\blacksquare.jpg")
        tiles((i * 10) + 4).team = 0
        tiles((i * 10) + 4).type = 0
        imgtile((i * 10) + 5).Picture = LoadPicture(App.Path + "\Images\whitesquare.jpg")
        tiles((i * 10) + 5).team = 0
        tiles((i * 10) + 5).type = 0
        imgtile((i * 10) + 6).Picture = LoadPicture(App.Path + "\Images\blacksquare.jpg")
        tiles((i * 10) + 6).team = 0
        tiles((i * 10) + 6).type = 0
    Next i
    For i = 2 To 8 Step 2
        imgtile((i * 10) + 3).Picture = LoadPicture(App.Path + "\Images\blacksquare.jpg")
        tiles((i * 10) + 3).team = 0
        tiles((i * 10) + 3).type = 0
        imgtile((i * 10) + 4).Picture = LoadPicture(App.Path + "\Images\whitesquare.jpg")
        tiles((i * 10) + 4).team = 0
        tiles((i * 10) + 4).type = 0
        imgtile((i * 10) + 5).Picture = LoadPicture(App.Path + "\Images\blacksquare.jpg")
        tiles((i * 10) + 5).team = 0
        tiles((i * 10) + 5).type = 0
        imgtile((i * 10) + 6).Picture = LoadPicture(App.Path + "\Images\whitesquare.jpg")
        tiles((i * 10) + 6).team = 0
        tiles((i * 10) + 6).type = 0
    Next i
    If yourplayer = 1 Then
        Open App.Path + "\Data\turn.txt" For Output As #1
            strLine = "1"
            Print #1, strLine
        Close #1
        Kill App.Path + "\Data\board.dat"
        Open App.Path + "\Data\board.dat" For Random Access Write As #1 Len = 6
            For i = 1 To 8
                For b = 1 To 8
                    Put #1, , tiles((i * 10) + b)
                Next b
            Next i
        Close #1
    Else
        For i = 1 To 8
            For b = 1 To 8
                imgtile((i * 10) + b).Enabled = False
            Next b
        Next i
        Timer1.Enabled = True
    End If
    stage = 0
    For i = 1 To 88
        tiles(i).available = 0
    Next i
    newgame = False
End Sub

Private Sub Form_Load()
    newgame = True 'First time it loads, say it's a new game.
    win = 0
End Sub

Private Sub Form_Activate()
    If newgame = True Then
        begingame 'If it's a newgame, set up the board.
    End If
End Sub

Private Sub imgtile_Click(Index As Integer)
    Dim i As Integer, block As Boolean, x As Integer, y As Integer
    If stage = 0 Then
        If tiles(Index).team = yourplayer Then
            start = Index
            imgtile(start).BorderStyle = 1
            Select Case tiles(Index).type
            Case 1 'Pawn Options
                If yourplayer = 1 Then 'White
                    If start Mod 10 = 2 Then
                        If tiles(start + 1).team = 0 Then
                            tiles(start + 1).available = 1
                            If tiles(start + 2).team = 0 Then
                                tiles(start + 2).available = 1
                            End If
                        End If
                    Else
                        If (start + 1) Mod 10 <> 9 Then
                            If tiles(start + 1).team = 0 Then
                                tiles(start + 1).available = 1
                            End If
                        End If
                    End If
                    If (start - (start Mod 10)) < 80 And (start Mod 10) < 8 Then
                        If tiles(start + 11).team = 2 Then
                            tiles(start + 11).available = 1
                        End If
                    End If
                    If (start - (start Mod 10)) > 10 And (start Mod 10) < 8 Then
                        If tiles(start - 9).team = 2 Then
                            tiles(start - 9).available = 1
                        End If
                    End If
                Else 'Black
                    If start Mod 10 = 7 Then
                        If tiles(start - 1).team = 0 Then
                            tiles(start - 1).available = 1
                            If tiles(start - 2).team = 0 Then
                                tiles(start - 2).available = 1
                            End If
                        End If
                    Else
                        If (start - 1) Mod 10 <> 0 Then
                            If tiles(start - 1).team = 0 Then
                                tiles(start - 1).available = 1
                            End If
                        End If
                    End If
                    If (start - (start Mod 10)) > 10 And (start Mod 10) > 1 Then
                        If tiles(start - 11).team = 1 Then
                            tiles(start - 11).available = 1
                        End If
                    End If
                    If (start - (start Mod 10)) < 80 And (start Mod 10) > 1 Then
                        If tiles(start + 9).team = 1 Then
                            tiles(start + 9).available = 1
                        End If
                    End If
                End If
            Case 2 'Rook Options
                x = 8 - (start Mod 10)
                If x > 0 Then
                    For i = 1 To x
                        If tiles(start + i).team = 0 Then
                            tiles(start + i).available = 1
                        ElseIf tiles(start + i).team <> yourplayer Then
                            tiles(start + i).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                End If
                x = (start Mod 10) - 1
                If x > 0 Then
                    For i = 1 To x
                        If tiles(start - i).team = 0 Then
                            tiles(start - i).available = 1
                        ElseIf tiles(start - i).team <> yourplayer Then
                            tiles(start - i).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                End If
                x = (80 - (start - (start Mod 10))) / 10
                If x > 0 Then
                    For i = 1 To x
                        If tiles(start + (i * 10)).team = 0 Then
                            tiles(start + (i * 10)).available = 1
                        ElseIf tiles(start + (i * 10)).team <> yourplayer Then
                            tiles(start + (i * 10)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                End If
                x = ((start - (start Mod 10)) - 10) / 10
                If x > 0 Then
                    For i = 1 To x
                        If tiles(start - (i * 10)).team = 0 Then
                            tiles(start - (i * 10)).available = 1
                        ElseIf tiles(start - (i * 10)).team <> yourplayer Then
                            tiles(start - (i * 10)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                End If
            Case 3 'Knight Options
                If (start - (start Mod 10)) < 70 And start Mod 10 < 8 Then 'UP 1 RIGHT 2
                    If tiles(start + 21).team <> yourplayer Then
                        tiles(start + 21).available = 1
                    End If
                End If
                If (start - (start Mod 10)) > 20 And start Mod 10 < 8 Then 'UP 1 LEFT 2
                    If tiles(start - 19).team <> yourplayer Then
                        tiles(start - 19).available = 1
                    End If
                End If
                If (start - (start Mod 10)) < 70 And start Mod 10 > 1 Then 'DOWN 1 RIGHT 2
                    If tiles(start + 19).team <> yourplayer Then
                        tiles(start + 19).available = 1
                    End If
                End If
                If (start - (start Mod 10)) > 20 And start Mod 10 > 1 Then 'Down 1 Left 2
                    If tiles(start - 21).team <> yourplayer Then
                        tiles(start - 21).available = 1
                    End If
                End If
                If (start - (start Mod 10)) < 80 And start Mod 10 < 7 Then 'Up 2 Right 1
                    If tiles(start + 12).team <> yourplayer Then
                        tiles(start + 12).available = 1
                    End If
                End If
                If (start - (start Mod 10)) > 10 And start Mod 10 < 7 Then 'Up 2 Left 1
                    If tiles(start - 8).team <> yourplayer Then
                        tiles(start - 8).available = 1
                    End If
                End If
                If (start - (start Mod 10)) < 80 And start Mod 10 > 2 Then 'Down 2 Right 1
                    If tiles(start + 8).team <> yourplayer Then
                        tiles(start + 8).available = 1
                    End If
                End If
                If (start - (start Mod 10)) > 10 And start Mod 10 > 2 Then 'Down 2 Left 1
                    If tiles(start - 12).team <> yourplayer Then
                        tiles(start - 12).available = 1
                    End If
                End If
                
            Case 4 'Bishop Options

                x = (80 - (start - (start Mod 10))) / 10
                y = 8 - (start Mod 10)

                If x < y Then
                    For i = 1 To x 'UP AND RIGHT
                        If tiles(start + (11 * i)).team = 0 Then
                            tiles(start + (11 * i)).available = 1
                        ElseIf tiles(start + (11 * i)).team <> yourplayer Then
                            tiles(start + (11 * i)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                    For i = 1 To ((8 - y) - 1) 'DOWN AND LEFT
                        If tiles(start - (11 * i)).team = 0 Then
                            tiles(start - (11 * i)).available = 1
                        ElseIf tiles(start - (11 * i)).team <> yourplayer Then
                            tiles(start - (11 * i)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                Else
                    For i = 1 To y 'UP AND RIGHT
                        If tiles(start + (11 * i)).team = 0 Then
                            tiles(start + (11 * i)).available = 1
                        ElseIf tiles(start + (11 * i)).team <> yourplayer Then
                            tiles(start + (11 * i)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                    For i = 1 To ((8 - x) - 1) 'DOWN AND LEFT
                      If tiles(start - (11 * i)).team = 0 Then
                         tiles(start - (11 * i)).available = 1
                      ElseIf tiles(start - (11 * i)).team <> yourplayer Then
                         tiles(start - (11 * i)).available = 1
                         Exit For
                      Else
                         Exit For
                      End If
                   Next i
                End If
                
                x = (80 - (start - (start Mod 10))) / 10
                y = (start Mod 10) - 1
                
                If x < y Then
                   For i = 1 To x 'DOWN AND RIGHT
                      If tiles(start + (9 * i)).team = 0 Then
                         tiles(start + (9 * i)).available = 1
                      ElseIf tiles(start + (9 * i)).team <> yourplayer Then
                         tiles(start + (9 * i)).available = 1
                     Exit For
                      Else
                         Exit For
                      End If
                   Next i
                   For i = 1 To ((8 - y) - 1) 'UP AND LEFT
                      If tiles(start - (9 * i)).team = 0 Then
                         tiles(start - (9 * i)).available = 1
                      ElseIf tiles(start - (9 * i)).team <> yourplayer Then
                         tiles(start - (9 * i)).available = 1
                         Exit For
                      Else
                         Exit For
                      End If
                   Next i
                Else
                   For i = 1 To y 'DOWN AND RIGHT
                      If tiles(start + (9 * i)).team = 0 Then
                         tiles(start + (9 * i)).available = 1
                      ElseIf tiles(start + (9 * i)).team <> yourplayer Then
                         tiles(start + (9 * i)).available = 1
                     Exit For
                      Else
                         Exit For
                      End If
                   Next i
                   For i = 1 To ((8 - x) - 1) 'UP AND LEFT
                      If tiles(start - (9 * i)).team = 0 Then
                         tiles(start - (9 * i)).available = 1
                      ElseIf tiles(start - (9 * i)).team <> yourplayer Then
                         tiles(start - (9 * i)).available = 1
                         Exit For
                      Else
                         Exit For
                      End If
                   Next i
                End If
            
            Case 5 'Queen Options
                x = 8 - (start Mod 10)
                If x > 0 Then
                    For i = 1 To x
                        If tiles(start + i).team = 0 Then
                            tiles(start + i).available = 1
                        ElseIf tiles(start + i).team <> yourplayer Then
                            tiles(start + i).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                End If
                x = (start Mod 10) - 1
                If x > 0 Then
                    For i = 1 To x
                        If tiles(start - i).team = 0 Then
                            tiles(start - i).available = 1
                        ElseIf tiles(start - i).team <> yourplayer Then
                            tiles(start - i).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                End If
                x = (80 - (start - (start Mod 10))) / 10
                If x > 0 Then
                    For i = 1 To x
                        If tiles(start + (i * 10)).team = 0 Then
                            tiles(start + (i * 10)).available = 1
                        ElseIf tiles(start + (i * 10)).team <> yourplayer Then
                            tiles(start + (i * 10)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                End If
                x = ((start - (start Mod 10)) - 10) / 10
                If x > 0 Then
                    For i = 1 To x
                        If tiles(start - (i * 10)).team = 0 Then
                            tiles(start - (i * 10)).available = 1
                        ElseIf tiles(start - (i * 10)).team <> yourplayer Then
                            tiles(start - (i * 10)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                End If
                x = (80 - (start - (start Mod 10))) / 10
                y = 8 - (start Mod 10)

                If x < y Then
                    For i = 1 To x 'UP AND RIGHT
                        If tiles(start + (11 * i)).team = 0 Then
                            tiles(start + (11 * i)).available = 1
                        ElseIf tiles(start + (11 * i)).team <> yourplayer Then
                            tiles(start + (11 * i)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                    For i = 1 To ((8 - y) - 1) 'DOWN AND LEFT
                        If tiles(start - (11 * i)).team = 0 Then
                            tiles(start - (11 * i)).available = 1
                        ElseIf tiles(start - (11 * i)).team <> yourplayer Then
                            tiles(start - (11 * i)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                Else
                    For i = 1 To y 'UP AND RIGHT
                        If tiles(start + (11 * i)).team = 0 Then
                            tiles(start + (11 * i)).available = 1
                        ElseIf tiles(start + (11 * i)).team <> yourplayer Then
                            tiles(start + (11 * i)).available = 1
                            Exit For
                        Else
                            Exit For
                        End If
                    Next i
                    For i = 1 To ((8 - x) - 1) 'DOWN AND LEFT
                      If tiles(start - (11 * i)).team = 0 Then
                         tiles(start - (11 * i)).available = 1
                      ElseIf tiles(start - (11 * i)).team <> yourplayer Then
                         tiles(start - (11 * i)).available = 1
                         Exit For
                      Else
                         Exit For
                      End If
                   Next i
                End If
                
                x = (80 - (start - (start Mod 10))) / 10
                y = (start Mod 10) - 1
                
                If x < y Then
                   For i = 1 To x 'DOWN AND RIGHT
                      If tiles(start + (9 * i)).team = 0 Then
                         tiles(start + (9 * i)).available = 1
                      ElseIf tiles(start + (9 * i)).team <> yourplayer Then
                         tiles(start + (9 * i)).available = 1
                     Exit For
                      Else
                         Exit For
                      End If
                   Next i
                   For i = 1 To ((8 - y) - 1) 'UP AND LEFT
                      If tiles(start - (9 * i)).team = 0 Then
                         tiles(start - (9 * i)).available = 1
                      ElseIf tiles(start - (9 * i)).team <> yourplayer Then
                         tiles(start - (9 * i)).available = 1
                         Exit For
                      Else
                         Exit For
                      End If
                   Next i
                Else
                   For i = 1 To y 'DOWN AND RIGHT
                      If tiles(start + (9 * i)).team = 0 Then
                         tiles(start + (9 * i)).available = 1
                      ElseIf tiles(start + (9 * i)).team <> yourplayer Then
                         tiles(start + (9 * i)).available = 1
                     Exit For
                      Else
                         Exit For
                      End If
                   Next i
                   For i = 1 To ((8 - x) - 1) 'UP AND LEFT
                      If tiles(start - (9 * i)).team = 0 Then
                         tiles(start - (9 * i)).available = 1
                      ElseIf tiles(start - (9 * i)).team <> yourplayer Then
                         tiles(start - (9 * i)).available = 1
                         Exit For
                      Else
                         Exit For
                      End If
                   Next i
                End If
                
            Case 6 'King Options
                If (start Mod 10) < 8 Then 'UP
                    If tiles(start + 1).team <> yourplayer Then
                        tiles(start + 1).available = 1
                    End If
                End If
                If (start Mod 10) > 1 Then 'DOWN
                    If tiles(start - 1).team <> yourplayer Then
                        tiles(start - 1).available = 1
                    End If
                End If
                If (start - (start Mod 10)) < 80 Then 'RIGHT
                    If tiles(start + 10).team <> yourplayer Then
                        tiles(start + 10).available = 1
                    End If
                End If
                If (start - (start Mod 10)) > 10 Then 'LEFT
                    If tiles(start - 10).team <> yourplayer Then
                        tiles(start - 10).available = 1
                    End If
                End If
                If (start - (start Mod 10)) < 80 And (start Mod 10) < 8 Then 'UP AND RIGHT
                    If tiles(start + 11).team <> yourplayer Then
                        tiles(start + 11).available = 1
                    End If
                End If
                If (start - (start Mod 10)) > 10 And (start Mod 10) < 8 Then 'UP AND LEFT
                    If tiles(start - 9).team <> yourplayer Then
                        tiles(start - 9).available = 1
                    End If
                End If
                If (start - (start Mod 10)) < 80 And (start Mod 10) > 1 Then 'DOWN AND RIGHT
                    If tiles(start + 9).team <> yourplayer Then
                        tiles(start + 9).available = 1
                    End If
                End If
                If (start - (start Mod 10)) > 10 And (start Mod 10) > 1 Then 'DOWN AND LEFT
                    If tiles(start - 11).team <> yourplayer Then
                        tiles(start - 11).available = 1
                    End If
                End If
            End Select
            stage = 1
        Else
            start = 0
            For i = 1 To 88
                tiles(i).available = 0
            Next i
        End If
    Else
        If tiles(Index).available = 1 Then
            If tiles(Index).type = 6 Then
                endgame yourplayer
                win = 1
            End If
            dest = Index
            imgtile(dest).Picture = imgtile(start).Picture
            tiles(dest).team = tiles(start).team
            tiles(dest).type = tiles(start).type
            tiles(start).type = 0
            tiles(start).team = 0
            If start Mod 2 = 0 Then
                If (start - (start Mod 10)) Mod 20 = 0 Then
                    imgtile(start).Picture = LoadPicture(App.Path + "\Images\whitesquare.jpg")
                Else
                    imgtile(start).Picture = LoadPicture(App.Path + "\Images\blacksquare.jpg")
                End If
            Else
                If (start - (start Mod 10)) Mod 20 = 0 Then
                    imgtile(start).Picture = LoadPicture(App.Path + "\Images\blacksquare.jpg")
                Else
                    imgtile(start).Picture = LoadPicture(App.Path + "\Images\whitesquare.jpg")
                End If
            End If
            imgtile(start).BorderStyle = 0
            For i = 1 To 88
                tiles(i).available = 0
            Next i
            turnchange
        Else
            imgtile(start).BorderStyle = 0
            start = 0
            For i = 1 To 88
                tiles(i).available = 0
            Next i
            stage = 0
        End If
    End If
End Sub

Sub turnchange()
    Dim strLine As String, i As Integer, b As Integer
    For i = 1 To 8
        For b = 1 To 8
            imgtile((i * 10) + b).Enabled = False
        Next b
    Next i
    If yourplayer = 1 Then
        Kill App.Path + "\Data\board.dat"
        Open App.Path + "\Data\board.dat" For Random Access Write As #1 Len = 6
        For i = 1 To 8
            For b = 1 To 8
                Put #1, , tiles((i * 10) + b)
            Next b
        Next i
        Close #1
        If win = 0 Then
            strLine = "2" + vbCrLf + "0"
        Else
            strLine = "2" + vbCrLf + "1"
        End If
        Open App.Path + "\Data\turn.txt" For Output As #1
            Print #1, strLine
        Close #1
        Timer1.Enabled = True
    Else
        Kill App.Path + "\Data\board.dat"
        Open App.Path + "\Data\board.dat" For Random Access Write As #1 Len = 6
        For i = 1 To 8
            For b = 1 To 8
                Put #1, , tiles((i * 10) + b)
            Next b
        Next i
        Close #1
        If win = 0 Then
            strLine = "1" + vbCrLf + "0"
        Else
            strLine = "1" + vbCrLf + "1"
        End If
        Open App.Path + "\Data\turn.txt" For Output As #1
            Print #1, strLine
        Close #1
        Timer1.Enabled = True
    End If
End Sub

Sub endgame(winner As Integer)
    Dim i As Integer, b As Integer, strLine As String
    i = 0
    For i = 1 To 8
        For b = 1 To 8
            imgtile((i * 10) + b).Enabled = False
        Next b
    Next i
    Open App.Path + "\Data\highscore.dat" For Random Access Read As #1 Len = 14
    Do While Not EOF(1)
        i = i + 1
        Get #1, , players(i)
    Loop
    Close #1
    If winner = yourplayer Then
        players(yourpos).played = players(yourpos).played + 1
        players(yourpos).wins = players(yourpos).wins + 1
        strLine = MsgBox("YOU WIN!", vbOKOnly)
    Else
        players(yourpos).played = players(yourpos).played + 1
        strLine = MsgBox("You Lose!", vbOKOnly)
    End If
    Kill App.Path + "\Data\highscore.dat"
    Open App.Path + "\Data\highscore.dat" For Random Access Write As #1 Len = 14
        For i = 1 To numnames
            Put #1, i, players(i)
        Next i
    Close #1
End Sub

Private Sub mnuexit_Click()
End
End Sub

Private Sub mnuleader_Click()
    frmchessleader.Show
    frmchess.Hide
End Sub

Private Sub Timer1_Timer()
    Dim strLine As String, i As Integer, b As Integer
    Open App.Path + "\Data\turn.txt" For Input As #1
        Line Input #1, strLine
    Close #1
    If Val(strLine) = yourplayer Then
        Open App.Path + "\Data\board.dat" For Random Access Read As #1 Len = 6
            For i = 1 To 8
                For b = 1 To 8
                    Get #1, , tiles((i * 10) + b)
                Next b
            Next i
        Close #1
        For i = 1 To 8
            For b = 1 To 8
            Select Case tiles((i * 10) + b).type
            Case 0 'No Piece
                If ((i * 10) + b) Mod 2 = 0 Then
                    If (((i * 10) + b) - (((i * 10) + b) Mod 10)) Mod 20 = 0 Then
                        imgtile(((i * 10) + b)).Picture = LoadPicture(App.Path + "\Images\whitesquare.jpg")
                    Else
                        imgtile(((i * 10) + b)).Picture = LoadPicture(App.Path + "\Images\blacksquare.jpg")
                    End If
                Else
                    If (((i * 10) + b) - (((i * 10) + b) Mod 10)) Mod 20 = 0 Then
                        imgtile(((i * 10) + b)).Picture = LoadPicture(App.Path + "\Images\blacksquare.jpg")
                    Else
                        imgtile(((i * 10) + b)).Picture = LoadPicture(App.Path + "\Images\whitesquare.jpg")
                    End If
                End If
            Case 1 'Pawn
                If tiles((i * 10) + b).team = 1 Then
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\wp.jpg")
                Else
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\bp.jpg")
                End If
            Case 2 'Rook
                If tiles((i * 10) + b).team = 1 Then
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\wr.jpg")
                Else
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\br.jpg")
                End If
            Case 3 'Knight
                If tiles((i * 10) + b).team = 1 Then
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\wn.jpg")
                Else
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\bn.jpg")
                End If
            Case 4 'Bishop
                If tiles((i * 10) + b).team = 1 Then
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\wb.jpg")
                Else
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\bb.jpg")
                End If
            Case 5 'Queen
                If tiles((i * 10) + b).team = 1 Then
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\wq.jpg")
                Else
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\bq.jpg")
                End If
            Case 6 'King
                If tiles((i * 10) + b).team = 1 Then
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\wk.jpg")
                Else
                    imgtile((i * 10) + b).Picture = LoadPicture(App.Path + "\Images\bk.jpg")
                End If
            End Select
            Next b
        Next i
        Open App.Path + "\Data\turn.txt" For Input As #1
        Line Input #1, strLine
        Line Input #1, strLine
        Close #1
        If Val(strLine) = 1 Then
            win = 1
            If yourplayer = 1 Then
                endgame 2
            Else
                endgame 1
            End If
        End If
        If win = 0 Then
            For i = 1 To 8
                For b = 1 To 8
                    imgtile((i * 10) + b).Enabled = True
                Next b
            Next i
        End If
        If win = 1 Then
            For i = 1 To 8
                For b = 1 To 8
                    imgtile((i * 10) + b).Enabled = False
                Next b
            Next i
        End If
        Timer1.Enabled = False
    End If
End Sub

