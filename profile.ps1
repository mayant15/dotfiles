# A powershell configuration for when working on Windows.
#
# Dependencies:
#  - [Starship](https://starship.rs/) prompt

Write-Output "Hello Mayant! Initializing..."

###############################################################################
# Aliases
###############################################################################

# Git helpers

function gts { git status }
function gtl { git log --oneline }
function gta {
    param ([Parameter(ValueFromRemainingArguments = $true)]$params)
    git add $params    
}

###############################################################################
# Prompt
###############################################################################

Invoke-Expression (&starship init powershell)

# Place the Starship config besides powershell profile
$PROFILE_DIR = Split-Path -Path "$PROFILE"
$ENV:STARSHIP_CONFIG = "$PROFILE_DIR\starship.toml"

###############################################################################

Write-Output "Done!"
