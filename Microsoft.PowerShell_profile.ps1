# STARSHIP
Invoke-Expression (&starship init powershell)

# ZOXIDE
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# PYENV
#Invoke-Expression (&pyenv init -)

# ALIASES
# Set-Alias l /Powershell/lsd.ps1
# Set-Alias -Name q -Value gcm 

# EXPLORER
function yy {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

# UTILS
function q {
  gcm $args | Select source
}

function l {
  lsd -l $args
}

function tree {
  lsd -la --tree --depth 1
}

function git-last-five-commit {
    git log | rg "commit" -m 5
}

# DOCKER
function docker-stop {
  docker stop $(docker ps -q)
}

function git-reset {
    git reset --hard $args
}
