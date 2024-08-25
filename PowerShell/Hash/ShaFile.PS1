function Get-FileSHA1(){

    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
        )]
        [string] $filePath
    )

    Begin{
        $sha1 = New-Object System.Security.Cryptography.SHA1Managed
        $prettyHashSB = New-Object System.Text.StringBuilder
    }

    process{
        $fileContent = Get-Content $filePath
        $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)   
        $has = $sha1.ComputeHash($fileBytes)
        foreach($byte in $has){
            $hexaNotation = $byte.toString("X2")
            $prettyHashSB.Append($hexaNotation) > $null
        }
        $prettyHashSB.ToString()
        $prettyHashSB.Clear() > $null
    }

    end{
        $sha1.Dispose()
    }
}

<#function Get-FileSHA256(){ //NÂO FUNCIONA
    para(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true     
        )]
        [string] $filePath
    )

    begin{
        $sha256 = New-Object System.Security.Cryptography.SHA256Managed
        $prettyHashSB = New-Object System.Text.StringBuilder
    }

    process{
        $fileContent = Get-Content $filePath
        $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
        $has = $sha256.ComputeHash($fileBytes)
        foreach($byte in $has){
            $hexaNotation = $byte.toString("X2")
            $prettyHashSB.Append($hexaNotation) > $null
        }
        $prettyHashSB.ToString()
        $prettyHashSB.Clear() > $null
    }

    end{
        sha256.Dispose()    
    }


}
#>
