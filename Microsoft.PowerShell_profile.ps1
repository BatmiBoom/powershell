# STARSHIP
Invoke-Expression (&starship init powershell)

# ZOXIDE
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ALIASES
# Set-Alias l /Powershell/lsd.ps1
Set-Alias which gcm

# GENERAL FUNCTIONS
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
  lsd -la --tree --depth 1
}
