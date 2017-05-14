clear
<#
  Adding a comment section here too.
  Even though I know this is not proper PowerShell comment block.
#>

#Open a SQL Connection object
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
#$SqlConnection.ConnectionString = "Server=ABACUS\SQLEXPRESS;Database=test;Integrated Security=True;Application Name=SSL Test;Encrypt=TRUE"
$SqlConnection.ConnectionString = "Server=ABACUS\SQLEXPRESS;Database=test;Integrated Security=True;Application Name=SSL Test"
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = "select * from Table1"
$SqlCmd.Connection = $SqlConnection
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd
$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)
$SqlConnection.Close()

foreach ($row in $DataSet.Tables[0])
{
	$text = "ID:" + $row.col1.ToString() + " Inserted on: " + $row.DateInserted.ToString()
	Write-Host $text
}

 
