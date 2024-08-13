param($tipoDeExportacao)
$ErroActionPreference = "Stop"
Set-Location C:\Users\boers

$nameExpr = @{
	Label="Nome";
	Expression={$_.Name}
}

$lengthExpr = @{
	Label="Tamanho";
	Expression={"{0:N2}KB" -f ($_.Length / 1KB)}
}

$params = $nameExpr, $lengthExpr

$resultado = gci -Recurse -File |
	? Name -like "**" |
	select $params

Set-Location C:\Users\boers\MyDocuments\ScriptPowerShell

if ($tipoDeExportacao -eq 'HTML') {
	$estilo = Get-Content C:\Users\boers\MyDocuments\ScriptPowerShell\styles.css
	$styleTag = "<style> $estilo </style>"
	$titulo = "Relatorio"
	$tituloBody = "<h1> $titulo </h1>"
	$resultado |
		ConvertTo-Html -Head $styleTag -Title $titulo -Body $tituloBody |
		Out-File C:\Users\boers\MyDocuments\ScriptPowerShell\testePowerShell.html
} elseif ($tipoDeExportacao -eq 'JSON') {
	$resultado |
		ConvertTo-JSON |
		Out-File C:\Users\boers\MyDocuments\ScriptPowerShell\testePowerShell.json
} elseif ($tipoDeExportacao -eq 'CSV') {
	$resultado |
		ConvertTo-CSV -NoTypeInformation |
		Out-File C:\Users\boers\MyDocuments\ScriptPowerShell\testePowerShell.csv
}





