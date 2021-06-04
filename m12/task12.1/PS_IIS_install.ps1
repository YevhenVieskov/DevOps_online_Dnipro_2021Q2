<powershell>
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled false
Set-ExecutionPolicy Bypass -Scope Process -Force
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
netsh advFirewall Firewall add rule name="OSRadar Rule PING IPv4" protocol=icmpv4:8,any dir=in action=allow
Rename-Computer -NewName MyIISserver
</powershell>
