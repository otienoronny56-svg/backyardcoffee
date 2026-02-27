$src = "C:\Users\ronny\.gemini\antigravity\brain\9cc49dc0-3f30-4b8f-b384-838ce0a0fed6"
$dst = "C:\Users\ronny\Desktop\backyardcoffee\assets"

$files = @(
    @{ From = "setup_branded_cup_1772209796794.png";  To = "setup-branded-cup.png" },
    @{ From = "setup_outdoor_bar_1772209812488.png";   To = "setup-outdoor-bar.png" },
    @{ From = "setup_espresso_machine_1772209827740.png"; To = "setup-espresso-machine.png" },
    @{ From = "setup_team_photo_1772209846319.png";    To = "setup-team-photo.png" },
    @{ From = "setup_full_bar_1772209860606.png";      To = "setup-full-bar.png" }
)

foreach ($f in $files) {
    $from = Join-Path $src $f.From
    $to   = Join-Path $dst $f.To
    if (Test-Path $from) {
        [System.IO.File]::Copy($from, $to, $true)
        Write-Host "Copied $($f.To)"
    } else {
        Write-Host "NOT FOUND: $($f.From)"
    }
}
Write-Host "Done."
