Attribute VB_Name = "Module1"
Type card
    suit As String * 1
    value As String * 1
End Type
Global deck(51) As card
Global hand(5) As card
Global gamepath As String
Type player
    bet As Integer
    handvalue As Integer
    numberofcards As Integer
    chips As Integer
End Type
Global player(10) As player
Global you As Integer

