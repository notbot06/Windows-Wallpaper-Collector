<#
.SYNOPSIS
    Wallpaper-Collector-Pro: Extracts high-quality OEM assets from the Windows Web folder.
.DESCRIPTION
    Developed by notbot06 | https://github.com/notbot06
#>

# 1. System Info & Path Setup
$Vendor = (Get-CimInstance Win32_ComputerSystem).Manufacturer -replace '[\\\/\:\*\?\"<>\|]', '_'
$Model = (Get-CimInstance Win32_ComputerSystem).Model -replace '[\\\/\:\*\?\"<>\|]', '_'
$Datestamp = Get-Date -Format "yyyy-MM-dd"
$FolderID = "$Vendor" + "_" + "$Model"

# Target: (ScriptFolder)\Wallpapers\YYYY-MM-DD\Vendor_Model
$Base_Dest = Join-Path -Path $PSScriptRoot -ChildPath "Wallpapers\$Datestamp\$FolderID"
$OEM_Source = "C:\Windows\Web\Wallpaper"

Clear-Host
Write-Host "==========================================" -ForegroundColor Magenta
Write-Host "       WALLPAPER COLLECTOR PRO" -ForegroundColor White
Write-Host "        Developed by notbot06" -ForegroundColor Magenta
Write-Host "==========================================" -ForegroundColor Magenta
Write-Host "Target Folder: $FolderID" -ForegroundColor Gray
Write-Host "Source Path:   $OEM_Source" -ForegroundColor Gray
Write-Host "==========================================" -ForegroundColor Magenta

# --- Execution ---
if (Test-Path $OEM_Source) {
    Write-Host "[!] Harvesting OEM Wallpapers..." -ForegroundColor Cyan
    
    # Create the destination directory if it doesn't exist
    if (!(Test-Path $Base_Dest)) { 
        New-Item -ItemType Directory -Path $Base_Dest -Force | Out-Null 
    }
    
    # Copy everything recursively
    Copy-Item -Path "$OEM_Source\*" -Destination $Base_Dest -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "[+] Success! Wallpapers copied to your USB." -ForegroundColor Green
    Write-Host "[+] Location: $Base_Dest" -ForegroundColor Gray
} else {
    Write-Host "[-] Error: Could not find the Windows Web Wallpaper folder." -ForegroundColor Red
}

Write-Host "`n==========================================" -ForegroundColor Magenta
Write-Host "Task Complete." -ForegroundColor White
Pause