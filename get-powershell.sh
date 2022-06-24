#!/bin/bash
# Get Powershell

# set variables
ps_ver=$(curl -sL https://api.github.com/repos/PowerShell/PowerShell/releases/latest | jq -r ".tag_name")
sps_ver=${ps_ver:1}
#get latest stable powershell
curl -L https://github.com/PowerShell/PowerShell/releases/download/${ps_ver}/powershell-${sps_ver}-linux-arm64.tar.gz -o ./powershell-${sps_ver}-linux-arm64.tar.gz
# install the latest version
mkdir /usr/local/powershell
tar -xzvf ./powershell-${sps_ver}-linux-arm64.tar.gz -C /usr/local/powershell
chmod +x /usr/local/powershell/pwsh
ln -s /usr/local/powershell/pwsh /usr/bin/pwsh
# cleanup post install
rm ./powershell-${sps_ver}-linux-arm64.tar.gz
pwsh --version
