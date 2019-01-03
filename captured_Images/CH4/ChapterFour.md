#  [`Chapter 4. Networks`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Host Name](https://www.google.com "Host Name")  
jane_doe@u1804:\~$ __`hostname`__  
__Host Name Control__ _- set host name_  
jane_doe@u1804:\~$ `sudo ` __`hostnamectl set-hostname`__ ` u1804.mynetwork.org`  
__concatenate__ __/__ `etc` __/__ __`hostname`__ )  
jane_doe@u1804:\~$ `cat /etc/` __`hostname`__  
__edit__ __/__ `etc` __/__ `hostname` )   _- ( previous to 15.04, edit maunually )_  
jane_doe@u1804:\~$ `edit /etc/hostname`  
```
unable to resolve host u1804.mynetwork.org
```  
__edit__ __/__ `etc` __/__ __`hosts`__ )   _- ( edit maunually )_  
~~$ `edit /etc/` __`hosts`__~~  
$ `nano /etc/` __`hosts`__  
## [managing Network Interfaces](https://www.google.com "managing Network Interfaces")    
__currently assigned IP address__  
$ `ip addr show`  
_( or shortened to )_  
$ `ip a`    

__state of interface__ _( toggling up & down )_  
$ `sudo ip link set enp0s3 down`  
$ `sudo ip link set enp0s3 up`    

`enp0s3` _( wired network, first bus in PCI slot 3 )_  
`en` _- Ethernet_  
`wl` _- Wireless_  
`p` _- Bus Number_  
`s` _- Slot_  
__Internet Protocol__  
$ `ip`  
_( iproute2 replaces net-tools )_  
_older systems would_
__edit__ __/__ $ `cat` __/__ `udev` __/__ `rules.d` __/__ `70-persistent-net-rules`  
```
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="01:22:4e:a5:f2:ec", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0" 
```   
~~__InterFace Configuration__  
$ `ifconfig`  
_( or )$ `/sbin/ifconfig`~~  
_( deprecated, replace with `ip` )_   
__Interface Down__  
$ `sudo ifconfig enp0s3 down`  
_( ~~iproute2 replaces~~ net-tools )_  
__Interface Up__  
$ `sudo ifconfig enp0s3 up`  
_( ~~iproute2 replaces~~ net-tools )_  
## [Assigning static IP addresses](https://www.google.com "Assigning static IP addresses")  
__concatenate__ __/__ `etc` __/__ `netplan` )  
$ `cat /etc/netplan` _( something.yaml )_
```
# This file describes the network interfaces available on your system 
# For more information, see netplan(5). 
network: 
  version: 2 
  renderer: networkd 
  ethernets: 
    enp0s3: 
      dhcp4: no 
     addresses: [192.168.0.101/24, '2002:2::4/64']
     gateway4: 192.168.1.1 
     nameservers: 
       addresses: [192.168.1.1,8.8.8.8]
```
__Apply NetPlan__  
$ `sudo` __`netplan apply`__  

_legacy variant_  _( basically, any version of Ubuntu older than 17.10 )_  
__concatenate__ __/__ `etc` __/__ `network`  __/__ `interfaces` )  
$ `cat /etc/network/interfaces`  
```
# The primary network interface 
auto enp0s3 
iface enp0s3 inet static 
    address 10.10.96.1 
    netmask 255.255.255.0 
    broadcast 10.10.96.255 
    dns-search local.lan 
    dns-nameservers 10.10.96.1
```
__restart networking__  
$ `sudo systemctl restart networking.service`  
_( legacy variant , before systemD )_  
$ `sudo /etc/init.d/networking restart`  

