function TestePing {
    param(
        [string[]] $urls
    )

    $jobScriptBlock = {
        param (
            [String] $url
        )
        Test-Connection $url -Quiet
        return $url 

    } 


   
   $urls | ForEach-Object{
    Start-Job -Name "Job_$_" -ScriptBlock $jobScriptBlock -ArgumentList($_)
    
   }


   $urls | ForEach-Object{
    Receive-Job -Name "Job_$_"
   }


}







