# How install Magento on local machine <!-- omit in toc -->

---

- [Required Software](#required-software)
- [Install WSL](#install-wsl)
- [Install Docker Engine on WSL](#install-docker-engine-on-wsl)
- [Install mkcert](#install-mkcert)
  - [Windows](#windows)
  - [WSL](#wsl)
- [SSL Certificates](#ssl-certificates)
- [Install Magento](#install-magento)

## Required Software

- [Terminal](https://aka.ms/terminal)
- [VSCode](https://code.visualstudio.com/docs/?dv=win)
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Install WSL

1. open the Microsoft Store
2. search for _wsl_
3. click on _install_
4. once the download is complete, access it from the Terminal, and you will be asked for a username

## Install Docker Engine on WSL

1. follow the official guide to [install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
2. and the [linux-postinstall](https://docs.docker.com/engine/install/linux-postinstall/) steps

for convenience, I'll list the commands here:

1. Set up Docker's Apt repository
   1. `sudo apt-get update`
   2. `sudo apt-get install ca-certificates curl gnupg`
   3. `sudo install -m 0755 -d /etc/apt/keyrings`
   4. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
   5. `sudo chmod a+r /etc/apt/keyrings/docker.gpg`
   6. `echo \
     "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
     "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
   7. `sudo apt-get update`
2. Install the Docker packages con `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
3. Manage Docker as a non-root user
   1. `sudo groupadd docker`
   2. `sudo usermod -aG docker $USER`
   3. `newgrp docker`
4. verify that everything is okay with `docker run hello-world`
5. configura Docker per avviarsi all'avvio con systemd
    1. `sudo systemctl enable docker.service`
    2. `sudo systemctl enable containerd.service`
6. `sudo update-alternatives --config iptables` and press 1 to select `/usr/sbin/iptables-legacy`

## Install mkcert

[mkcert](https://github.com/filosottile/mkcert) it's a free tool for creating self-signed SSL certificates that should be installed on both Windows and WSL

### Windows

1. open powershell
2. `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
3. `irm get.scoop.sh | iex`
4. `scoop bucket add extras`
5. `scoop install mkcert`
6. `mkcert -install`
7. `explorer.exe $(mkcert -CAROOT)` a folder with two files will open; we will need them later

### WSL

1. `sudo apt install libnss3-tools`
2. `curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"`
3. `chmod +x mkcert-v*-linux-amd64`
4. `sudo cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert`
5. `mkcert -install`
6. `cd ~/.local/share/mkcert`
7. `explorer.exe .`
8. copy the two files from earlier into the newly opened folder
9. `mkcert -install`

## SSL Certificates

1. in the WSL Terminal, navigate to the project folder using the command `cd /path/del/progetto`
2. `cd .devcontainer/certs`
3. `mkcert <domain>.localhost`

## Install Magento

1. in VSCode, once the project is open in WSL (from the WSL Terminal, using `code /path/to/project`), press `CTRL+SHIFT+P` and select `Dev Containers: Rebuild Container`
2. in VSCode, open a terminal with `CTRL+ò`
3. `. shs/install.sh`
4. `. shs/disable_2fa.sh`