__install tmux__  - _terminal multiplexer_  
$ `sudo apt install tmux`  
_( activate )_  
$ `tmux`  
_( demo )_  
$ `top`  
`Ctrl + B`  
`D` _( should exit )_  
__reattach__  - _terminal multiplexer_  
$ `tmux a`  
__!__ _use_ `tmux` _before_ ___either___ `restarting` _technique_  
_show_ __IP addresses__  
$ `ip a`  
## [NetworkManager](https://www.google.com "Understanding NetworkManager")
`sudo systemctl stop NetworkManager`  
`sudo systemctl disable NetworkManager`  
`sudo systemctl restart networking`  
___NetworkManager___ _is a utility for managing network connectivity on your server, though it's largely been replaced with_ ___Netplan___.  
## [Linux name resolution](https://www.google.com "Linux name resolution")
_concatenate_ __/__ `etc` __/__ `nsswitch.conf`     
$ `cat /etc/`__`nsswitch.conf`__  
```
hosts:          files dns
```  
_concatenate_ __/__ `etc` __/__ `hosts`     
$ `cat /etc/`__`hosts`__  
```
10.10.96.124 minecraftserver
```  
_On legacy __Ubuntu__ servers , there was a file ,_ __/__ `etc` __/__ `resolv.conf`  
$ `cat /etc/`__`resolv.conf`__  
__DNS nameservers__ _that the server is currently pointing to_  
$ `systemd-resolve --status |grep DNS\ Servers`  
## [OpenSSH](https://www.google.com "OpenSSH")    
_( confirm_ __SSH Daemon__  _installation )_  
$ `which sshd`  
_( should return )_ 
`/usr/sbin/sshd`  
__install OpenSSH-Server__  
$ `sudo apt install openssh-`__`server`__  

__install OpenSSH-Client__  
$ `sudo apt install openssh-`__`client`__  
__SSH__ _status_  $ `systemctl` __`status`__ `ssh`  
__SSH__ _start_  $ `sudo systemctl` __`start`__ `ssh`  
__SSH__ _enable_  $ `sudo systemctl` __`enable`__ `ssh`  
_legacy variant_  _( 14.04 & 12.04 )_  
$ `sudo service ssh start`  
$ `sudo update-rc.d ssh defaults`  
__listening ports ,__ _restrict output to SSH_  
$ `sudo netstat -tulpn |grep ssh`  
_concatenate_ $ `cat /etc/`__`ssh/sshd_config`__  

__SSH__ _connect via_  __IP address__  $ `ssh 10.10.96.10`  
__SSH__ _connect_ __user @__ _, via_  __IP address__  $ `ssh` __`fmulder@`__`10.10.96.10`  
__SSH__ _, port , user @ , IP address_  $ `ssh` __`-p 2242`__ `fmulder@10.10.96.10`  
__exit__  $ `exit`  
_or_ __`Ctrl+D`__  _, especially if you have processes to leave running in the background_
## [SSH key management](https://www.google.com "Getting started with SSH key management")
__Generate SSH Key__  
$ `ssh-keygen`  
_( default location )_ 
`/home/<user>/.ssh`  
_( passphrase , optional )_  
__id_rsa__ _&_ __id_rsa.pub__  
$ `ls -l /home/<user>/.ssh`  
$ `ls -l /home/jane_doe/.ssh`  
__SSH__ _transmit __public__ key to a target server,_  
$ __`ssh-copy-id`__ `-i /home/.ssh/id_rsa.pub unicorn`  
_( default location )_ _concatenate_ $ `cat ` __`/home/.ssh/authorized_keys`__  
_start_ __SSH__ _agent_  
$ `eval $(ssh-agent)`  
__unlock key__  _( via agent )_  
$ `ssh-add /home/.ssh/id_rsa`  
__change pass-phrase__  
$ `ssh-keygen -p`  
`Enter` _accepts default file_ `id_rsa`
## [simplifying SSH connections with a `config file`](https://www.google.com "simplifying SSH connections with a `config file`")    
_edit__ __/__ `home` __/__ `<user>` __/__ `.ssh` __/__ `config` )    
$ `nano /home/jane_doe/.ssh/config`  
```
host myserver 
    Hostname 192.168.1.23 
    Port 22 
    User jdoe 
 
Host nagios 
    Hostname nagios.local.lan 
    Port 2222 
    User nagiosuser 
```    
__SSH__ _( with `config` )_  
$ `ssh nagios`  
 ( same as.. )_  
$ `ssh -p 2222 nagiosuser@nagios.local.lan`  

__Q__ & __A__
1. $ `sudo`  
1. $ `adduser, useradd`  
1. $ `rm jane_doe`  
1. $ `/etc/password & /etc/shadow`  
1. $ `/etc/skel`  
1. $ `su jane_doe`  
1. $ `sudo groupadd accounting`  
1. $ `visudo`  
1. $ `sudo adduser jdoe`  
1. $ `chmod, chown`
