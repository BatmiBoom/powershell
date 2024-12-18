$env:LANG="en_US.UTF-8"
$env:EDITOR="nvim"

$env:DEV_MODE = "BRAINHI"

$env:PATH+=":$HOME/bin:/usr/local/bin"

# NODE PATH
$env:PATH+=":/usr/local/bin/node"
$env:PATH+=":/usr/local/bin/npm"


# NIM Path
$env:PATH+=":/Users/batmi/.nimble/bin"

# LLVM PATH
$env:PATH+=":/usr/local/sbin"
$env:PATH+=":/opt/homebrew/opt/llvm/bin"
$env:LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
$env:CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Python dep
$env:PYENV_ROOT="$HOME/.pyenv"
$env:PATH+=":/Users/batmi/.pyenv/bin"
$env:PATH+=":/Users/batmi/.pyenv/versions/3.9.20/bin"
$env:PATH+=":/Users/batmi/.pyenv/shims"

# LSP SERVERS

# ZIG
$env:PATH+=":/Users/batmi/.local/zig"

# ODIN
$env:PATH+=":/Users/batmi/.odin"
$env:PATH+=":/Users/batmi/.ols"

# GO
$env:GOROOT="/usr/local/go"
$env:GOPATH="/Users/batmi/go"
$env:PATH+=":/Users/batmi/programs/go/bin"
$env:PATH+=":/Users/batmi/go/bin"
$env:PATH+=":${GOPATH}/bin"

# CARGO
$env:PATH+=":/Users/batmi/.cargo/bin"

# ODIN
$env:PATH+=":/Users/batmi/odin"
$env:PATH+=":/Users/batmi/ols"

# NVIM
$env:PATH+=":/Users/batmi/nvim/bin"

# LOCAL
$env:PATH+=":/Users/batmi/.local/bin"

# Doom Emacs
$env:PATH+=":/Users/batmi/.config/emacs/bin"

# HOMEBREW
$env:PATH+=":/opt/homebrew/bin"

$env:MANPATH=":/usr/local/man"

# MASON
$env:PATH+=":/Users/batmi/.local/share/nvim/mason/bin"

# VENV PATH
$env:WORKON_HOME=":/Users/batmi/Library/Caches/pypoetry/virtualenvs/"

# DENO
$env:PATH+=":/Users/batmi/.deno/bin"

# WEZTERM
$env:PATH+=":/Applications/WezTerm.app/Contents/MacOS"
$env:PATH+=":/Applications"

# LIBPQ
$env:DOCKER_DEFAULT_PLATFORM="linux/amd64"

function shipit { gh workflow run create-release-pr.yml }

function connect {
  sshuttle --dns -r $args
} 

function reload_env {
  . $PROFILE
  . ~/.config/powershell/Profile.ps1
}

function reset_nvim {
   rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim
}

function up { docker-compose up --build }
function down { docker-compose down -v }
function shell { docker-compose run web python manage.py shell_plus }
function test { docker-compose run -e DJANGO_CONFIGURATION=Testing web pytest --reuse-db $args}
function testclean { docker-compose run -e DJANGO_CONFIGURATION=Testing web pytest }
function cov {docker-compose run -e DJANGO_CONFIGURATION=Testing web pytest --reuse-db --cov=cosmos }
function migrate {docker-compose run web python manage.py migrate}
function migrate_specific {docker-compose run web python manage.py migrate cosmos 0237_auto_20240626_1955}
function makemigrations { docker-compose run web python manage.py makemigrations --lint }
function makemigrationsinbox { docker-compose run web python manage.py makemigrations inbox --lint }
function makemigrationscalendar { docker-compose run web python manage.py makemigrations calendars --lint }
function makemigrationscosmos { docker-compose run web python manage.py makemigrations cosmos --lint }
function makemigrationsempty { docker-compose run web python manage.py makemigrations --empty }
function makemigrationsmerge { docker-compose run web python manage.py makemigrations --merge }
function makemigrationssql { docker-compose run web python manage.py sqlmigrate }
function makemigrationslint { docker-compose run web python manage.py lintmigrations --no-cache }

