function MainMenu($Message) {
    Clear-Host
    Write-Host "=== Rock-Paper-Scissors ==="
    Write-Host "Please choose an option below:"
    Write-Host "1) Singeplayer"
    Write-Host "2) Multiplayer"
    Write-Host "3) Reset Score"
    Write-Host "4) Quit"
    Write-Host "`n$Message"

    # Use the switch statement to choose an option
    switch (Read-Host) {
    1 {Singeplayer}
    2 {MainMenu("Error: Multiplayer unavailable!")} 
    3 {MainMenu("Error: Option unavailable!")}
    4 {Break}
    default {MainMenu("Error: You did not choose a valid option")}
    }
}

function Singeplayer {

#Score System

if (-not $global:playerScore) { $global:playerScore = 0 }
if (-not $global:botScore) { $global:botScore = 0 }

Clear-Host
Write-Host "Welcome in Rock-Paper-Scissors Singeplayer mode!"
Write-Host ""

#PlayerChoice

do {
    Write-Host "Válasszon az alábbiak közül:"
    Write-Host "1 - Kő"
    Write-Host "2 - Papír"
    Write-Host "3 - Olló"
    $playersChoice = Read-Host "Adja meg a választását (1/2/3)"
    Write-Host ""
   
        switch ($playersChoice) {
            "1" { Write-Host "You chose: Kő" }
            "2" { Write-Host "You chose: Papír" }
            "3" { Write-Host "You chose: Olló" }
            default {Write-Host "Érvénytelen opció! Próbálja újra." -ForegroundColor Red}
        }
} until ($playersChoice -in @("1", "2", "3"))


# Bot Choice

do {
        $Botoptions = @("1", "2", "3")
        $BotChoice = $Botoptions | Get-Random
        switch ($BotChoice) {
            "1" { Write-Host "Bot chose: Kő" }
            "2" { Write-Host "Bot chose: Papír" }
            "3" { Write-Host "Bot chose: Olló" }
        }
} until ($BotChoice -in @("1", "2", "3"))
Write-Host ""

#Author: Nagy Robin
# Döntési logika
 #"1 - Kő"
 #"2 - Papír"
 #"3 - Olló"

if ($playerschoice -eq $BotChoice) {
    Write-Host "Döntetlen!"
} elseif (
        ($playerschoice -eq "1" -and $BotChoice -eq "3") -or
        ($playerschoice -eq "2" -and $BotChoice -eq "1") -or
        ($playerschoice -eq "3" -and $BotChoice -eq "2")
) {
    Write-Host "Nyertél!"
    $global:playerScore++
} else {
    Write-Host "Gép Nyert!"
    $global:botScore++
}
Write-Host ""
Write-Host "Score:"
Write-Host "Player: $global:playerScore"
Write-Host "Bot: $global:botScore"

# Új kör előtti szünet
Write-Host "-----------------------------------------"

Write-Host "Szeretne új játékot játszani? (Y/N)"
Write-Host ""
$continue = Read-Host "Kérem válasszon"

switch ($continue) {
    Y {Singeplayer}
    N {MainMenu}
    Default {Write-Host "Érvénytelen opció! Próbálja újra." -ForegroundColor Red}
}

}


MainMenu
