$images = @{
    "setup_grinder_pro_1772216068224.png"     = "setup-grinder-pro.png"
    "setup_branding_detail_1772216068224.png" = "setup-branding-detail.png"
    "setup_night_neon_1772216068224.png"      = "setup-night-neon.png"
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
        # Fallback to searching if exact timestamp differs (though it shouldnt)
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
