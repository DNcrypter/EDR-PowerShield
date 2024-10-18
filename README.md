
#  ****EDR**** - PowerShield
## EDR Security Solution: 

**EDR** is powerful tool combines IDS (Intrusion Detection System) and IPS (Intrusion Prevention System) capabilities into a single, efficient package. Leveraging ***PowerShell scripts***, it continuously monitors network activity, isolates compromised machines upon detecting anomalies, and send detailed alerts and triage reports via email and Slack. It consider to be vital asset for proactive network security management.

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
        [![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue)](https://www.linkedin.com/in/nikhil--chaudhari/)
        [![Medium](https://img.shields.io/badge/Medium-Writeups-black)](https://medium.com/@nikhil-c)

## Features

- **Advanced Monitoring**: Continuously monitors network activities to detect any anomalies or suspicious behavior.
- **Automated Isolation**: Instantly ***isolates*** compromised machines from the network upon detecting multiple failed login attempts.
- **Real-time Alerts**: Sends immediate notifications and detailed triage reports over email and slack channel.
- **Customizable Options**: Allows users to specify target IP ranges and port lists.
- **Scalable and Efficient**: Designed to handle large-scale network environments with ***minimal resource*** usage, ensuring robust security management

## Installation / Setup

### Prerequisites:
- PowerShell 5.1 or later
- An active Slack Webhook URL
- email address for send triaged report.

1. **Clone the Repository**
   ```bash
   git clone https://github.com/DNcrypter/EDR-PowerShield.git
   
   ```

2. **Navigate to Directory**
    ```bash
   cd EDR-PowerShield
   ```

3. **Configure cofig.ps1 file**
  ```bash 
$global:NetworkAdapter = "Ethernet" # Change to your network adapter name
$global:SlackWebhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
$global:SmtpServer = "smtp.yourmailserver.com"
$global:SmtpFrom = "alert@yourdomain.com"
$global:SmtpTo = "admin@yourdomain.com"
$global:SmtpSubject = "Alert: System Compromised"

  ```

 ***Note:*** Ensure MonitorLoginAttempts.ps1, isolate.ps1, and send_slack_mail.ps1 are in the same directory as config.ps1. 
 
4. **Run the Monitoring Script**
Start the monitoring script to begin tracking login attempts:
```powershell
powershell -ExecutionPolicy Bypass -File .\MonitorLoginAttempts.ps1
```
5. **Set Up Script to Run on Startup**
- Open Task Scheduler and create a new task.

- Set the trigger to "At startup".

- Set the action to "Start a Program" and point to the MonitorLoginAttempts.ps1 script.

- Ensure the task is set to run with the highest privileges.

![Screenshot 1](https://github.com/DNcrypter/EDR-PowerShield\statics\Screenshot_1)
![Screenshot 2](https://github.com/DNcrypter/EDR-PowerShield\statics\Screenshot_2)

## Future release
I am working on this project some more ideas are in my mind. Some more advancement i am thinking and you will get to see advance features in future release....

**tip**:- "Fellow researchers, focus on understanding concepts deeply rather than rote memorization. Practice, practice, and practice again."

## contributions
Pull requests are always welcome and appreciated. Your contributions help make this project even better for everyone.

