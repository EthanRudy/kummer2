VERSION 5.00
Begin VB.Form frmplyrchoose 
   Caption         =   "Form1"
   ClientHeight    =   7995
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10845
   LinkTopic       =   "Form1"
   ScaleHeight     =   7995
   ScaleWidth      =   10845
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "GO!!!"
      Height          =   975
      Left            =   4320
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   1680
      Width           =   1335
   End
   Begin VB.ListBox List2 
      Height          =   450
      Left            =   8280
      TabIndex        =   10
      Top             =   1320
      Width           =   2175
   End
   Begin VB.ListBox List1 
      Height          =   450
      Left            =   8280
      TabIndex        =   9
      Top             =   360
      Width           =   2175
   End
   Begin VB.ComboBox CP2 
      Height          =   315
      ItemData        =   "Form1.frx":0000
      Left            =   6840
      List            =   "Form1.frx":0019
      TabIndex        =   8
      Text            =   "Player 2..."
      Top             =   1920
      Width           =   1215
   End
   Begin VB.ComboBox CP1 
      Height          =   315
      ItemData        =   "Form1.frx":004C
      Left            =   1920
      List            =   "Form1.frx":0065
      TabIndex        =   7
      Text            =   "Player 1..."
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label14 
      BackColor       =   &H000000FF&
      Height          =   495
      Left            =   7680
      TabIndex        =   18
      Top             =   2760
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label13 
      BackColor       =   &H00FF0000&
      Height          =   495
      Left            =   6720
      TabIndex        =   17
      Top             =   4440
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label12 
      BackColor       =   &H00000000&
      Height          =   495
      Left            =   7680
      TabIndex        =   16
      Top             =   4200
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label11 
      BackColor       =   &H00800000&
      Height          =   495
      Left            =   6720
      TabIndex        =   15
      Top             =   3360
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label10 
      BackColor       =   &H0000FFFF&
      Height          =   495
      Left            =   7680
      TabIndex        =   14
      Top             =   4920
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label9 
      BackColor       =   &H0000FF00&
      Height          =   495
      Left            =   7680
      TabIndex        =   13
      Top             =   3480
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label8 
      BackColor       =   &H00FFFF00&
      Height          =   495
      Left            =   5880
      TabIndex        =   12
      Top             =   3840
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label7 
      BackColor       =   &H00FFFF00&
      Height          =   495
      Left            =   3240
      TabIndex        =   6
      Top             =   3840
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label6 
      BackColor       =   &H0000FF00&
      Height          =   495
      Left            =   1560
      TabIndex        =   5
      Top             =   3480
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label5 
      BackColor       =   &H0000FFFF&
      Height          =   495
      Left            =   1560
      TabIndex        =   4
      Top             =   4920
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label4 
      BackColor       =   &H00800000&
      Height          =   495
      Left            =   2400
      TabIndex        =   3
      Top             =   3360
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label3 
      BackColor       =   &H00000000&
      Height          =   495
      Left            =   1560
      TabIndex        =   2
      Top             =   4200
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label2 
      BackColor       =   &H00FF0000&
      Height          =   495
      Left            =   2400
      TabIndex        =   1
      Top             =   4440
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label1 
      BackColor       =   &H000000FF&
      Height          =   495
      Left            =   1560
      TabIndex        =   0
      Top             =   2760
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Image Image1 
      Height          =   9525
      Left            =   0
      Picture         =   "Form1.frx":0098
      Top             =   0
      Width           =   13485
   End
End
Attribute VB_Name = "frmplyrchoose"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

frmplyrchoose.Visible = False
Form1.Visible = True

Form1.Timer6.Enabled = False
Form1.Timer7.Enabled = False



If arrp1(1) = "1" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankred.gif")
ElseIf arrp1(1) = "2" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankblue.gif")
ElseIf arrp1(1) = "3" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankpurple.gif")
ElseIf arrp1(1) = "4" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankteal.gif")
ElseIf arrp1(1) = "5" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankyellow.gif")
ElseIf arrp1(1) = "6" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankgreen.gif")
ElseIf arrp1(1) = "7" Then
    Form1.Image1.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankblack.gif")
End If



If arrp2(1) = "1" Then
    Form1.Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankred.gif")
ElseIf arrp2(1) = "2" Then
    Form1.Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankblue.gif")
ElseIf arrp2(1) = "3" Then
    Form1.Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankpurple.gif")
ElseIf arrp2(1) = "4" Then
    Form1.Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankteal.gif")
ElseIf arrp2(1) = "5" Then
    Form1.Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankyellow.gif")
ElseIf arrp2(1) = "6" Then
    Form1.Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankgreen.gif")
ElseIf arrp2(1) = "7" Then
    Form1.Image2.Picture = LoadPicture("\\Gk08\student work\Writable Folder\Tanks\tanks\tankblack.gif")
