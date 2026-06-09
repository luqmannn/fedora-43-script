### Fedora 43 setup

I'm using Fedora server ISO for my setup, but Workstation ISO should work fine with some adjustment.

Download the repo
```sh
git clone https://github.com/luqmannn/Lost-Notes.git
```

Run the script
```sh
./fedora-custom-install
```

For Workstation ISO, you might want to swap ffmpeg-free (FOSS/patent free) with ffmpeg (non-free/patent) library
```sh
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
```

Must run the command below to boot into GUI environment automatically
```sh
sudo systemctl enable gdm
sudo systemctl set-default graphical.target
```

Only for Server ISO. Since we're using server ISO to setup Fedora 43, the filesystem and paritioning layout will be 
adhere to the standard server use. Filesystem use is XFS instead of new BTRFS in Fedora Workstation edition. The disk 
using LVM setup that consists with partition of important directory such as `/dev`, `/boot`, `/boot/efi` as shown below.
```
devtmpfs                devtmpfs   16G     0   16G   0% /dev
tmpfs                   tmpfs      16G  228M   16G   2% /dev/shm
efivarfs                efivarfs  128K   43K   81K  35% /sys/firmware/efi/efivars
tmpfs                   tmpfs     6.1G  2.1M  6.1G   1% /run
tmpfs                   tmpfs     1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
tmpfs                   tmpfs      16G   23M   16G   1% /tmp
/dev/nvme0n1p2          xfs       2.0G  497M  1.5G  26% /boot
/dev/nvme0n1p1          vfat      599M  7.5M  592M   2% /boot/efi
tmpfs                   tmpfs     1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
tmpfs                   tmpfs     3.1G  5.7M  3.1G   1% /run/user/1000
```

So we need to reclaim all of the remaining free space and grow the root partition
```sh
sudo lvextend -l +100%FREE /dev/mapper/fedora-root
sudo xfs_growfs /
df -hT /
```

Disable **GPU accelerated rendering in web views** for Steam

**Don't install Virtualbox**
It will **messed up** your USB Wifi & Bluetooth
Be very careful with software that need to recompile your kernel. Because after reboot, somethings happened that caused
kernel module for my USB wifi adapter to be not loaded and I cannot use wifi and bluetooth anymore -_- -_- -_-
