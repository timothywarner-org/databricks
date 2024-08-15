# Get network adapter
$adapters = Get-NetAdapter

# Filter out virtual and disabled adapters
$activeAdapters = $adapters | Where-Object { $_.Physical -eq $true -and $_.Status -eq 'Up' }

# Select relevant properties and format the output
$report = $activeAdapters | Select-Object Name, InterfaceDescription, Status, MacAddress, LinkSpeed | Format-Table -AutoSize | Out-String

# Write the output to a file
$report | Out-File -FilePath "NetworkAdaptersReport.txt"