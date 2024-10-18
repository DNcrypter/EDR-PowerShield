. .\config.ps1



# send Slack notification

function Send-SlackNotification {
    param (
        [string]$message
    )
    $payload = @{
        text = $message
    } | ConvertTo-Json
    Invoke-RestMethod -Uri $global:SlackWebhookUrl -Method Post -ContentType 'application/json' -Body $payload
}




# Function to send email notification

function Send-EmailNotification {
    param (
        [string]$message
    )
    $smtpBody = @{
        To = $global:SmtpTo
        From = $global:SmtpFrom
        Subject = $global:SmtpSubject
        Body = $message
        SmtpServer = $global:SmtpServer
    }
    Send-MailMessage @smtpBody
}



# send alerts

function Send-Alert {
    param (
        [string]$message
    )
    Send-SlackNotification -message $message
    Send-EmailNotification -message $message
}

# Message content
$message = "Alert: The system has been isolated due to more than 6 failed login attempts. Please love over this ip:192.168.112.23"

# Send the alert
Send-Alert -message $message
