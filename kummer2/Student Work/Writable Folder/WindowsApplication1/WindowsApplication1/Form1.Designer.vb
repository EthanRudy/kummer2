<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.txtage = New System.Windows.Forms.TextBox
        Me.cmdfind = New System.Windows.Forms.Button
        Me.Label2 = New System.Windows.Forms.Label
        Me.lbldogyears = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(64, 80)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(76, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Enter your age"
        '
        'txtage
        '
        Me.txtage.Location = New System.Drawing.Point(146, 80)
        Me.txtage.Name = "txtage"
        Me.txtage.Size = New System.Drawing.Size(129, 20)
        Me.txtage.TabIndex = 1
        '
        'cmdfind
        '
        Me.cmdfind.Location = New System.Drawing.Point(121, 116)
        Me.cmdfind.Name = "cmdfind"
        Me.cmdfind.Size = New System.Drawing.Size(101, 27)
        Me.cmdfind.TabIndex = 2
        Me.cmdfind.Text = "Find"
        Me.cmdfind.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(67, 168)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(57, 13)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "Dog Years"
        '
        'lbldogyears
        '
        Me.lbldogyears.BackColor = System.Drawing.Color.White
        Me.lbldogyears.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lbldogyears.Location = New System.Drawing.Point(147, 166)
        Me.lbldogyears.Name = "lbldogyears"
        Me.lbldogyears.Size = New System.Drawing.Size(127, 15)
        Me.lbldogyears.TabIndex = 4
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(718, 599)
        Me.Controls.Add(Me.lbldogyears)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.cmdfind)
        Me.Controls.Add(Me.txtage)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txtage As System.Windows.Forms.TextBox
    Friend WithEvents cmdfind As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents lbldogyears As System.Windows.Forms.Label

End Class
