# win-dev-env

## Use powershell to set up dev environment in Windows

```ps1
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

# install docker
choco install docker-desktop -y

# install terraform
choco install terraform -y

# create ssh key and cat the public key
New-Item -Path $HOME\.ssh -ItemType Directory
ssh-keygen -t rsa -b 4096 -f "$HOME\.ssh\id_rsa"
Get-Content $HOME\.ssh\id_rsa.pub
```

## Install vsc ext

```bash
# General
code --install-extension Gruntfuggly.todo-tree
code --install-extension eamodio.gitlens

# Python
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-python.black-formatter

# JS/TS
code --install-extension steoates.autoimport
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode

# Docker
code --install-extension ms-azuretools.vscode-docker

# Terraform
code --install-extension hashicorp.terraform
```

`Code/User/settings.json`

```json
{
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "editor.formatOnSave": true,
  "files.eol": "\n",
  "workbench.startupEditor": "none",
  "window.zoomLevel": 2,
  "todo-tree.highlights.defaultHighlight": {
    "icon": "alert",
    "type": "text-and-comment",
    "foreground": "black",
    "background": "white",
    "opacity": 50,
    "iconColour": "blue",
    "gutterIcon": true
  },
  "todo-tree.highlights.customHighlight": {
    "TODO": {
      "icon": "check",
      "foreground": "black",
      "background": "white",
      "iconColour": "white"
    },
    "FIXME": {
      "foreground": "white",
      "background": "red",
      "iconColour": "red"
    }
  },
  "todo-tree.general.tags": ["TODO", "FIXME"],
  "todo-tree.regex.regex": "(//|#|<!--|;|/\\*|^|^\\s*(-|\\d+.))\\s*($TAGS).*(\\n\\s*//\\s{2,}.*)*",
  "python.linting.enabled": true,
  "python.linting.flake8Enabled": true,
  "python.linting.pylintEnabled": true,
  "python.formatting.provider": "black",
  "[python]": {
    "editor.formatOnType": true,
    "editor.defaultFormatter": "ms-python.black-formatter"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "eslint.enable": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```
