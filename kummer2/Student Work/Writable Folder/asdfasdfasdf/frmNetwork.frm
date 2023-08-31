VERSION 5.00
Begin VB.Form frmNetwork 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Over the Network"
   ClientHeight    =   10920
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   14415
   LinkTopic       =   "Form1"
   Picture         =   "frmNetwork.frx":0000
   ScaleHeight     =   10920
   ScaleWidth      =   14415
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrTurn 
      Interval        =   50
      Left            =   2640
      Top             =   120
   End
   Begin VB.Timer tmrNetwork 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2160
      Top             =   120
   End
   Begin VB.Timer tmrSpin 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   600
      Top             =   120
   End
   Begin VB.CommandButton cmdSpin 
      BackColor       =   &H00000000&
      Height          =   495
      Left            =   4200
      TabIndex        =   0
      Top             =   5640
      Width           =   495
   End
   Begin VB.Timer tmrMove 
      Enabled         =   0   'False
      Interval        =   400
      Left            =   1080
      Top             =   120
   End
   Begin VB.Timer tmrMove2 
      Enabled         =   0   'False
      Interval        =   400
      Left            =   1560
      Top             =   120
   End
   Begin VB.Label lblPos 
      Height          =   495
      Left            =   11880
      TabIndex        =   108
      Top             =   5040
      Width           =   2175
   End
   Begin VB.Label lblTurn 
      Height          =   495
      Left            =   10200
      TabIndex        =   107
      Top             =   5040
      Width           =   1335
   End
   Begin VB.Label lblMoney2 
      BackStyle       =   0  'Transparent
      Height          =   495
      Left            =   12000
      TabIndex        =   106
      Top             =   4560
      Width           =   1335
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Car Stolen"
      Height          =   975
      Index           =   6
      Left            =   8640
      TabIndex        =   105
      Top             =   9000
      Width           =   1215
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      Index           =   5
      Visible         =   0   'False
      X1              =   4440
      X2              =   5640
      Y1              =   5880
      Y2              =   5880
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      Index           =   1
      Visible         =   0   'False
      X1              =   3240
      X2              =   4440
      Y1              =   5880
      Y2              =   5880
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      Index           =   7
      Visible         =   0   'False
      X1              =   4440
      X2              =   4440
      Y1              =   5880
      Y2              =   4680
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      Index           =   3
      Visible         =   0   'False
      X1              =   4440
      X2              =   4440
      Y1              =   7080
      Y2              =   5880
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      Index           =   6
      Visible         =   0   'False
      X1              =   4440
      X2              =   5400
      Y1              =   5880
      Y2              =   5040
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      Index           =   4
      Visible         =   0   'False
      X1              =   4440
      X2              =   5280
      Y1              =   5880
      Y2              =   6840
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      Index           =   2
      Visible         =   0   'False
      X1              =   3600
      X2              =   4440
      Y1              =   6720
      Y2              =   5880
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      Index           =   8
      Visible         =   0   'False
      X1              =   3600
      X2              =   4440
      Y1              =   5040
      Y2              =   5880
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Money in Account:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7680
      TabIndex        =   104
      Top             =   4560
      Width           =   2775
   End
   Begin VB.Label lblMoney 
      Height          =   375
      Left            =   10320
      TabIndex        =   103
      Top             =   4560
      Width           =   1335
   End
   Begin VB.Image imgplayer 
      Height          =   735
      Left            =   360
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   375
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   0
      Left            =   600
      TabIndex        =   102
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   1
      Left            =   1200
      TabIndex        =   101
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   2
      Left            =   2760
      TabIndex        =   100
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   3
      Left            =   4200
      TabIndex        =   99
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   4
      Left            =   5640
      TabIndex        =   98
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   5
      Left            =   7080
      TabIndex        =   97
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   6
      Left            =   8520
      TabIndex        =   96
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   7
      Left            =   10080
      TabIndex        =   95
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   8
      Left            =   11520
      TabIndex        =   94
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   9
      Left            =   11760
      TabIndex        =   93
      Top             =   7680
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   10
      Left            =   11880
      TabIndex        =   92
      Top             =   6360
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   11
      Left            =   10440
      TabIndex        =   91
      Top             =   6000
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   12
      Left            =   9000
      TabIndex        =   90
      Top             =   6120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   13
      Left            =   7800
      TabIndex        =   89
      Top             =   6120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   14
      Left            =   7560
      TabIndex        =   88
      Top             =   7440
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   15
      Left            =   6120
      TabIndex        =   87
      Top             =   7440
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   16
      Left            =   4560
      TabIndex        =   86
      Top             =   7440
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   17
      Left            =   3120
      TabIndex        =   85
      Top             =   7440
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   18
      Left            =   1680
      TabIndex        =   84
      Top             =   7440
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   19
      Left            =   480
      TabIndex        =   83
      Top             =   7320
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   20
      Left            =   480
      TabIndex        =   82
      Top             =   5760
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   21
      Left            =   480
      TabIndex        =   81
      Top             =   4320
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   22
      Left            =   480
      TabIndex        =   80
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   23
      Left            =   2160
      TabIndex        =   79
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   24
      Left            =   3480
      TabIndex        =   78
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   25
      Left            =   5040
      TabIndex        =   77
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   26
      Left            =   6360
      TabIndex        =   76
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   27
      Left            =   7920
      TabIndex        =   75
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   28
      Left            =   9360
      TabIndex        =   74
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   29
      Left            =   10800
      TabIndex        =   73
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   30
      Left            =   12360
      TabIndex        =   72
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   31
      Left            =   12600
      TabIndex        =   71
      Top             =   1800
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   32
      Left            =   12240
      TabIndex        =   70
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   33
      Left            =   10680
      TabIndex        =   69
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   34
      Left            =   9240
      TabIndex        =   68
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   35
      Left            =   7800
      TabIndex        =   67
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   36
      Left            =   6360
      TabIndex        =   66
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   37
      Left            =   4920
      TabIndex        =   65
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   38
      Left            =   3360
      TabIndex        =   64
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   39
      Left            =   2040
      TabIndex        =   63
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblMale 
      BackStyle       =   0  'Transparent
      Height          =   1095
      Index           =   40
      Left            =   1320
      TabIndex        =   62
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   0
      Left            =   600
      TabIndex        =   61
      Top             =   8760
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   1
      Left            =   2040
      TabIndex        =   60
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   2
      Left            =   3600
      TabIndex        =   59
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   3
      Left            =   5040
      TabIndex        =   58
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   4
      Left            =   6480
      TabIndex        =   57
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   5
      Left            =   7920
      TabIndex        =   56
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   6
      Left            =   9360
      TabIndex        =   55
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   7
      Left            =   10800
      TabIndex        =   54
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   8
      Left            =   12360
      TabIndex        =   53
      Top             =   9000
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   9
      Left            =   12480
      TabIndex        =   52
      Top             =   7800
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   10
      Left            =   12480
      TabIndex        =   51
      Top             =   6360
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   11
      Left            =   11280
      TabIndex        =   50
      Top             =   6120
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   12
      Left            =   9720
      TabIndex        =   49
      Top             =   6120
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   13
      Left            =   8400
      TabIndex        =   48
      Top             =   6240
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   14
      Left            =   8280
      TabIndex        =   47
      Top             =   7560
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   15
      Left            =   6840
      TabIndex        =   46
      Top             =   7560
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   16
      Left            =   5400
      TabIndex        =   45
      Top             =   7560
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   17
      Left            =   3840
      TabIndex        =   44
      Top             =   7560
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   18
      Left            =   2400
      TabIndex        =   43
      Top             =   7560
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   19
      Left            =   960
      TabIndex        =   42
      Top             =   7440
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   20
      Left            =   1080
      TabIndex        =   41
      Top             =   5880
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   21
      Left            =   1080
      TabIndex        =   40
      Top             =   4440
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   22
      Left            =   1320
      TabIndex        =   39
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   23
      Left            =   2760
      TabIndex        =   38
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   24
      Left            =   4320
      TabIndex        =   37
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   25
      Left            =   5640
      TabIndex        =   36
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   26
      Left            =   7320
      TabIndex        =   35
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   27
      Left            =   8760
      TabIndex        =   34
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   28
      Left            =   10200
      TabIndex        =   33
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   29
      Left            =   11760
      TabIndex        =   32
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   30
      Left            =   13200
      TabIndex        =   31
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   31
      Left            =   13200
      TabIndex        =   30
      Top             =   1920
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   32
      Left            =   13200
      TabIndex        =   29
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   33
      Left            =   11640
      TabIndex        =   28
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   34
      Left            =   10080
      TabIndex        =   27
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   35
      Left            =   8640
      TabIndex        =   26
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   36
      Left            =   7200
      TabIndex        =   25
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   37
      Left            =   5760
      TabIndex        =   24
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   38
      Left            =   4320
      TabIndex        =   23
      Top             =   600
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   39
      Left            =   2760
      TabIndex        =   22
      Top             =   720
      Width           =   615
   End
   Begin VB.Label lblFemale 
      BackStyle       =   0  'Transparent
      Height          =   975
      Index           =   40
      Left            =   1320
      TabIndex        =   21
      Top             =   600
      Width           =   615
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   3000
      TabIndex        =   20
      Top             =   5640
      Width           =   255
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   3360
      TabIndex        =   19
      Top             =   4680
      Width           =   255
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   3360
      TabIndex        =   18
      Top             =   6600
      Width           =   255
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   4320
      TabIndex        =   17
      Top             =   7080
      Width           =   255
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   5280
      TabIndex        =   16
      Top             =   6840
      Width           =   255
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   5760
      TabIndex        =   15
      Top             =   5640
      Width           =   255
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   5400
      TabIndex        =   14
      Top             =   4680
      Width           =   255
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   4440
      TabIndex        =   13
      Top             =   4320
      Width           =   255
   End
   Begin VB.Image imgPlayer2 
      Height          =   735
      Left            =   600
      Stretch         =   -1  'True
      Top             =   9600
      Width           =   375
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Who's turn is it?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7680
      TabIndex        =   12
      Top             =   5040
      Width           =   2415
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Fresh out of college! "
      Height          =   975
      Index           =   0
      Left            =   2880
      TabIndex        =   11
      Top             =   9000
      Width           =   1215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Pick your job!!"
      Height          =   975
      Index           =   1
      Left            =   7200
      TabIndex        =   10
      Top             =   9000
      Width           =   1215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "PAY DAY!!"
      Height          =   975
      Index           =   2
      Left            =   10200
      TabIndex        =   9
      Top             =   9000
      Width           =   1215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Pay Taxes"
      Height          =   975
      Index           =   3
      Left            =   10560
      TabIndex        =   8
      Top             =   6120
      Width           =   1215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Your getting married..."
      Height          =   975
      Index           =   4
      Left            =   7560
      TabIndex        =   7
      Top             =   7560
      Width           =   1215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "You got in a car wreck. No Insurance! "
      Height          =   975
      Index           =   5
      Left            =   1800
      TabIndex        =   6
      Top             =   7560
      Width           =   1215
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Pay Day"
      Height          =   1215
      Index           =   0
      Left            =   7800
      TabIndex        =   5
      Top             =   6120
      Width           =   1095
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Pay Day"
      Height          =   1095
      Index           =   1
      Left            =   6480
      TabIndex        =   4
      Top             =   3120
      Width           =   1335
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Pay Day"
      Height          =   1215
      Index           =   2
      Left            =   12720
      TabIndex        =   3
      Top             =   1800
      Width           =   1095
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Pay Day"
      Height          =   1095
      Index           =   3
      Left            =   3360
      TabIndex        =   2
      Top             =   720
      Width           =   1455
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "Retirement!"
      ForeColor       =   &H00FFFFFF&
      Height          =   855
      Left            =   840
      TabIndex        =   1
      Top             =   960
      Width           =   1335
   End
