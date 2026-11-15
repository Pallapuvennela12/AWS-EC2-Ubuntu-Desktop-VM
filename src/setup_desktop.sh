#!/bin/bash
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y xfce4 xfce4-goodies xrdp
sudo adduser xrdp ssl-cert
echo "xfce4-session" | tee ~/.xsession
sudo sed -i 's|^test -x /etc/X11/Xsession && exec /etc/X11/Xsession|exec startxfce4|' /etc/xrdp/startwm.sh
sudo sed -i 's|^exec /bin/sh /etc/X11/Xsession|#exec /bin/sh /etc/X11/Xsession|' /etc/xrdp/startwm.sh
sudo systemctl restart xrdp xrdp-sesman
