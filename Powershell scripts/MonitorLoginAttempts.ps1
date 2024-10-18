. .\config.ps1

# event IDs indicates here a login attempts
$failedLoginEventId = 4625


# Track failed login attempts
$failedAttempts = 0


# this is used to monitor login attempts

function MonitorLogins {
    while ($true) {
        # Fetch event logs for failed login attempts
        $failedLogins = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=$failedLoginEventId; StartTime=(Get-Date).AddMinutes(-1)}
        $failedAttempts += $failedLogins.Count


        if ($failedAttempts > 6) {
            Write-Host "More than 6 failed login attempts detected."
            
            # Trigger isolate and alert scripts
            Start-Process powershell -ArgumentList "-File .\isolate.ps1"
            Start-Process powershell -ArgumentList "-File .\send_slack_mail.ps1"
            
            $failedAttempts = 0
        }
        Start-Sleep -Seconds 10 # Sleep for a while before checking again
    }
}

# Start monitoring logins
MonitorLogins
