====
#### WORK IN PROGRESS, DON'T USE THIS VERSION !!!
====

====
#### This script is not intended to solicit illegal actions! I can not be held responsible for the use that you could doing it! Thank you to reconsider the installation and use of MySB. I developed this script only for pleasure and passion for my job.
====
My SeedBox
====

This script is a fork of Notos' Script (base v2.1.9) avaible at https://github.com/Notos/seedbox-from-scratch/, combined with tuto of Mondedie.fr avaible at "http://mondedie.fr/viewtopic.php?id=5302".

MySB is a seedbox platform for multi-users.

##### Current version = dev
###### Last stable version = v1.1

## Installed software

	* rTorrent (rakshasa) v0.9.2 with SSL
	* libTorrrent (rakshasa) v13.2
	* ruTorrent (SVN) + official plugins (SVN)
	* NginX (SSL, specific port and some customizations)
	* PHP5-FPM (php5-apcu, FastCGI, SSL)
	* SFTP with Chroot
	* vsftpd (TLS)
	* Postfix with SMTP authentication (Gmail, Free, Ovh and Yahoo)

## Services available

	* Fail2ban (optionnal but recommended)
	* Seedbox-Manager (optionnal but recommended)
	* OpenVPN (optionnal); Multi TUN configuration, with or without redirection of traffic. Add AES-NI support (Not valid for OpenVZ Container).
	* Webmin (optionnal)
	* BlockList usage (optionnal) (PeerGuardian or rTorrent, if PeerGuardian failed to start, rTorrent will use its own blocklist)
	* CakeBoxLight (optionnal)
	* PlexMedia Server (optionnal) (requires additional setup)
	* Samba share for each users (VPN access)
	* NFS share for each users (VPN access)
	* Auto retrieve SSL certificates for all trackers (if available)
	* DNScrypt-proxy with Bind9 as dns caching (optionnal but recommended)
	* MySB portal, ability to manage trackers, blocklists, and more

## Additional ruTorrent plugins (in addition to the official plugins)

	* Chat
	* Logoff
	* tAdd-Labels
	* Filemanager
	* Mediastream
	* Fileshare
	* NFO
	* RatioColor
	* Theme: Oblivion
	* FileUpload
	* Stream
	* Favicons trackers

## Before installation

You need to have a "blank" server installation.

#################
#	Warnings	#
#################

#### OpenVZ Containers
--> PeerGuardian, it's not possible to install it in your OpenVZ Container.
```
Module 'xt_mark' is mandatory for PeerGuardian. Currently, I have not found solution. The subject is pending.
```
--> OpenVPN, you must follow this link BEFORE install 'MySB'.
```
https://openvpn.net/index.php/access-server/docs/admin-guides/186-how-to-run-access-server-on-a-vps-container.html
```

###### NOTE: You must have a swap partition for systems with less than 2GB of RAM!

	--> Your swap partition should be at least equal to your RAM.

###### NOTE: If you don't know Linux ENOUGH:

	--> DO NOT use capital letters, all your usernames should be written in lowercase without space.
	--> DO NOT upgrade anything in your box, ask in the thread before even thinking about it.
	--> DO NOT try to reconfigure packages using other tutorials.

#################

## How to install
Just copy and paste those commands on your terminal:
```
wget --no-check-certificate -N https://raw.githubusercontent.com/toulousain79/MySB/dev/MySB_Install.bsh
bash MySB_Install.bsh
```

If you lose connection during installation, restart the SSH session and run the following command:
```
screen -r MySB
```

Beware, during installation, the SSH port will be changed. If a port session 22 does not work, try with the new port that you have selected.

###### NOTE 1: You must be logged as root to run this installation or use sudo.
###### NOTE 2: At the end of the installation, the server will restart automatically and you will receive an e-mail summarizing.
###### NOTE 3: Each time a user is added, it will also receive a confirmation email with a temporary password.y password.

## How to upgrade from v1.1
Just copy and paste these command on your terminal:
```
MySB_UpgradeMe
```

## Commands