End
Attribute VB_Name = "frmNetwork"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Dim MoveNumber As Integer, Highlighted As Integer, FlagFlash As Integer, Highlighted2 As Integer
Dim SPace As Integer, SpaceTemp As Integer, Flagmove As Integer, Space2 As Integer, SpaceTemp2 As Integer
Dim Money1 As Long, Money2 As Long, NetworkTurn As Integer, Flag As Integer, Pos1 As Integer, Flags As Integer
Private Sub cmdSpin_Click()
For x = 1 To 8
Line1(x).Visible = False
Next x

MoveNumber = 0
Randomize
MoveNumber = Int(Rnd * 8) + 1

tmrSpin.Enabled = True

'tmrMove.Enabled = True

Highlighted = 1
FlagFlash = 0
Highlighted2 = 1


End Sub

Private Sub Form_Load()
'frmLife.Hide
'frmIntroLife.Show
imgPlayer2.Picture = LoadPicture("E:\male.jpg")
imgplayer.Picture = LoadPicture("E:\male.jpg")
Money1 = 100000
lblMoney = Money1
Money2 = 100000
SPace = 0
Space2 = 0
Highlighted = 1
FlagFlash = 0
Highlighted2 = 1
lblMoney = Str(Person.Money)
NetworkTurn = 1
lblTurn = NetworkTurn
Flag = 1
PersonNumber = 1
Pos1 = 0
End Sub

