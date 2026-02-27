$src = "C:\Users\ronny\.gemini\antigravity\brain\9cc49dc0-3f30-4b8f-b384-838ce0a0fed6\story_farmers_1772215086103.png"
$dst = "C:\Users\ronny\Desktop\backyardcoffee\assets\story-farmers.png"

if (Test-Path $src) {
    [System.IO.File]::Copy($src, $dst, $true)
    Write-Host "Copied story-farmers.png"
}
else {
    Write-Host "NOT FOUND: story_farmers_1772215086103.png"
}
Write-Host "Done."
