# Env Variables
$env:CONFIG_DIR = "$HOME\.config"

# Prompt
Import-Module posh-git

function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$THEME = Join-Path (Get-ScriptDirectory) 'kaptcha.omp.yaml'
# Alt theme
# $THEME = "$(scoop prefix oh-my-posh)\themes\takuya.omp.json"

oh-my-posh init pwsh --config $THEME | Invoke-Expression


# PSReadLine
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward


# Fzf
Import-Module PSFzf

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'


# Icons
Import-Module Terminal-Icons


# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


# Aliases
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
