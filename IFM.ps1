
Write-Host ""
Write-Host "What do you like to do?" 
Write-Host ""
Write-Host "A) Collect a new baseline" -ForegroundColor Cyan -BackgroundColor Gray
Write-Host "B) Begin monitoring files with the baseline" -ForegroundColor Blue -BackgroundColor Gray

Function Filehash ($filepath) {
    $Calchash= Get-FileHash -Path $filepath -Algorithm SHA512
    return $Calchash
}

Function Delete-Baseline-if-already-exists () {
    $baselineExists = Test-Path -Path "Path" #Enter path of your baseline
    
    if ($baselineExists) {
        Remove-Item .\baseline.txt -ErrorAction SilentlyContinue
    }
}

while ($true) {
    Write-Host ""
    $userInput = Read-Host "Enter a character (type 'exit' to quit)"
    
    if ($userInput -eq "exit".ToUpper()) {
        # Exits the program
        Write-Output "Exiting program..." 
        break
    }
    
    elseif ($userInput -eq "a".ToUpper()) {
        # Calculate hash from baseline and store it in baseline.txt
        #Delete baseline if already exists
        Delete-Baseline-if-already-exists 
        Write-Host "Calculating hashes and creating baseline.txt" -ForegroundColor Cyan
        $files = Get-ChildItem -Path .\Directory #Enter the directory to scan
        foreach ($f in $files) {
            $hash = Filehash $f.FullName
            "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\baseline.txt -Append
        }
    }
    

    elseif ($userInput -eq "b".ToUpper()) {
        #Load files from baseline text file to dictionary
        Write-Host "Reading baseline.txt and monitoring files" -ForegroundColor Green
        $HashDictionary = @{}
        $filePathandHashes = Get-Content -path baseline.txt
        
        foreach ($f in $filePathandHashes) {
            $HashDictionary.Add($f.Split("|")[0],$f.Split("|")[1])
            
        }
        # Begin file monitoring with baseline
        while ($true) {
            Start-Sleep 1
            $files = Get-ChildItem -Path .\Directory #Enter directory to scan
            foreach ($f in $files) {
                $hash = Filehash $f.FullName
                
                #Check if a new file has been created 
                if ($HashDictionary[$hash.Path] -eq $null) {
                    Write-Host "$($hash.Path) is created!" -ForegroundColor Yellow
                }
                
                #Check if a file has been changed
                else {
                    if ($HashDictionary[$hash.Path] -eq $hash.Hash) {
                    #File has not been changed
                    }
                    else {
                        #File has been changed
                        Write-Host "$($hash.Path) has been changed" -ForegroundColor Red
                    }
                }
                
               
                
            }  
            #Check if a file is deleted
            foreach ($key in $HashDictionary.Keys) {
               $baselinestillexists = Test-Path -Path $key
               if (-Not $baselinestillexists) {
                   #File has been deleted
                   Write-Host "$($key) has been deleted" -ForegroundColor Magenta
               }
           }  
            
        }
        
    }
}