Private Sub mnuExit_Click()
End
End Sub

Private Sub tmrMove_Timer()
If NetworkTurn = PersonNumber Then
SpaceTemp = SpaceTemp + 1
    If PersonNumber = 1 Then
    imgplayer.Top = lblMale(SpaceTemp).Top
    imgplayer.Left = lblMale(SpaceTemp).Left
    ElseIf PersonNumber = 2 Then
    imgplayer.Top = lblFemale(SpaceTemp).Top
    imgplayer.Left = lblFemale(SpaceTemp).Left
    End If
If SpaceTemp >= SPace + MoveNumber Then
       SPace = SPace + MoveNumber
    If SpaceTemp = 40 Then
        MsgBox "WINNER!"
        tmrMove.Enabled = False
    End If
    
       If SPace = 18 Then
        Money1 = Money1 - 20000
            MsgBox ("Teenage Road Rage you lose 20000 " & Money1)
        lblMoney = Money1
        End If
        If SPace = 17 Then
        Money1 = Money1 - 10000
            MsgBox ("Huge wedding reception you lose 10000 " & Money1)
        lblMoney = Money1
        End If
        If SPace = 16 Then
        Money1 = Money1 + 3000
            MsgBox ("Christmas Bouns + 3000 " & Money1)
        lblMoney = Money1
        End If
        If SPace = 15 Then
        Money1 = Money1 - 6000
            MsgBox ("Al-Qaieda seizes your bank and steals your assest - 6000 " & Money1)
        lblMoney = Money1
        End If
        
        If SPace = 14 Then
        Money1 = Money1 + 5000
            MsgBox ("Win the Sweepstakes at the mall + 5000 " & Money1)
        lblMoney = Money1
        End If
        
        If SPace = 13 Then
        Money1 = Money1 - 5000
            MsgBox ("Get caught doing drugs - 5000 " & Money1)
        lblMoney = Money1
        End If
        If SPace = 12 Then
        Money1 = Money1 - 25000
            MsgBox ("Your House burns down " & Money1)
        lblMoney = Money1
        End If
        
        If SPace = 11 Then
        Money1 = Money1 + 30000
            MsgBox ("Extreme Homemakeover comes and gives u free house + 30k " & Money1)
        lblMoney = Money1
        End If
        
                If SPace = 10 Then
        Money1 = Money1 - 5000
            MsgBox ("Get scammed by scientologists - 5k " & Money1)
        lblMoney = Money1
        End If
        
                If SPace = 9 Then
        Money1 = Money1 - 8500
            MsgBox ("Stock Prices plummel - 8.5k " & Money1)
        lblMoney = Money1
        End If
        
        If SPace = 8 Then
        Money1 = Money1 + 5000
            MsgBox ("Your girlfriend dumps you, now less shopping + 5000 " & Money1)
        lblMoney = Money1
        End If
        
                If SPace = 7 Then
        Money1 = Money1 - 15000
            MsgBox ("Your girlfriend takes you on a shopping spree - 15k " & Money1)
        lblMoney = Money1
        End If
        
                If SPace = 6 Then
        Money1 = Money1 - 20000
            MsgBox ("Heirer ba ni dei che tio diao le - 20k " & Money1)
        lblMoney = Money1
        End If
        
        If SPace = 5 Then
        Money1 = Money1 - 10000
            MsgBox ("Mexicans raid your house - 10k " & Money1)
        lblMoney = Money1
        End If
        
        If SPace = 4 Then
        Money1 = Money1 + 6000
            MsgBox ("Free job out of college + 6k " & Money1)
        lblMoney = Money1
        End If
        
        
        If NetworkTurn = 1 Then
        NetworkTurn = 2
        ElseIf NetworkTurn = 2 Then
        NetworkTurn = 1
        End If
        Flag = 1
        tmrTurn.Enabled = True
        
       ' lblTurn = NetworkTurn
        tmrMove.Enabled = False