End If

End Sub

Private Sub CP1_Click()

If CP1.Text = "Red" Then
    arrp1(1) = 1
ElseIf CP1.Text = "Blue" Then
    arrp1(1) = 2
ElseIf CP1.Text = "Purple" Then
    arrp1(1) = 3
ElseIf CP1.Text = "Cyan" Then
    arrp1(1) = 4
ElseIf CP1.Text = "Yellow" Then
    arrp1(1) = 5
ElseIf CP1.Text = "Green" Then
    arrp1(1) = 6
ElseIf CP1.Text = "Black" Then
    arrp1(1) = 7
End If



List1.Clear
List1.AddItem arrp1(1)


If CP1.Text = "Red" Then
    Label1.Visible = True
    Label2.Visible = False
    Label3.Visible = False
    Label4.Visible = False
    Label5.Visible = False
    Label6.Visible = False
    Label7.Visible = False
    
ElseIf CP1.Text = "Blue" Then
    Label1.Visible = False
    Label2.Visible = True
    Label3.Visible = False
    Label4.Visible = False
    Label5.Visible = False
    Label6.Visible = False
    Label7.Visible = False
   
ElseIf CP1.Text = "Purple" Then
    Label1.Visible = False
    Label2.Visible = False
    Label3.Visible = False
    Label4.Visible = True
    Label5.Visible = False
    Label6.Visible = False
    Label7.Visible = False
    
ElseIf CP1.Text = "Cyan" Then
    Label1.Visible = False
    Label2.Visible = False
    Label3.Visible = False
    Label4.Visible = False
    Label5.Visible = False
    Label6.Visible = False
    Label7.Visible = True
    
ElseIf CP1.Text = "Yellow" Then
    Label1.Visible = False
    Label2.Visible = False
    Label3.Visible = False
    Label4.Visible = False
    Label5.Visible = True
    Label6.Visible = False
    Label7.Visible = False
    
ElseIf CP1.Text = "Green" Then
    Label1.Visible = False
    Label2.Visible = False
    Label3.Visible = False
    Label4.Visible = False
    Label5.Visible = False
    Label6.Visible = True
    Label7.Visible = False
    
ElseIf CP1.Text = "Black" Then
    Label1.Visible = False
    Label2.Visible = False
    Label3.Visible = True
    Label4.Visible = False
    Label5.Visible = False
    Label6.Visible = False
    Label7.Visible = False
    
End If




End Sub

Private Sub CP2_Click()

If CP2.Text = "Red" Then
    arrp2(1) = 1
ElseIf CP2.Text = "Blue" Then
    arrp2(1) = 2
ElseIf CP2.Text = "Purple" Then
    arrp2(1) = 3
ElseIf CP2.Text = "Cyan" Then
    arrp2(1) = 4
ElseIf CP2.Text = "Yellow" Then
    arrp2(1) = 5
ElseIf CP2.Text = "Green" Then
    arrp2(1) = 6
ElseIf CP2.Text = "Black" Then
    arrp2(1) = 7
End If




List2.Clear
List2.AddItem arrp2(1)





If CP2.Text = "Red" Then
    Label14.Visible = True
    Label13.Visible = False
    Label12.Visible = False
    Label11.Visible = False
    Label10.Visible = False
    Label9.Visible = False
    Label8.Visible = False
    
ElseIf CP2.Text = "Blue" Then
    Label14.Visible = False
    Label13.Visible = True
    Label12.Visible = False
    Label11.Visible = False
    Label10.Visible = False
    Label9.Visible = False
    Label8.Visible = False
   
ElseIf CP2.Text = "Purple" Then
    Label14.Visible = False
    Label13.Visible = False
    Label12.Visible = False
    Label11.Visible = True
    Label10.Visible = False
    Label9.Visible = False
    Label8.Visible = False
    
ElseIf CP2.Text = "Cyan" Then
    Label14.Visible = False
    Label13.Visible = False
    Label12.Visible = False
    Label11.Visible = False
    Label10.Visible = False
    Label9.Visible = False
    Label8.Visible = True
    
ElseIf CP2.Text = "Yellow" Then
    Label14.Visible = False
    Label13.Visible = False
    Label12.Visible = False
    Label11.Visible = False
    Label10.Visible = True
    Label9.Visible = False
    Label8.Visible = False
    
ElseIf CP2.Text = "Green" Then
    Label14.Visible = False
    Label13.Visible = False
    Label12.Visible = False
    Label11.Visible = False
    Label10.Visible = False
    Label9.Visible = True
    Label8.Visible = False
    
ElseIf CP2.Text = "Black" Then
    Label14.Visible = False
    Label13.Visible = False
    Label12.Visible = True
    Label11.Visible = False
    Label10.Visible = False
    Label9.Visible = False
    Label8.Visible = False
    
End If




End Sub

