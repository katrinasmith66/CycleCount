﻿Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_settings_height
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBox2 As Obout.ListBox.ListBox

     Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(150)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CountryName"
        ListBox1.DataValueField = "CountryID"
        ListBox1.SelectedIndex = 3

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
End Class
