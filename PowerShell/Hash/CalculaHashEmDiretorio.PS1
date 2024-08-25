param($diretorio)

$ErrorActionPreference = "Stop"

. .\ShaFile.PS1

$arquivos = Get-ChildItem $diretorio -File #Não conseguimos fazer o HASH de diretorios
 
foreach($item in $arquivos){
    $hashItem = Get-FileSHA1 $item
    Write-Host "O hash di arquivo $item é $hashItem"
}