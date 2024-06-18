## ENV VARIABLES
.\Variables.ps1

## ALIAS
Remove-Alias "cd"

Set-Alias "cd" "z"

## PROGRAMS
Invoke-Expression (&starship init powershell)

Invoke-Expression (& { (zoxide init powershell | Out-String) })

## GENERAL FUNCTIONS

function l { lsd -l }

function yy {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

# ENV FUNCTIONS

.\Functions.ps1