End If

ElseIf PersonNumber <> NetworkTurn Then
   If NetworkTurn = 2 Then
        NetworkTurn = 1
        End If
        Flag = 1
        tmrTurn.Enabled = True
        
       ' lblTurn = NetworkTurn
        tmrMove.Enabled = False


End If


End Sub

Private Sub tmrMove2_Timer()
SpaceTemp2 = SpaceTemp2 + 1

imgPlayer2.Top = lblFemale(SpaceTemp2).Top
imgPlayer2.Left = lblFemale(SpaceTemp2).Left

If SpaceTemp2 >= Space2 + MoveNumber Then
   Space2 = Space2 + MoveNumber
If SpaceTemp2 = 40 Then
    MsgBox "WINNER!"
    tmrMove2.Enabled = False
End If
       If Space2 = 18 Then
        Money2 = Money2 - 20000
            MsgBox ("Teenage Road Rage you lose 20000 " & Money2)
        End If
        If Space2 = 17 Then
        Money2 = Money2 - 10000
            MsgBox ("Huge wedding reception you lose 10000 " & Money2)
        End If
        If Space2 = 16 Then
        Money2 = Money2 + 3000
            MsgBox ("Christmas Bouns + 3000 " & Money2)
        End If
        If Space2 = 15 Then
        Money2 = Money2 - 6000
            MsgBox ("Al-Qaieda seizes your bank and steals your assest - 6000 " & Money2)
        End If
        
        If Space2 = 14 Then
        Money2 = Money2 + 5000
            MsgBox ("Win the Sweepstakes at the mall + 5000 " & Money2)
        End If
        
        If Space2 = 13 Then
        Money2 = Money2 - 5000
            MsgBox ("Get caught doing drugs - 5000 " & Money2)
        End If
        If Space2 = 12 Then
        Money2 = Money2 - 25000
            MsgBox ("Your House burns down " & Money2)
        End If
        
        If Space2 = 11 Then
        Money2 = Money2 + 30000
            MsgBox ("Extreme Homemakeover comes and gives u free house + 30k " & Money2)
        End If
        
                If Space2 = 10 Then
        Money2 = Money2 - 5000
            MsgBox ("Get scammed by scientologists - 5k " & Money2)
        End If
        
                If Space2 = 9 Then
        Money2 = Money2 - 8500
            MsgBox ("Stock Prices plummel - 8.5k " & Money2)
        End If
        
        If Space2 = 8 Then
        Money2 = Money2 + 5000
            MsgBox ("Your girlfriend dumps you, now less shopping + 5000 " & Money2)
        End If
        
                If Space2 = 7 Then
        Money2 = Money2 - 15000
            MsgBox ("Your girlfriend takes you on a shopping spree - 15k " & Money2)
        End If
        
                If Space2 = 6 Then
        Money2 = Money2 - 20000
            MsgBox ("Heirer ba ni dei che tio diao le - 20k " & Money2)
        End If
        
        If Space2 = 5 Then
        Money2 = Money2 - 10000
            MsgBox ("Mexicans raid your house - 10k " & Money2)
        End If
        
        If Space2 = 4 Then
        Money2 = Money2 + 6000
            MsgBox ("Free job out of college + 6k " & Money2)
        End If
    If NetworkTurn = 1 Then
        NetworkTurn = 2
    ElseIf NetworkTurn = 2 Then
        NetworkTurn = 1
    End If
   ' lblTurn = NetworkTurn
    tmrMove2.Enabled = False
