## ENV VARIABLES
.\Variables.ps1

# STARSHIP

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ALIAS

Set-Alias cd z
Set-Alias which gcm

## GENERAL FUNCTIONS
function yy {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

function l { 
  lsd -la
}

# ENV FUNCTIONS
.\Functions.ps1
