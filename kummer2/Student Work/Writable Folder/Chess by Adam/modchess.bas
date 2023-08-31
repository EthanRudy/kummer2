Attribute VB_Name = "modchess"
Type square
    team As Integer '0 = none, 1 = white, 2 = black
    type As Integer '0 = none, 1 = pawn, 2 = rook, 3 = knight, 4 = bishop, 5 = queen, 6 = king
    available As Integer '0 Not available, 1 Available
End Type
Global tiles(88) As square
Global yourplayer As Integer
Global playerturn As Integer
Global yourname As String
Global yourpos As Integer
Global theirname As String
Global numnames As Integer
Type player
    name As String * 10 '10
    wins As Integer '2
    played As Integer '2
End Type
Global players(50) As player

Sub sort(a() As player, low As Integer, high As Integer)
    Dim pivot As player, hole As Integer, i As Integer
    hole = (low + high) / 2
    pivot = a(hole)
    a(hole) = a(low)
    hole = low

    For i = low + 1 To high
        If a(i).wins >= pivot.wins Then
            a(hole) = a(i)
            hole = hole + 1
            a(i) = a(hole)
        End If
    Next i

    If hole - low > 1 Then
        sort a(), low, hole - 1
    End If
    If high - hole > 1 Then
        sort a(), hole + 1, high
    End If
    a(hole) = pivot
End Sub
