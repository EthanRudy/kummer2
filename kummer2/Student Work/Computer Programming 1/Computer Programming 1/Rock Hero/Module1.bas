Attribute VB_Name = "Module1"
Global song As String
Type note
    when As Long
    what As Integer
End Type
Global notes(100000) As note
Global jim As Long
Global counters As Long
Type key
    moving As Integer
End Type
Global key1(3) As key
Global key2(3) As key
Global key3(3) As key
Global key4(3) As key
Global body As String
Global gametype As Integer
Global playa As Integer
Global oos As Long
Global scorez As Long
Type dude
    name As String * 20
    score As Long
End Type
Global arrdude(10) As dude
