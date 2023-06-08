# install choco
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install git and bash
choco install git -y

# install vsc
choco install vscode -y

# instsall python
choco install python --version=3.10 -y

# install node
choco install nodejs --version=20.2 -y

# create ssh key and cat the public key
New-Item -Path $HOME\.ssh -ItemType Directory
ssh-keygen -t rsa -b 4096 -f "$HOME\.ssh\id_rsa"
Get-Content $HOME\.ssh\id_rsa.pub