$images = @{
    "event_wedding_sketch_1772217156942.png"       = "event-wedding-sketch.png"
    "event_corporate_sketch_v2_1772217156942.png"  = "event-corporate-sketch.png"
    "event_festival_sketch_v2_1772217156942.png"   = "event-festival-sketch.png"
    "event_graduation_sketch_v2_1772217156942.png" = "event-graduation-sketch.png"
    "event_party_sketch_v2_1772217156942.png"      = "event-party-sketch.png"
    "event_market_sketch_v2_1772217156942.png"     = "event-market-sketch.png"
}

$brainDir = "C:\Users\ronny\.gemini\antigravity\brain\9cc49dc0-3f30-4b8f-b384-838ce0a0fed6"
$assetsDir = "C:\Users\ronny\Desktop\backyardcoffee\assets"

foreach ($brainFile in $images.Keys) {
    $src = Join-Path $brainDir $brainFile
    $dst = Join-Path $assetsDir $images[$brainFile]
    
    if (Test-Path $src) {
        [System.IO.File]::Copy($src, $dst, $true)
        Write-Host "Copied $brainFile to $($images[$brainFile])"
    }
    else {
        $searchName = $brainFile -replace "_\d+\.png", ""
        $found = Get-ChildItem -Path $brainDir -Filter "$searchName*.png" | Sort-Object LastWriteTime -Descending | Select-Object -First 1
        if ($found) {
            [System.IO.File]::Copy($found.FullName, $dst, $true)
            Write-Host "Found and copied $($found.Name) to $($images[$brainFile])"
        }
        else {
            Write-Host "NOT FOUND: $searchName"
        }
    }
}
Write-Host "Done."
