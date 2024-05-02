# How install Magento on local machine <!-- omit in toc -->

---

- [Required Software](#required-software)
- [Install WSL](#install-wsl)
- [Install Docker Engine on WSL](#install-docker-engine-on-wsl)
- [Install mkcert](#install-mkcert)
  - [Windows](#windows)
  - [WSL](#wsl)
- [SSL Certificates](#ssl-certificates)
- [Install php dependencies](#install-php-dependencies)
- [Install Magento](#install-magento)
- [Troubleshooting](#troubleshooting)

## Required Software

- [Terminal](https://aka.ms/terminal)
- [Envman](https://github.com/cirolosapio/envman)
- [VSCode](https://code.visualstudio.com/docs/?dv=win)
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Install WSL

1. open the Microsoft Store
2. search for _wsl_
3. click on _install_
4. once the download is complete, access it from the Terminal, and you will be asked for a username

## Install Docker Engine on WSL

- `envman` and select `Docker Engine`

## Install mkcert

[mkcert](https://github.com/filosottile/mkcert) it's a free tool for creating self-signed SSL certificates that should be installed on both Windows and WSL

### Windows

1. open powershell
2. `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
3. `irm get.scoop.sh | iex`
4. `scoop install git`
5. `scoop bucket add extras`
6. `scoop install mkcert`
7. `mkcert -install`
8. `explorer.exe $(mkcert -CAROOT)` a folder with two files will open; we will need them later

### WSL

1. `envman` and select `mkcert`
2. `cd ~/.local/share/mkcert`
3. `explorer.exe .`
4. copy the two files from earlier into the newly opened folder

## SSL Certificates

1. in the WSL Terminal, navigate to the project folder using the command `cd /path/to/project`
2. `cd .devcontainer/certs`
3. `mkcert <domain>.localhost`

## Install php dependencies

1. in VSCode, once the project is open in WSL (from the WSL Terminal, using `code /path/to/project`), press `CTRL+SHIFT+P` and select `Dev Containers: Rebuild Container`
2. in VSCode, open a terminal with `CTRL+ò`
3. `composer i`

## Install Magento

1. in VSCode, open a terminal with `CTRL+ò`
2. `my/shs/install.sh`

## Troubleshooting

- docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
  - `sudo update-alternatives --set iptables /usr/sbin/iptables-legacy`