End If


    


End Sub

Private Sub tmrNetwork_Timer()
If Flags = 1 Then
Path = "\\Gk08\student work\Writable Folder\Will and Naina\data.txt" '

Open Path For Output As #1
Print #1, Trim(Str(SPace))
Close #1 '

Open Path For Input As #1
Dim strl As String
For i = 1 To 1
If EOF(1) Then Exit For
Line Input #1, strl
SPace = Trim(strl)
lblPos = SPace
Next i '
Close #1

imgplayer.Top = lblMale(SPace).Top
imgplayer.Left = lblMale(SPace).Left
Else: tmrNetwork.Enabled = False

End If


Flags = Flags + 1
End Sub

Private Sub tmrSpin_Timer()

If FlagFlash < 2 Then
     If Highlighted2 < 8 And Highlighted2 <> 1 Then
                Line1(Highlighted2).Visible = True
                Line1(Highlighted2 - 1).Visible = False
            Highlighted2 = Highlighted2 + 1
                 
            ElseIf Highlighted2 = 1 Then
                Line1(Highlighted2).Visible = True
              Highlighted2 = Highlighted2 + 1
            Else
                
                Line1(Highlighted2).Visible = True
                    If Highlighted2 > 1 Then
                    Line1(Highlighted2 - 1).Visible = False
                    End If
                Highlighted2 = Highlighted2 + 1
                
        End If
            If Highlighted2 = 9 Then
                Line1(Highlighted2 - 1).Visible = False
                Highlighted2 = 1
                FlagFlash = FlagFlash + 1
            End If
    Else
            If Highlighted = MoveNumber And Highlighted > 1 Then
                Line1(MoveNumber).Visible = True
                Line1(MoveNumber - 1).Visible = False
                SpaceTemp = SPace
                Flagmove = 1
                 tmrSpin.Enabled = False

                 tmrMove.Enabled = True

                 
            ElseIf MoveNumber = 1 Then
                Line1(MoveNumber).Visible = True
                SpaceTemp = SPace
                Flagmove = 1
                tmrSpin.Enabled = False
               tmrMove.Enabled = True
                     '  If NetworkTurn = 1 Then
                     '   NetworkTurn = 2
                     '   ElseIf NetworkTurn = 2 Then
                     '   NetworkTurn = 1
                     '   End If
                    ' tmrTurn.Enabled = True
                    ' Flag = 1
         
        
              Else
                
                Line1(Highlighted).Visible = True
                If Highlighted > 1 Then
                Line1(Highlighted - 1).Visible = False
                End If
                Highlighted = Highlighted + 1
                
            End If
            
End If


End Sub

Private Sub tmrTurn_Timer()
If Flag = 1 Then
Path = "\\Gk08\student work\Writable Folder\Will and Naina\turn.txt"

Open Path For Output As #1
Print #1, Trim(Str(NetworkTurn))
Close #1

Open Path For Input As #1
Dim strl As String
For i = 1 To 1
If EOF(1) Then Exit For
Line Input #1, strl
NetworkTurn = Trim(strl)
lblTurn = NetworkTurn
Next i
Close #1
Else: tmrTurn.Enabled = False
    Flags = 1
    tmrNetwork.Enabled = True
    


End If


Flag = Flag + 1

End Sub