After installing you will have access to the following commands to be used directly in terminal.

	* MySB_ChangeUserPassword
	* MySB_CreateUser
	* MySB_DeleteUser
	* MySB_UpdateGitHubRepo (update actual repository)
	* MySB_RefreshMe (refresh some parts of MySB)
	* MySB_UpgradeMe (to migrate to a new version of MySB)
	* MySB_UpgradeSystem (simply upgrade your system APT upgrade)

Next scripts are avaible too.

	* '/etc/MySB/scripts/BlocklistsRTorrent.bsh', use this for generate blocklist for rTorrent with 'ipv4_filter.load' command.
	* '/etc/MySB/scripts/FirewallAndSecurity.bsh [clean|new]', use this for generate all security options (PeerGuardian, IPtables, Fail2Ban, Nginx IP restricted access, ...)
	* '/etc/MySB/scripts/GetTrackersCert.bsh', use this for get all SSL certificates for all tracker avaibled with ruTorrent. You can add more trackers in '/etc/MySB/inc/trackers'.

You can find others scripts in '/etc/MySB/scripts/'. This others scripts are added in cron job.

## Services

To access services installed on your new server, point your browser to the following address (MySB portal):
```
https://<Server IP or Server Name>:<https NginX port>/
```

## Seedbox-Manager

The seedbox web-manager application is an interface to restart a rtorrent user session.

Author: backtoback (c) & Magicalex (php) & hydrog3n (php).
```
https://github.com/Magicalex/seedbox-manager/
```

## BlockList
BlockList usage (optionnal), PeerGuardian or directly via rTorrent.
Depending on your system, it is possible to use: 

#### PeerGuardian

	* By default, some list are activated. Check this list in MySB portal.
	* All trackers listed with ruTorrent are available but are inactive. You can add more or activate it via MySB portal.

###### NOTE: Do not try to add your rtorrents ports in the list of incoming ports allowed in PeerGuardian (pglcmd.conf) !!!
###### Using PeerGuardian will not have much sense ...
###### Rather prefer permission trackers via the "allow.p2p" PeerGuardian file. To do this, use MySB portal.
###### If PeerGuardian failed to start, rTorrent blocklists are used instead.

OR

#### rTorrent with ipv4_filter.load

	* By default, some list are activated. Check this list in MySB portal.
	* Once the lists are selected, a common file containing all the lists will be generated and copied for each user.

###### NB: Beware, if you have not enough memory, choising too many list will make you system very slow!
###### NB: Beware, if you have not enough memory, choising too many list will make you system very slow!

## OpenVPN

