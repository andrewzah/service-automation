## nfs.eagle.zah.arpa
- [ ] `systemctl enable --now sshd`
- [ ] `apt install -y nfs-utils`

```
(on host) /etc/pve/lxc/100.conf

arch: amd64
cores: 1
features: mount=nfs,nesting=1
hostname: nfs.eagle.zah.arpa
memory: 512
mp0: /eagle/media,mp=/mnt/media
nameserver: 192.168.1.1
net0: name=eth0,bridge=vmbr0,firewall=1,gw=192.168.1.1,hwaddr=5E:DB:7E:07:78:56,ip=192.168.2.10/32,ip6=dhcp,type=veth
onboot: 1
ostype: centos
rootfs: eagle-zfs:subvol-100-disk-0,size=8G
searchdomain: zah.arpa
startup: order=1
swap: 512
```

```
/etc/exports

/mnt/media 192.168.2.200(rw,async,root_squash,no_subtree_check)
/mnt/media/programming 192.168.2.6(rw,async,root_squash,no_subtree_check)
```

- [ ] `exportfs -arv`

## bernard.zah.arpa
- [ ] `apt update`
- [ ] `apt install -y curl jq openresolv wireguard iptables nfs-common openssh-server`
- [ ] `systemctl enable --now sshd`
- [ ] download mullvad configs.zip and unzip into /etc/wireguard
- [ ] ln -s a us config to tun0.conf (ls -1 | shuf -n1)
- [ ] `chown -R root:root /etc/wireguard`
- [ ] `chmod 600 -R /etc/wireguard`
- [ ] `wg-quick up tun0`

```
reset-iptables.sh

#!/bin/bash

set -ex

# Accept all traffic first to avoid ssh lockdown  via iptables firewall rules #
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
 
# Flush All Iptables Chains/Firewall rules #
iptables -F
 
# Delete all Iptables Chains #
iptables -X
 
# Flush all counters too #
iptables -Z 
# Flush and delete all nat and  mangle #
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t raw -F
iptables -t raw -X

```

## venice.zah.arpa
- [ ] `systemctl enable --now sshd`
- [ ] `adduser/group media`
- [ ] `dnf install 'https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm'`
- [ ] `dnf config-manager --set-enabled powertools`
- [ ] `dnf install -y nfs-utils ffmpeg`
- [ ] `dnf install -y 'https://repo.jellyfin.org/releases/server/centos/stable/web/jellyfin-web-10.8.8-1.el7.noarch.rpm'`
- [ ] `dnf install -y 'https://repo.jellyfin.org/releases/server/centos/stable/server/jellyfin-server-10.8.8-1.el7.x86_64.rpm'`
- [ ] `dnf install -y 'https://repo.jellyfin.org/releases/server/centos/stable/server/jellyfin-10.8.8-1.el7.x86_64.rpm'`
- [ ] `mkdir /opt/jellyfin`
- [ ] `cd /opt/jellyfin; mkdir data cache config log`
- [ ] `chown -R media:media /opt/jellyfin`

```
/opt/jellyfin/jellyfin.sh; 0744

#!/usr/bin/env bash

JELLYFINDIR="/opt/jellyfin"
FFMPEGDIR="/usr/share/ffmpeg"

jellyfin \
 -d "$JELLYFINDIR/data" \
 -C "$JELLYFINDIR/cache" \
 -c "$JELLYFINDIR/config" \
 -l "$JELLYFINDIR/log" \
 --ffmpeg "$FFMPEGDIR/ffmpeg"

```

```
/etc/systemd/system/jellyfin.service; 0644

[Unit]
Description=Jellyfin
After=network.target

[Service]
Type=simple
User=media
Restart=always
ExecStart=/opt/jellyfin/jellyfin.sh

[Install]
WantedBy=multi-user.target
```
