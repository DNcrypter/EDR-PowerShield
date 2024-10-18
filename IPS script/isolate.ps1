. .\config.ps1



# Function to disable network adapter

function Disable-NetworkAdapter {
    param (
        [string]$adapterName
    )
    Disable-NetAdapter -Name $adapterName -Confirm:$false
    Write-Host "Network adapter $adapterName has been disabled."
}



# Function to enable network adapter

function Enable-NetworkAdapter {
    param (
        [string]$adapterName
    )
    Enable-NetAdapter -Name $adapterName -Confirm:$false
    Write-Host "Network adapter $adapterName has been re-enabled."
}



# Disable network adapter
Disable-NetworkAdapter -adapterName $global:NetworkAdapter


Start-Sleep -Seconds 1800

# Enable network adapter
Enable-NetworkAdapter -adapterName $global:NetworkAdapter