To use your VPN you will need a VPN client compatible with [OpenVPN](http://openvpn.net/index.php?option=com_content&id=357), necessary files to configure your connection are in this link in your box:
```
http://<Server IP or Server Name>:<https NginX port>/?user/openvpn-config-file.html` and use it in any OpenVPN client.
```
#### For OpenVZ, you must validate the prerequisites on this page first. Otherwise, OpenVPN will not be functional.
```
https://openvpn.net/index.php/access-server/docs/admin-guides/186-how-to-run-access-server-on-a-vps-container.html
```
##### NFS and Samba share with OpenVPN
For NFS, you can mount the /home/<username>/rtorrent like that. The IP address can be different depending on the OpenVPN configuration that you have selected.
```
mount -t nfs [10.0.0.1|10.0.1.1]:/home/<username>/rtorrent <mount_dir> -o  -o nocto,noacl,noatime,nodiratime,nolock,rsize=8192,vers=3,ro,udp
```
For Samba, you can mount the /home/<username> like that. The IP address can be different depending on the OpenVPN configuration that you have selected.
```
mount - <mount_dir> -t cifs -o noatime,nodiratime,UNC=//[10.0.0.1|10.0.1.1]/<username>,username=<username>,password=<your_password>
```

## DNScrypt-proxy
By default, DNScrypt-proxy will use OpenDNS resolver (opendns). 
The full list of DNScrypt resolvers is available at: https://github.com/jedisct1/dnscrypt-proxy/blob/master/dnscrypt-resolvers.csv 

It is possible to change the resolver name via MySB portal OR using using the following command:
```
dnscrypt-proxy service restart <resolver_name>
```

To clean Bind cache, just restart service.

###### 1 - Clean Bind9 cache
```
service bind9 restart
```
###### 2 - Change DNScrypt resolver name
```
service dnscrypt-proxy restart dnscrypt.eu-nl
```

###### IMPORTANT: With OpenVZ container, to complete the installation of DNScrypt-proxy, you must replace your existing DNS config (/etc/resolv.conf), by the loopback address.
###### IMPORTANT: It's necessary to make the change via the host (eg Proxmox), otherwise you will lose your configuration on next reboot. You must replace yours nameserver by 'nameserver 127.0.0.1' (/etc/resolv.conf).

## Supported and tested servers

#### Debian 7 - x86_64 (Wheezy)

	--> Tested on Online.net with "DEDIBOX® SC GEN2" and "DEDIBOX® XC"
	--> Tested on OpenVZ Container with ProxMox, work fine ! (read comment in top of this page)
	--> Tested on OVH with "Kimsufi"
  
#### Ubuntu or older Debian may worked, but not tested...


## Changelog

Take a look at 'Changelog.md', it's all there.


## Support

There is no real support for this script.


## License

Created by toulousain79

--> Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php

## Sources, inspiration and tools

* Notos' script:		https://github.com/Notos/seedbox-from-scratch/
* Mondedie.fr script:		https://bitbucket.org/exrat/install-rutorrent	
* rTorrent Community:	http://community.rutorrent.org/	
* rTorrent config info:		http://libtorrent.rakshasa.no/rtorrent/rtorrent.1.html
* rTorrent tweaks:		https://calomel.org/rtorrent_mods.html
* rTorrent SSL:	https://forums.gentoo.org/viewtopic-t-710876-start-0.html
* OpenSSL configuration file:	http://www.eclectica.ca/howto/ssl-cert-howto.php
* OpenSSL AES-NI support:	http://openssl.6102.n7.nabble.com/having-a-lot-of-troubles-trying-to-get-AES-NI-working-td44285.html
* Text ASCII Art Generator:	http://patorjk.com/software/taag/
* Why nginx-extras + infos:	https://wiki.debian.org/fr/Nginx
* NginX config:	http://wiki.nginx.org/CoreModule#worker_rlimit_nofile
* NginX config:	http://trac.evolix.net/infogerance/wiki/HowtoNginx
* NginX config:	https://library.linode.com/web-servers/nginx/configuration/basic
* NginX with SSL:	http://nginx.org/en/docs/http/configuring_https_servers.html
* NginX with PageSpeed: https://wiki.deimos.fr/Page_Speed:_optimize_on_the_fly_your_rendered_code
* OpenSSL CAconfig:	http://www.ulduzsoft.com/2012/01/creating-a-certificate-authority-and-signing-the-ssl-certificates-using-openssl/
* VSFTDs TLS:	http://www.howtoforge.com/setting-up-vsftpd-tls-on-debian-squeeze
* VSFTPd Debian: https://howto.biapy.com/fr/debian-gnu-linux/serveurs/autres/installer-le-serveur-ftp-vsftpd-sur-debian
* VSFTPd ManPage: https://security.appspot.com/vsftpd/vsftpd_conf.html
* DNS Server:	http://en.m.wikipedia.org/wiki/Comparison_of_DNS_server_software
* DNScrypt infos:	http://antix.freeforums.org/secure-dns-with-dnscrypt-t3588.html
* DNScrypt + Bind9:	http://cavaencoreparlerdebits.fr/blog/2013/10/encrypt-your-dns-request-with-opendns-dnscrypt
* PHPBench:		http://www.phpbench.com/
* WolfCMS:		http://www.wolfcms.org/

## TODO

* Use of "Let's Encrypt" (https://letsencrypt.org/) (Summer 2015)
* Maybe add miniDLNA functionality (with OpenVPN)
* Make some thing for users with dynamic ip for update whitelist in PeerGuardian and Fail2ban.
* Gmail SMTP https://www.google.com/accounts/DisplayUnlockCaptcha
* Maybe add OwnCloud possiblity
* NFS over sTunnel ? (https://w3.physics.illinois.edu/physwiki/doku.php?id=pcs:unix:nfs_over_stunnel)
* SABnzbd option ?
* Subsonic option ?
* Namebench ?
* Maybe use of 'psad' and 'systemd'
* check plugin 'Mediastream', doesn't work ?
* check Cakebox, doesn't work ?
