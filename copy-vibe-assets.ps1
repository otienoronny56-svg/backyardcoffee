$images = @{
    "vibe_golden_hour_1772215706350.png"   = "vibe-golden-hour.png"
    "vibe_cocktail_pour_1772215724413.png" = "vibe-cocktail-pour.png"
    "vibe_happy_crowd_1772215743605.png"   = "vibe-happy-crowd.png"
    "vibe_night_cozy_1772215760952.png"    = "vibe-night-cozy.png"
}

$brainDir = "C:\Users\ronny\.gemini\antigravity\brain\9cc49dc0-3f30-4b8f-b384-838ce0a0fed6"
$assetsDir = "C:\Users\ronny\Desktop\backyardcoffee\assets"

if (!(Test-Path $assetsDir)) { New-Item -ItemType Directory -Path $assetsDir -Force }

foreach ($brainFile in $images.Keys) {
    $src = Join-Path $brainDir $brainFile
    $dst = Join-Path $assetsDir $images[$brainFile]
    
    if (Test-Path $src) {
        [System.IO.File]::Copy($src, $dst, $true)
        Write-Host "Copied $brainFile to $($images[$brainFile])"
    }
    else {
        Write-Host "NOT FOUND: $brainFile"
    }
}
Write-Host "Done."
