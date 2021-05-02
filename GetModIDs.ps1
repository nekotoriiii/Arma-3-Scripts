# =============================================================================
# Generate MOD ID list from a Steam Mod Collection URL
# Created by Archimedez
# Last Modified 2020-01-31
# Version 1.1
# Usage:
# 1) Create a file named: ModIDlist.ps1
# 2) Paste this code into the file
# 3) Edit the $WorkshopCollectionURL value between the '', replacing it with the URL of your mod collection
# 4) Optional: Edit the $ModList value between the '', replacing it with the path of your choice
# 5) Right-Click the file (ModIDlist.ps1), and Click Run With PowerShell
# =============================================================================
# Configurable Options Below
# =============================================================================

# Set the URL of your MOD Collection
$WorkshopCollectionURL = 'https://steamcommunity.com/sharedfiles/filedetails/?id=2466979580'

# Set Output Path and Filename of text file which will contain the MOD ID list
# Note: The MOD ID list will also be displayed on screen
$ModList = '.\Mods_List.txt'

# Shouldn't need this, but if you do or need to add additional keys/values, its here....
$headers = @{"Host" = "steamcommunity.com"}

# =============================================================================
# Change Nothing Below
# =============================================================================
CLS
$CollectionPage = Invoke-WebRequest -Uri $WorkshopCollectionURL -Headers $headers
$ModURLprefix = 'https://steamcommunity.com/sharedfiles/filedetails/?id='
$MODIDs = (($CollectionPage.Links | Where-Object {$_.innerHTML -like "*workshopItemTitle*"} ).href | Where-Object {$_ -like "$ModURLprefix*"} ).replace("$ModURLprefix","")
If (Test-Path -Path $ModList) {del $ModList}
$MODIDs | Out-File -FilePath $ModList
Write-Host "Your MOD ID list is below, and in a file at: $ModList"
$MODIDs