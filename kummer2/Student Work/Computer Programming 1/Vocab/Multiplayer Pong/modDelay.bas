Attribute VB_Name = "modDelay"
Option Explicit
Public Declare Function GetTickCount Lib "kernel32" () As Long

Public Sub Delay(milliseconds As Long)
Dim initTime As Long
Dim FinTime As Long

initTime = GetTickCount

Do
 FinTime = GetTickCount
 'do events allows us to do other stuff while waiting
 DoEvents
Loop Until FinTime >= initTime + milliseconds
End Sub
