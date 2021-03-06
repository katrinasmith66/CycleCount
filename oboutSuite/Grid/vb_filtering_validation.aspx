﻿<%@ Page Language="VB" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script type="text/VB" runat="server">

    Private grid1 As New Grid()

    Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.FilteringSettings.InitialState = GridFilterState.Visible
        grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top
    
        grid1.ClientSideEvents.ExposeSender = True
        grid1.ClientSideEvents.OnFiltering = "grid1_OnFiltering"
    
        grid1.FolderStyle = "styles/black_glass"
        grid1.AllowFiltering = True
        grid1.ShowLoadingMessage = False
    
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "OrderID"
        oCol1.[ReadOnly] = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "125"
    
        Dim oCol2 As New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
    
        Dim oCol3 As New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"
    
        Dim oCol4 As New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"
    
        Dim oCol5 As New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "175"
    
    
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
    
    
        grid1.DataSourceID = "sds1"
    
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub

</script>

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.floating
			{
			    float: left;
			    padding-right: 10px;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>
	    <script type="text/javascript">
	        function grid1_OnFiltering(sender, filterFields, isFiltering) {
	            // isFiltering = true when the filters are applied
	            // isFiltering = false when the filters are removed

	            if (isFiltering) {
	                if (filterFields['ShipName'].Option != OboutGridFilterCriteria.NoFilter) {
	                    var filterFieldForShipName = filterFields['ShipName'].Controls[0].Control;
	                    if (filterFieldForShipName.value() == '') {
	                        alert('You need to fill in the filter field for the ShipName column.');
	                        return false;
	                    }
	                }

	                if (filterFields['ShipCountry'].Option != OboutGridFilterCriteria.NoFilter) {
	                    var filterFieldForShipCountry = filterFields['ShipCountry'].Controls[0].Control;
	                    if (filterFieldForShipCountry.value() == '') {
	                        alert('You need to fill in the filter field for the ShipCountry column.');
	                        return false;
	                    }
	                }
	            }

	            return true;
	        }	        
	    </script>		
	</head>	
	<body>	
		<form id="Form1" runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Validating Filter Fields</b></span>		
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">
		    You can use the <b>OnFiltering</b> client-side event of the Grid to perform validations before filtering the Grid.<br />
		    In the event handler of this event you have access to the selected filter option, the current filter controls and filter values for each column. <br /><br />
		    In this example, the "ShipName" and "ShipCountry" columns are validated - if you select a filter option different than "No filter" <br />
		    you need to specify a value in the filter fields of those columns, otherwise you'll get a pop-up error message.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>