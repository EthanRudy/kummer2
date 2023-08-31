Public Class Form1

    Private Sub txtage_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtage.TextChanged

    End Sub

    Private Sub cmdfind_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdfind.Click
        Dim hy As Integer, dy As Integer
        hy = Val(txtage.Text)
        dy = hy * 7
        lbldogyears.Text = dy
    End Sub
End Class
