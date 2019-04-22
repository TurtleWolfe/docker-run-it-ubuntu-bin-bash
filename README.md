```
eval $(ssh-agent)
```
```$ ssh-add /c/Users/JonPo/.ssh/id_rsa_jane_doe```  
```
eval `ssh-agent -s`
```
```$ ssh-add ~/.ssh/id_rsa_jane_doe```  
```$ ssh-add ~/.ssh/id_rsa_jon_dough```  
```$ ssh -p 22222 jane_doe@ doserver```  
```$ ssh digitalOcean@ doserver```  
```$ ssh digitalOcean jon_dough@ doserver```  
203.0.113.255  
123.0.113.255  
`sudo shutdown -r now`
## [SSH Cheat Sheet](https://www.youtube.com/watch?v=hQWRp-FdTpc&t=1270s)
### Generate Keys (Local Machine)
```$ ssh-keygen```

### Add Key to server in one command
```> cat ~/.ssh/id_rsa.pub | ssh jane_doe@192.168.1.29 "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>  ~/.ssh/authorized_keys```

### Create & copy a file to the server using SCP
```$ touch test.txt```
```$ scp ~/test.txt jane_doe@192.168.1.29:~```

## DIGITAL OCEAN `25:00`
```$ ssh-keygen -t rsa```
> Add Key When Creating Droplet  
```$ ssh root@doserver```
### If it doesn't work `29:08`
```$ ssh-add ~/.ssh/id_rsa```  
```$ ssh-add ~/.ssh/id_rsa_do```  
(or whatever name you used)  
```
eval `ssh-agent -s`
```  
back on local client  
```$ ssh-add ~/.ssh/id_rsa_janeydough_digocn```  
`Identity added: /home/turtlewolfe/.ssh/id_rsa_janeydough_digocn (/home/turtlewolfe/.ssh/id_rsa_janeydough_digocn)`
```$ ssh root@doserver```  
```$ sudo apt update```  
```$ sudo apt upgrade```  
### Create new user with sudo `32:00`
```$ adduser jane_doe```  
```$ id jane_doe```  
```$ usermod -aG sudo jane_doe```  
```$ id jane_doe```  
### Login as jane_doe
```> ssh jane_doe@server```
### We need to add the key to jane_does .ssh on the server, log back in as root
```$ ssh root@doserver```  
```$ cd /home/jane_doe```  
```$ mkdir .ssh```  
```$ cd .ssh```  
```$ touch authorized_keys```  
```> sudo nano authorized_keys```  
(paste in the id_rsa_do.pub key, exit and log in as jane_doe)

```$ ssh jane_doe@doserver```  
### Disable root password login `36:55`  
```$ sudo nano /etc/ssh/sshd_config```
### Set the following
```PermitRootLogin no```  
```PasswordAuthentication no```
```
Port 22222 
Protocol 2 
AllowGroups admins sshusers sudo 
# AllowUsers jon_dough jane_dough
PermitRootLogin no 
PasswordAuthentication no 
```
### Reload sshd service
```$ sudo systemctl reload sshd```  
`ssh` __`-p 22222`__ `jane_doe@138.197.65.162`  

```$ sudo usermod -aG sshusers jon_dough``` 
### PAM
`$ sudo apt install` __`libpam-cracklib`__  
`$ sudo nano` __`/etc/pam.d/common-password`__  
`$ sudo apt install` __`libpam-cracklib`__  
`$ sudo nano` __`/etc/pam.d/common-password`__  
`$ sudo apt install` __`libpam-cracklib`__  
`$ sudo nano` __`/etc/pam.d/common-password`__  
### Fail2Ban
`$ sudo apt install` __`libpam-cracklib`__  
`$ sudo nano` __`/etc/pam.d/common-password`__  
`$ sudo apt install` __`libpam-cracklib`__  
`$ sudo nano` __`/etc/pam.d/common-password`__  
`$ sudo apt install` __`libpam-cracklib`__  
`$ sudo nano` __`/etc/pam.d/common-password`__  


### Change owner of /home/jane_doe/* jane_doe `43:17`
```$ sudo chown -R jane_doe:jane_doe /home/jane_doe```
### May need to set permission
```$ chmod 700 /home/jane_doe/.ssh```
### Install Apache and visit ip `40:00`
``` $ sudo apt install apache2 -y```
## Github

### Generate Github Key(On Server)
``` $ ssh-keygen -t rsa```
(id_rsa_github or whatever you want)

#### Add new key
```$ ssh-add /home/jane_doe/.ssh/id_rsa_github```
#### If you get a message about auth agent, run this and try again `46:00`
```
$ eval `ssh-agent -s`
```
#### Clone repo
```$ git clone git@github.com:jane_doetraversy/react_otka_auth.git```

#### Install Node
```$ curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -```

```$ sudo apt-get install -y nodejs```

#### Install Dependencies
```  $ npm install ```

#### Start Dev Server and visit ip:3000
```$ npm start```

#### Build Out React App
``` $ npm run build```

#### Move static build to web server root
``` $ sudo mv -v /home/jane_doe/react_otka_auth/build/* /var/www/html```  
https://www.youtube.com/watch?v=Cvrqmq9A3tA&index=1&list=PLETG2T1KvnipSA8vKmzju_unzl44jeyCa  

https://www.twitch.tv/videos/347820755  

[![leg lamp from A Christmas Story](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/xmasLAMP.jpg?raw=true?raw=true "Linux Administration Bootcamp: Go from Beginner to Advanced [ Video ]
By Jason Cannon
November 2018
Learn Red Hat Linux and CentOS: Use these in-demand skills to start a career as a Linux Server Admin or Linux Administrator!")](https://www.packtpub.com/mapt/video/application_development/9781789612189/87094/87095/the-linux-directory-structure)
## __L__ inux on
## __W__ indows in
## __D__  [ocker](https://store.docker.com/editions/community/docker-ce-desktop-windows "The fastest and easiest way to get started with Docker on Windows") LAMP
`APACHE` can be replaced with `NGINX`  
`MySQL` should be replaced with `MariaDB`  
##### Show info like number of containers, etc  
$ `docker info`  
##### List all containers (Even if not running)
$ `docker container ls -a`  
##### Get logs (Use name or ID)
$ `docker container logs [NAME]`  
##### Stop all running containers
$ `docker container stop $(docker ps -aq)`  
##### To remove a running container use force(-f)
$ `docker container rm -f [ID]`  
##### Remove all containers
$ `docker rm $(docker ps -aq)`  
##### Remove all images
$ `docker rmi $(docker images -a -q)`  
## $ [`docker run --name u1804 -dit -p 8080:80 ubuntu:18.04 //bin/bash`](https://stackoverflow.com/questions/39858121/how-can-i-resolve-the-error-oci-runtime-error-exec-no-such-file-or-directory-w "you might see this if you have installed Git for Windows with MSYS2 for example")
detached interactive terminal on port 8080 named u1804  

$ `docker stop u1804`  
$ `docker start u1804`  
## $ `docker attach u1804`  
__u1804__ represents __containerID__  
root@u1804:/# `ls -l`  
root@u1804:/# `apt-get update`  
root@u1804:/# `apt-get install sudo`    
root@u1804:/# `apt-get install -y curl`  
root@u1804:/# `curl https://www.google.com`  
[![Mastering Ubuntu Server book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/B10288.png?raw=true "Mastering Ubuntu Server - Second Edition
By Jay LaCroix
May 2018
Get up-to-date with the finer points of Ubuntu Server using this comprehensive guide")](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560)
[![Mastering Ubuntu Server book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/V12701_Low.png?raw=true "Linux Administration Bootcamp: Go from Beginner to Advanced [ Video ]
By Jason Cannon
November 2018
Learn Red Hat Linux and CentOS: Use these in-demand skills to start a career as a Linux Server Admin or Linux Administrator!")](https://www.packtpub.com/mapt/video/application_development/9781789612189/87094/87095/the-linux-directory-structure)

#  [`Chapter 2. Managing Users`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/2/ch02lvl1sec23/creating-and-removing-users "Creating and removing users")
![preview screenshot](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/CaptureETCshadow.PNG?raw=true "asterix is like a wilde carde ?")  
## [Understanding when to use `root`](https://www.google.com "Understanding when to use `root`")  
`apt install tmux`  
`E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)`  
`E: Unable to lock the administration directory (/var/lib/dpkg/), are you root?`  
`sudo apt install tmux`  
## [Creating and removing `users`](https://www.google.com "Creating and removing `users`")
`sudo` ___`useradd`___ `-d /home/jdoe -m jdoe`  
`ls -l /home`  
`nano /usr/sbin/` ___`adduser`___  
`sudo` ___`userdel`___ `dscully`  
`ls -l /home`  
___`passwd`___  
`sudo` ___`mv`___ `/home/dscully /store/file_archive`  
`sudo` ___`mkdir`___ `-p /store/file_archive`  
`sudo` ___`userdel`___ `-r dscully`  
`sudo` ___`rm`___ `-r /home/dscully`  
__sudo rm -r /__ _( space )_ __home/dscully__
## [Understanding the `/etc/passwd` & `/etc/shadow files`](https://www.twitch.tv/videos/354692464 "Understanding the `/etc/passwd` & `/etc/shadow files`")  
`cat /etc/passwd `  
`sudo cat /etc/shadow`  
`sudo cat /etc/shadow | grep root`  
`mulder:$6$TPxx8Z.:16809:0:99999:7::: `  
`sudo passwd -S <username>`  
root@u1804:/# `adduser jane_doe`  
root@u1804:/# `cat /etc/shadow | grep root`  
__any password ?__  
`user: * :password changed:7days between changes:max:warning:disable:8thN:9?`  
__encrypted password__  
`user: x :password changed:7days between changes:max:warning:disable:8thN:9?`  
__lockout login__  
`user: ! :password changed:7days between changes:max:warning:disable:8thN:9?`  

__add a user to `sudo` as a secondary group__  
jane_doe@u1804:\~$ `sudo usermod -aG sudo jane_doe`  
__switch user__  
root@u1804:/# `su - jane_doe`
__list all files in long form__  
jane_doe@u1804:\~$ `ls -al`  
__add user group__  
jane_doe@u1804:\~$ `sudo groupadd admins`  
__modify secondary group to include user__  
jane_doe@u1804:\~$ `sudo usermod -aG admins jane_doe`  
__lock password__ - will not affect SSH (see ch 15)   
jane_doe@u1804:\~$ `sudo passwd -l root`  
jane_doe@u1804:\~$ `sudo cat /etc/shadow | grep root`  
root@u1804:/# `su - root`  
__unlock password__  
jane_doe@u1804:\~$ `sudo passwd -u <username>`  
__/etc/shadow__  
jane_doe@u1804:\~$ `sudo chage -l root`  
## [Distributing default configuration files with `/etc/skel`](https://www.google.com "Distributing default configuration files with `/etc/skel`")  
`ls -la /etc/skel`    
__force password change__ - should move this into `/etc/skel` __?__ , for default configuration (see ch 1)   
jane_doe@u1804:\~$ `sudo chage -d 0 <username>`  
...  
## [Switching users](https://www.google.com "Switching users")  
`sudo passwd`  
`sudo su -`  
`su - <username>`  
`sudo su - <username>`  
  
__Pluggable Authentication Module (PAM):__  
jane_doe@u1804:\~$ `sudo apt install libpam-cracklib`  
...  
__install Nano__  
jane_doe@u1804:\~$ `sudo apt install nano`  
...  
__configure password requirements in PAM__  
jane_doe@u1804:\~$ `sudo nano /etc/pam.d/common-password`  
__!__ (use a 2nd TTY to prevent lock out)  
## [Managing groups](https://www.google.com "Managing groups")  
```
-rw-r--r-- 1 root bind  490 2013-04-15 22:05 named.conf
```  
`ls -l`  
__`groups`__ `jane_doe`  
`cat /etc/group`  
`sudo groupadd admins`  
`sudo groupdel admins`  
`sudo usermod -aG admins myuser`  
`sudo usermod -g <group-name> <username>`  
`man usermod`  
`sudo usermod -d /home/jsmith jdoe -m`  
`sudo usermod -l jsmith jdoe`  
`sudo gpasswd -d <username> <grouptoremove>`  
`sudo gpasswd -a <username> <group>`  

__add a user to `sudo` as a secondary group__  
jane_doe@u1804:\~$ `sudo usermod -aG sudo <username>`  
jane_doe@u1804:\~$ `sudo usermod -aG sudo jane_doe`  
_may use another group_ (such as `wheel`)    
__configure `sudo` group or user access__  
jane_doe@u1804:\~$ `sudo visudo`  
checks to make sure your changes follow the correct syntax ___`/etc/sudoers`___  
```
jane_doe    ALL=(ALL:ALL) ALL
```  
`charlie    ubuntu-server=(jane_doe:admins) /usr/bin/apt,/usr/sbin/reboot,/usr/sbin/shutdown`  
(root or username)    TTY IP=(USER:GROUP) COMMANDS  
__!__ It's always a good idea to use full paths when editing `sudo` command permissions    
## [Managing passwords and password policies](https://www.twitch.tv/videos/350713391 "Managing passwords and password policies")  
__`lock` password per `<username>`__  
jane_doe@u1804:\~$ `sudo passwd -l <username>`   
__`unlock` password per `<username>`__  
jane_doe@u1804:\~$ `sudo passwd -u <username>`  
...  
__`list` expiration of a user's `password`__  
jane_doe@u1804:\~$ `sudo chage -l <username>`  
_( set to zero would force a password change )_  
jane_doe@u1804:\~$ `sudo chage -d 0 <username> `  
_( review changes )_  
jane_doe@u1804:\~$ `sudo chage -l <username>`  
__`expiration` of a user's `password`__  _( Maximum days until a change is required)_  
jane_doe@u1804:\~$ `sudo chage -M 90 <username>`  
__`expiration` of a user's `password`__  _( minimum days until a change is required)_  
jane_doe@u1804:\~$ `sudo chage -m 5 dscully`  


__Pluggable Authentication Module (PAM):__  
jane_doe@u1804:\~$ `sudo apt install libpam-cracklib`  
...  
__install Nano__  
jane_doe@u1804:\~$ `sudo apt install nano`  
...  
__configure password requirements in PAM__  
jane_doe@u1804:\~$ `sudo nano /etc/pam.d/common-password`  
__!__ (use a 2nd TTY to prevent lock out)  

__`install` Pluggable Authentication Module ( `PAM` )__  
jane_doe@u1804:\~$ `sudo apt install libpam-cracklib`  
...  
__`edit`__    _..( __/__ `etc` __/__ `pam.d` __/__ `common-password` )_  
jane_doe@u1804:\~$ `sudo nano /etc/pam.d/common-password`  
`password      required      pam_pwhistory.so      remember=99    use_authok`  
__`difference`__ _( at least three characters have to be different )_  
`difok=3`  
__`obscure`__ _( prevents simple passwords from being used )_  
`obscure `  
## [Configuring administrator access with sudo](https://www.twitch.tv/videos/350870850 "Configuring administrator access with sudo")  
__`modify` secondary `Group`__ _to include_ __`user`__  
jane_doe@u1804:\~$ `sudo usermod -aG sudo <username>`  
#### __`visudo`__  
if an  error return to __nano `edit`__  
__`e`__  
__nano `save changes`__  
`Ctrl + W`  
__nano `exit editor`__  
`Ctrl + X`  
__configure `visudo`__ _default `Editor` to_ __`vim`__  
jane_doe@u1804:\~$ `sudo EDITOR=vim visudo`  
__`etc / sudoers`__  
```
%sudo   ALL=(ALL:ALL) ALL
            ...
root    ALL=(ALL:ALL) ALL
```    
`TTY =( User : Group ) Command`   
_note that it's best to use full paths_  
charlie could run these : __`commands`__  
```
charlie    ALL=(ALL:ALL) /usr/sbin/reboot,/usr/sbin/shutdown
```  
_but not others_  
```
Sorry, user charlie is not allowed to execute '/usr/bin/apt
install tmux' as root on ubuntu-server.
```  
_limited to certain_ __`terminal`__   
```
charlie    ubuntu-server=(ALL:ALL) /usr/bin/apt
```  
__exclude__ _( restrict )_ __`user`__ _&_ __`group`__ _options_    
```
charlie    ubuntu-server= /usr/bin/apt
```  
_restrict to certain_ __`( user : group )`__  
```
charlie    ubuntu-server=(dscully:admins) ALL
```  
## [Setting permissions on files and directories](https://www.google.com "Setting permissions on files and directories")    
```
-rw-rw-rw- 1   doctor  doctor     5      Jan 11   12:52 welcome 
-rw-r--r-- 1   root    root       665    Feb 19   2014  profile 
-rwxr-xr-x 1   dalek   dalek      35125  Nov  7   2013  exterminate
-rw-r--r-- 1   sue     accounting 35125  Nov  7   2013  budget.txt 
drwxr-x--- 1   bob     sales      35125  Nov  7   2013  annual_projects
```  
`Object type  :  User  :  Group  :  Other's`  
```
 - ( file ), d (directory) or l ( link )  :  rwx :  rwx  :  rwx
```  
`ls -l`  
### __`chmod`__ 
__remove `read` from file permissions for `other's`__  
jane_doe@u1804:\~$ `sudo` __`chmod`__ `o-r /home/sue/budget.txt`  
__`chmod`__ `o-r budget.txt`  
__`chmod`__ `o-r /home/sue/budget.txt`  
__`chmod`__ `770 -R mydir`  
`find /path/to/dir/ -type f -exec` __`chmod`__ `644 {} ;`  
`find /path/to/dir/ -type d -exec` __`chmod`__ `755 {} ;`  
`sudo` __`chown`__ `sue myfile.txt`  
`sudo chown` __`-R`__ `sue mydir`  
`sudo chown` __`sue:sales`__ `myfile.txt`  
`sudo` __`chgrp`__  `sales myfile.txt`  
__change ownership of directory recursively__  
jane_doe@u1804:\~$ `sudo chown ` __`-R`__ `jane_doe:admins dir_name`  
__change group ownership__  
jane_doe@u1804:\~$ `sudo chgrp sales myfile.txt`  

__octal permission patterns__  
`Read: 4`  
`Write: 2`  
`Execute: 1`  
$ `chmod 600 filename.txt` ( same as ) `chmod -rw------- filename.txt`  
$ `chmod 740 filename.txt` ( same as ) `chmod -rwxr----- filename.txt`  
$ `chmod 770 filename.txt` ( same as ) `chmod -rwxrwx--- filename.txt`  
$ `chmod 770 -R dir_name`  (recursive directories)  
__Q&A__
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
#  [`customize TTY prompt` ![preview screenshot](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/CH2/EZ000t.JPG?raw=true "customize TTY prompt")](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/2/ch02lvl1sec23/creating-and-removing-users "customize TTY prompt")
  
root@u1804:/# [`echo 'export PS1="[\u@\h \w]\$ "' >> ~/.bash_profile`](https://www.packtpub.com/mapt/video/application_development/9781789802610/79474/79509/customizing-the-shell-prompt "Customizing the Shell Prompt")  
root@u1804:/# [`nano ~/.bash_profile`](https://vitux.com/how-to-customize-ubuntu-bash-prompt/ "How to Customize your Ubuntu Terminal Prompt")  
jane_doe@0051cc98e23b:~$ [`nano .bashrc`](http://ezprompt.net/ "EzPrompt; Easy Bash PS1 Generator")  
root@u1804:/# [`nano etc/skel.bashrc`](http://ezprompt.net/ "EzPrompt; Easy Bash PS1 Generator") 
```
PS1='${debian_chroot:+($debian_chroot)}\n\@ \[\e[32;40m\]\u\[\e[m\] \[\e[32;40m\]@\[\e[m\]\n \[\e[32;40m\]\H\[\e[m\] \[\e[36;40m\]\w\[\e[m\] \[\e[33m\]\\$\[\e[m\] '
```
#  [`Chapter 3. Storage Volumes`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "managing storage is more than just adding disks, Logical Volume Manager (LVM)")
## [Understanding the Linux filesystem](https://www.google.com "Understanding the Linux filesystem")    
`/`  
The beginning of the __filesystem__, all directories are underneath this

`/home` _or tilda_ __`~`__  
User home directories  

`/root`  
The home directory for `root` (__root__ doesn't have a directory underneath `/home`)

`/media`  
For removable media, such as flash drives

`/mnt`  
For volumes that are intended to stay mounted for a while

`/opt`  
Additional software packages (some programs are installed here, not as common)

`/bin`  
Essential user binaries (ls, cp, and so on)

`/proc`  
Virtual filesystem for OS-level components

`/usr/bin`  
A majority of user commands

`/usr/lib`  
Libraries

`/var/log`  
Log files
## [Managing Storage Volumes](https://www.google.com "Managing Storage Volumes")    
`apt install tmux`  
`apt install tmux`  
## [Using symbolic and hard links](https://www.google.com "Using symbolic and hard links")    
__hard link file1 to file3__  
$ `ln file1 file3`  

__list inode number__  
$ `ls -i`  

__remove file3__  
$ `rm file3`  

__symlink file1 to file3__  
$ `ln -s file1 file3`  
## [Viewing disk usage](https://www.google.com "Viewing disk usage")    
__disk filesystem__ in __human readable__  
$ `df -h`  
will show available `cyber` space  

__disk filesystem inodes__  
$ `df -i`  
shows available `inodes`  

__disk usage__  
$ `du -hsc *`  
will show `disk usage` in `human` readable, `summary` of `current` working directory total  

_install_ __NCurses Disk Usage__  
$ `sudo apt install ncdu`  

__disk usage__  
$ `ncu -x`  
`-x` limit to the current filesystem  
_during interface;_ `d` would delete 
## [Adding additional storage volumes](https://www.google.com "Adding additional storage volumes")    
__disk functions__ _-list_ 
$ `sudo fdisk -l`  
utility for `listing`, `creating` or `deleting` disk partions 

__follow display messages__  
$ `dmesg --follow`  
When done, press `Ctrl + C` on your keyboard: 

__list block devices__  
$ `lsblk`  
`/dev/sda`  
`/dev/sdb`  
`/dev/sdc`  

__adding a new volume__  
to `/etc/fstab` file  

__disk functions__  
jane_doe@u1804:~$ `sudo fdisk /dev/sdb` _..(volume path)_  
__`m`__ _for menu_  
__`n`__ _new partition_  
__`enter`__ _default partion number_  
__`1G`__ _partion size_  
__`w`__ _write changes_  
__`enter`__ _save changes_  
## [Partitioning and formatting volumes](https://www.google.com "Partitioning and formatting volumes")    

__disk function__ _..( utility again )_   
$ `sudo fdisk -l`  
_review added disk partion_  
__( _or to try again_ )__  
$ `sudo fdisk`  
`g` _new __GPT__ layout_  
`o` _new MBR layout_  

__disk format__  _(partition `ext4`)_  
$ `sudo mkfs.ext4 /dev/sdb1` _..(volume path)_  
_or_  
__disk format__  _(partition `xfs`)_  
$ `sudo mfs.xfs /dev/sdb1` _..(volume path)_  

__disk function__  _(review)_   
$ `sudo fdisk -l`  
__make directory__  
$ `sudo mkdir /mnt/vol1` _..(volume path)_  
## [Mounting and unmounting volumes](https://www.google.com "Setting permissions on files and directories")    
__mount device to directory__  
$ `sudo mount /dev/sdb1 /mnt/vol1` _..(volume path)_  
__mount device to directory with `type` option__  _..(usually un-necessary)_  
$ `sudo mount /dev/sdb1 -t ext4 /mnt/vol1` _..(volume path)_  
__unmount device__  
$ `sudo umount /mnt/vol1`  
__disk filesystem__ in __human readable__  _..(confirm unmounted)_  
$ `df -h`  
## [Understanding the /etc/fstab file](https://www.google.com "Understanding the /etc/fstab file")    
__block identification, UUID__  _..( __/__ etc __/__ f stab )_  
$ `blkid`  
__make new directory for extra storage__  _..( __/__ mnt __/__ extra_storage )_  
$ `sudo mkdir /mnt/extra_storage`  
__edit `/etc/fstab`__  
$ `sudo nano /etc/` __`fstab`__  
`UUID=e51bcc9e-45dd-45c7 /mnt/extra_storage  ext4  rw,auto 0 0`  
__mounting volume (__ with __`auto` )__  
$ `sudo mount` __`-a`__  
`UUID=e51bcc9e-45dd-45c7 /mnt/ext_disk  ext4  rw,noauto 0 0`  
__mounting an external disk__ (with __`noauto`__ ) perhaps per back-up  
$ `sudo mount /mnt/ext_disk`  
__list everything that is mounted__  
$ `mount`  
## [SWAP-file](https://www.google.com "Managing swap")
__swap volume__ (  with __`auto`__ )  
$ `sudo swapon -a`  
don't forget to edit `fstab`  
`/swapfile   none   swap   sw   0 0`  
__check memory__  
$ `free -m`  
__file allocate__  
$ `sudo fallocate -l 4G /swapfile`  
_creates a 4 gigabyte file_  
__make swap__  
$ `sudo mkswap /swapfile`  
_makes it the swap file_  
_don't forget to edit_  __/__ `etc` __/__ `f stab`  
`/swapfile   none   swap   sw   0 0`
__Activate SwapFile__ (__ with __`auto` )__  
$ `sudo` __`swapon -a`__  
## [Utilizing LVM volumes](https://www.google.com "Utilizing LVM volumes")   
_check if_ __lvm2__  _is installed_  
$ `dpkg -s lvm2 | grep status`  
_should return_ `install ok installed` _if it is installed already_  
__install lvm2__  _( Logical Volume Management )_  
$ `sudo apt install lvm2`  
__disk functions__  
$ `sudo fdisk -l`  
_should list partions_  
__pvcreate__ _( create physical volumes )_  
$  
```  
    sudo pvcreate /dev/sdb  
    sudo pvcreate /dev/sdc  
    sudo pvcreate /dev/sdd  
    sudo pvcreate /dev/sde  
```   
__display Physical Volumes__  
$ `sudo pvdisplay`  
__create Volume Group__  
$ `sudo vgcreate vg-test /dev/sdb1` _..(volume path)_   
__display Volume Groups__  
$ `vgdisplay`  
__create Logical Volume__  `-n` _name_ , `-L` _size ?_ , _group name_ ,  
$ `sudo lvcreate -n myvol1 -L 10g vg-test`  
__display Logical Volumes__  
$ `sudo lvdisplay`  
__make file system__ , _( format logical volume )_   
$ `sudo mkfs.ext4 /dev/vg-test/myvol1`  
__mount device__ _to_ __directory__  
$ `sudo mount /dev/vg-test/myvol1 /mnt/lvm/myvol1`  
__disk filesystem__ in __human readable__  _..( confirm volume is mounted & it's size )_  
$ `df -h`  
__Extend Logical Volume__  _( use the remaining space )_  
$ `sudo lvextend -n /dev/vg-test/myvol1 -l +100%FREE`  
  _( should return )_  
`Logical volume vg-test/myvol1 successfully resized.`  
__disk filesystem__ in __human readable__  _..( confirm, still need to resize file system )_  
$ `df -h`  
__Resize File-System__  _..( ext4 )_  
$ `sudo resize2fs /dev/mapper/vg--test-myvol1`  
_( should return )_  
`The filesystem on /dev/mapper/vg--test-myvol1 is now 5241856 (4k) blocks long.`  
__disk filesystem__ in __human readable__  _..( added space now usable )_  
$ `df -h`  
__Extend Volume Group__  _( add additonal volumes to group )_  
$
```
sudo vgextend vg-test /dev/sdc
sudo vgextend vg-test /dev/sdd
sudo vgextend vg-test /dev/sde
```  
_( should return )_  
`Volume group "vg-test" successfully extended`  
__display Physical Volumes__ _( confirm additional physical volumes attached )_  
$ `sudo pvdisplay`  
__Extend Logical Volume__ _( extend logical volume 10 gigabytes )_  
$ `sudo lvextend -L+10g /dev/vg-test/myvol1`  
__resize file-system__ _( make free space available to filesystem )_  
$ `sudo resize2fs /dev/vg-test/myvol1`  

__create Logical Volume__  `-s` _snapshot_ , `-n` _name_ , `-L` _maximu size ?_ , _group name_ __/__ _volume_ ,  
$ `sudo lvcreate -s -n mysnapshot -L 4g vg-test/myvol1`  
_( should return )_  
 `Logical volume "mysnapshot" created.`  
__logical volume size__ _( monitor it's size )_  
$ `lvs`  
__logical volume convert__  
$ `sudo lvconvert --merge vg-test/mysnapshot`  
_( should return )_
```
Merging of volume mysnapshot started.
myvol1: Merged: 100.0%`
```    
__logical volume size__ _( recheck )_  
$ `lvs`  
__remove logical volume__  
$ `sudo lvremove vg-test/myvol1`  
__remove logical group__  
$ `sudo vgremove vg-test`  
## [RAID - Redundant Array of Inexpensive Disks](https://www.google.com "RAID - Redundant Array of Inexpensive Disks")
__disk functions__ _-list_  
$ `sudo fdisk -l`  
_( one is hardware, multilple is software )_   
__Multiple Disk And Disk Administration__  
$ `mdadm`  

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

#  [`Chapter 4. Networks`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Host Name](https://www.google.com "Host Name")  
$ __`hostname`__  
$ `sudo apt-get install` __`systemd`__  
```
debconf: falling back to frontend: Teletype
PAM configuration
-----------------

One or more of the files /etc/pam.d/common-{auth,account,password,session} have been locally modified.  Please indicate whether these local changes should be overridden using the system-provided configuration.  If you decline this
option, you will need to manage your system's authentication configuration by hand.

Override local changes to /etc/pam.d/common-*? [yes/no]
```  
`apt-get install` __`dbus`__  
__Host Name Control__ _- set host name_  
$ `sudo ` __`hostnamectl set-hostname`__ ` u1804.mynetwork.org`  
__concatenate__ __/__ `etc` __/__ __`hostname`__ )  
$ `cat /etc/`__`hostname`__  
__edit__ __/__ `etc` __/__ `hostname` )   _- ( previous to 15.04, edit maunually )_  
$ `nano /etc/`__`hostname`__  
```
unable to resolve host u1804.mynetwork.org
```  
__edit__ __/__ `etc` __/__ __`hosts`__ )   _- ( edit maunually )_  
$ `cat /etc/`__`hosts`__  
$ `nano /etc/`__`hosts`__  
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
$ `cat /etc/netplan/50-cloud-init.yaml`  
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
1. $ `ip address`  __Hostname__  
1. $ `ipa`  __ip ddr show__
1. $ `netplan`  
1. $ `SSH`  __OpenSSH__
1. $ `Passphrase`  
1. $ `Static`  
1. $ `etc/`__nsswitch.conf__  

#  [`Chapter 5. Packages`](https://subscription.packtpub.com/book/networking_and_servers/9781788997560/5 "Managing Software Packages")
## [Managing Software Packages](https://www.twitch.tv/videos/391337823 "Chapter 5. Managing Software Packages")
## [package management](https://www.twitch.tv/videos/391340603 "Understanding Linux package management")
## [hardware enablement updates](https://www.twitch.tv/videos/391331225 "Taking advantage of hardware enablement updates")
`sudo apt install --install-recommends linux-generic-hwe-16.04`  
## [Debian vs Snap](https://www.twitch.tv/videos/391333537 "Understanding the differences between Debian and Snap packages")
`apt install tmux`  
`apt install tmux`  
## [Installing & removing software](https://www.twitch.tv/videos/391344588 "Installing & removing software")
`sudo apt install openssh-server`  
`sudo apt install <package1> <package2> <package3>`  
`sudo apt-get install apache2`  
`sudo apt update`  
`sudo apt remove <package>`  
`sudo apt remove <package1> <package2> <package3>`  
`sudo apt remove --purge <package>`  
`snap find <package>`  
`snap find nmap`  
`sudo snap install nmap`  
`which nmap`  
`sudo snap remove nmap`  
`sudo snap refresh nmap`  
`sudo snap refresh`  
## [Searching for packages](https://www.twitch.tv/videos/391350031 "Searching for packages")
`apt search <search term>`  
`apt search apache php`  
`apt-cache show libapache2-mod-php `  
## [managing repositories](https://www.twitch.tv/videos/391352473 "Managing package repositories")
```
deb http://us.archive.ubuntu.com/ubuntu/ bionic main restricted
```  
`sudo apt update`  
`sudo apt-add-repository ppa:username/myawesomesoftware-1.0`  
## [Backing up & restoring Debian packages](https://www.twitch.tv/videos/391358441 "Backing up & restoring Debian packages")
`dpkg --get-selections > packages.list `  
```
tmux install
```  
`sudo apt update`  
__`which dselect`__  
```
/usr/bin/dselect
```  
`sudo apt install dselect`  
`sudo dselect update`  
`sudo dpkg --set-selections < packages.list`  
`sudo apt-get dselect-upgrade`  
## [Cleaning up orphaned apt packages](https://www.twitch.tv/videos/391360523 "Cleaning up orphaned apt packages")
`apt autoremove`  
## [Making use of Aptitude](https://www.twitch.tv/videos/391363112 "Making use of Aptitude")
`sudo apt install aptitude`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`sudo aptitude unmarkauto <packagename>`  
`sudo aptitude`  
## [Summary](https://www.twitch.tv/videos/391366264 "Summary")
__Q__ & __A__
1. $ `apt`  
1. $ `HWE,security`  
1. $ `apt & snap`  
1. $ `sudo apt install <pckgname>`  
1. $ `sudo apt remove <pckgname>`  
1. $ `refreshes snap packaes`  
1. $ `aptitude`  
1. $ `app / program`  
1. $ `mini repository, single file`  
1. $ __`dpkg --get-selections > packages.list`__  
1. $ `sudo autoremove`  
1. $ `..., isolation`  

#  [`Chapter 6. Processes`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Chapter 6. Controlling and Monitoring Processes")
## [Monitor & Controll Processes](https://www.google.com "Controlling & Monitoring Processes")
`apt install tmux`  
`apt install tmux`  
## [`PS` Command](https://www.google.com "Showing running processes with the `PS` command")
`pidof vim`  
`ps a`  
`ps au`  
`ps aux`  
`ps aux | grep nginx`  
`ps u -C nginx`  
`ps aux --sort=-pcpu`  
`ps aux --sort=-pcpu | head -n 5`  
`ps aux --sort=-pmem | head -n 5`  
## [Managing jobs](https://www.google.com "Managing jobs")
`sudo apt install vim-nox`  
```
[1]+ Stopped nano
```  
`ps au |grep nano`  
```
jay 1070 0.0 0.9 39092 7320 pts/0 T 15:53 0:00 nano
```  
```
[1]- Stopped nano file1.txt
[2]+ Stopped nano file2.txt`  
```  
`fg 1`  
`sudo apt install htop`  
`htop &`  
## [misbehaving processes](https://www.google.com "Dealing with misbehaving processes")
`sudo kill 31258`  
`man 7 signal`  
`sudo kill -9 31258`  
`sudo killall myprocess`  
`sudo killall -9 myprocess`  
## [htop](https://www.google.com "Utilizing htop")  
`sudo apt install htop`  
`htop`  
`sudo htop`  
`htop -d 70`  
`apt install tmux`  
## [system processes](https://www.google.com "Managing system processes")
`systemctl |grep ssh`  
`systemctl status ssh`  
`systemctl status -l ssh`  
`sudo systemctl stop ssh`  
`sudo systemctl start ssh`  
`sudo systemctl enable ssh`  
`sudo systemctl disable ssh`  
`service ssh status`  
```
ssh start/running, process 907
```  
```
sudo service ssh stop  
ssh stop/waiting  
sudo service ssh start  
ssh start/running, process 1304
```  
`/etc/init.d/ssh start`  
`/etc/init.d/ssh stop`  
`/etc/init.d/ssh restart`  
`/etc/init.d/ssh reload`  
`/etc/init.d/ssh status`  
`sudo systemctl enable myservice@myuser`  
## [Monitoring memory usage](https://www.google.com "Monitoring memory usage")
`free`  
`free -m`  
`free -g`  
`cat /proc/sys/vm/swappiness`  
`sudo sysctl vm.swappiness=30`  
`/etc/sysctl.conf`  
`vm.swappiness = 30`  
## [scheduling Tasks with Cron](https://www.google.com "scheduling Tasks with Cron")
`crontab -l`  
`sudo crontab -u jdoe -l`  
```
no crontab for jdoe
```  
`crontab -e `  
`EDITOR=vim crontab -e`  
```
m h dom mon dow command
```  
```
3 0 * * 4 /usr/local/bin/cleanup.sh  
* 0 * * * /usr/bin/apt-get update  
0 1 1 * * /usr/local/bin/run_report.sh  
```
## [load average](https://www.google.com "Understanding load average")
`cat /proc/loadavg`  
`0.36, 0.29, 0.31`  
`1.87, 1.53, 1.22`  
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

#  [`Chapter 7. Services`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Setting Up Network Services](https://www.google.com "Setting Up Network Services")
`apt install tmux`  
`apt install tmux`  
## [Planning an IP address scheme](https://www.google.com "Planning an IP address scheme")
`Network: 192.168.1.0/24`  
`Network equipment: 192.168.1.1 - 192.168.1.10`  
`Servers: 192.168.1.11 - 192.168.1.99`  
`DHCP: 192.168.1.100 - 192.168.1.240`  
`Reservations: 192.168.1.241 - 192.168.1.254`  
## [Serving IP addresses with isc-dhcp-server](https://www.google.com "Serving IP addresses with isc-dhcp-server")
`sudo apt install isc-dhcp-server`  
`systemctl status isc-dhcp-server`  
`sudo systemctl stop isc-dhcp-server`  
`sudo mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.orig `  
```
default-lease-time 86400; 
max-lease-time 86400; 
option subnet-mask 255.255.255.0; 
option broadcast-address 192.168.1.255; 
option domain-name "local.lan"; 
authoritative; 
subnet 192.168.1.0 netmask 255.255.255.0 { 
    range 192.168.1.100 192.168.1.240; 
    option routers 192.168.1.1;   
    option domain-name-servers 192.168.1.1; 
} 
```
`default-lease-time 43200; `  
`max-lease-time 86400; `  
`option subnet-mask 255.255.255.0; `  
`option broadcast-address 192.168.1.255; `  
`option domain-name "local.lan"; `  
`authoritative;`  
```
subnet 192.168.1.0 netmask 255.255.255.0 { 
    range 192.168.1.100 192.168.1.240; 
    option routers 192.168.1.1; 
    option domain-name-servers 192.168.1.1; 
} 
```
`INTERFACESv4="" `  
`INTERFACESv4="enp0s3" `  
`sudo systemctl start isc-dhcp-server`  
`sudo systemctl status isc-dhcp-server`  
`sudo tail -f /var/log/syslog`  
```
May  5 22:07:36 hermes dhcpd: DHCPDISCOVER from 52:54:00:88:f8:bc via enp0s3  
May  5 22:07:36 hermes dhcpd: DHCPOFFER on 192.168.1.103 to 51:52:01:87:f7:bc via enp0s3  
```
```
lease 192.168.1.138 { 
  starts 0 2016/05/06 16:37:30; 
  ends 0 2016/05/06 16:42:30; 
  cltt 0 2016/05/06 16:37:30; 
  binding state active; 
  next binding state free; 
  rewind binding state free; 
  hardware ethernet 32:6e:92:01:1f:7f; 
} 
```
## [Setting up DNS with bind](https://www.google.com "Setting up DNS with bind")
`sudo apt install bind9`  
```
`// forwarders {`  
`//      0.0.0.0;`  
`// };`  
```
```
`forwarders {`  
`8.8.8.8;`  
`8.8.4.4;`  
`};`  
```
`sudo systemctl restart bind9`  
`systemctl status bind9`  

`subnet 192.168.1.0 netmask 255.255.255.0 {`  
`range 192.168.1.100 192.168.1.240;`  
`option routers 192.168.1.1;`  
__`option domain-name-servers 192.168.1.1;`__  
```
subnet 192.168.1.0 netmask 255.255.255.0 { 
range 192.168.1.100 192.168.1.240; 
option routers 192.168.1.1; 
option domain-name-servers 192.168.1.1; 
} 
```
`dig www.packtpub.com`  
```
;; Query time: 98 msec
```  
`;; Query time: 1 msec`  
```
`include "/etc/bind/named.conf.options";`  
`include "/etc/bind/named.conf.local";`  
`include "/etc/bind/named.conf.default-zones";`  
```  
```
zone "local.lan" IN { 
    type master; 
    file "/etc/bind/net.local.lan"; 
}; 
```  
```
$TTL 1D 
@ IN SOA local.lan. hostmaster.local.lan. ( 
 
201808161 ; serial 
 
8H ; refresh 
4H ; retry 
4W ; expire 
1D ) ; minimum 
IN A 192.168.1.1 
; 
@ IN NS hermes.local.lan. 
fileserv        IN  A   192.168.1.3 
hermes     IN A    192.168.1.1 
mailserv        IN  A   192.168.1.5 
mail            IN  CNAME   mailserv. 
web01           IN  A   192.168.1.7 
```
`$TTL 1D `  
`@ IN SOA local.lan. hostmaster.local.lan. ( `  
`201808161 ; serial `  
`8H ; refresh`  
`4H ; retry`  
`4W ; expire`  
`1D ) ; minimum`  
`IN A 192.168.1.1`  
`@ IN NS hermes.local.lan.`  
```
fileserv        IN  A   192.168.1.3 
hermes        IN  A    192.168.1.1 
mailserv        IN  A   192.168.1.5 
mail            IN  CNAME   mailserv. 
web01           IN  A   192.168.1.7 
```
`sudo systemctl restart bind9`  
`systemctl status bind9`  
`cat /var/log/syslog | grep bind9 `  
`dig webserv.local.lan`  
`dig www.packtpub.com`  
```
;; Query time: 1 msec 
;; SERVER: 127.0.0.53#53(127.0.0.53) 
;; WHEN: Sat Feb 10 10:00:59 EST 2018 
;; MSG SIZE  rcvd: 83
```
`systemd-resolve --status |grep DNS Servers`  
## [Creating a secondary (slave) DNS server](https://www.google.com "Creating a secondary (slave) DNS server")
```
options { 
        directory "/var/cache/bind"; 
        forwarders { 
                8.8.8.8; 
                8.8.4.4; 
        }; 
        dnssec-validation auto; 
 
        auth-nxdomain no; 
        listen-on-v6 { any; }; 
}; 
```
```
options { 
        directory "/var/cache/bind"; 
        allow-transfer { localhost; 192.168.1.2; }; 
        forwarders { 
                8.8.8.8; 
                8.8.4.4; 
        }; 
        dnssec-validation auto; 
 
        auth-nxdomain no; 
        listen-on-v6 { any; }; 
}; 
```  
```
zone "local.lan" IN { 
    type slave; 
    masters { 192.168.1.1; }; 
    file "/var/lib/bind/net.local.lan"; 
}; 
```  
`dig @192.168.1.1 fileserv`  
`dig @192.168.1.2 fileserv`  
```
May 06 13:19:47 ubuntu-server named[2615]: transfer of 'local.lan/IN' from 10.10.99.184#53: connected using 192.168.1.2#35275 
May 06 13:19:47 ubuntu-server named[2615]: zone local.lan/IN: transferred serial 201602093 
May 06 13:19:47 ubuntu-server named[2615]: transfer of 'local.lan/IN' from 10.10.99.184#53: Transfer status: success 
May 06 13:19:47 ubuntu-server named[2615]: transfer of 'local.lan/IN' from 10.10.99.184#53: Transfer completed: 1 messages, 10 records, 290 
May 06 13:19:47 ubuntu-server named[2615]: zone local.lan/IN: sending notifies (serial 201602093) 
```  
```
default-lease-time 86400; 
max-lease-time 86400; 
option subnet-mask 255.255.255.0; 
option broadcast-address 192.168.1.255; 
option domain-name "local.lan"; 
authoritative; 
subnet 192.168.1.0 netmask 255.255.255.0 { 
    range 192.168.1.100 192.168.1.240; 
    option routers 192.168.1.1; 
    option domain-name-servers 192.168.1.1; 
} 
```  
```
default-lease-time 86400; 
max-lease-time 86400; 
option subnet-mask 255.255.255.0; 
option broadcast-address 192.168.1.255; 
option domain-name "local.lan"; 
authoritative; 
subnet 192.168.1.0 netmask 255.255.255.0 { 
    range 192.168.1.100 192.168.1.240; 
    option routers 192.168.1.1; 
    option domain-name-servers 192.168.1.1, 192.168.1.2; 
} 
```  
## [Setting up an internet gateway](https://www.google.com "Setting up an internet gateway")
`echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward`  
`sudo nano /etc/sysctl.conf`  
```
#net.ipv4.ip_forward=1
```  
## [Keeping your clock in sync with NTP](https://www.google.com "Keeping your clock in sync with NTP")
`sudo apt install ntp`  
`systemctl status ntp`  
```
pool 0.ubuntu.pool.ntp.org iburst 
pool 1.ubuntu.pool.ntp.org iburst 
pool 2.ubuntu.pool.ntp.org iburst 
pool 3.ubuntu.pool.ntp.org iburst 
```
`#restrict 192.168.123.0 mask 255.255.255.0 notrust `  
`restrict 192.168.1.0 mask 255.255.255.0 `  
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

#  [`Chapter 8. Files`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Sharing & Transferring Files](https://www.google.com "Sharing & Transferring Files")
`apt install tmux`  
`apt install tmux`  
## [File server considerations](https://www.google.com "File server considerations")
`apt install tmux`  
`apt install tmux`  
## [Sharing files with Windows users via Samba](https://www.google.com "Sharing files with Windows users via Samba")
`sudo apt install samba`  
`sudo systemctl stop smbd`  
`sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.orig `  
```
[global] 
server string = File Server 
workgroup = WORKGROUP 
security = user 
map to guest = Bad User 
name resolve order = bcast hosts wins 
include = /etc/samba/smbshared.conf 
```   
`[global] `  
`server string = File Server `  
`workgroup = WORKGROUP `  
`security = user `  
`map to guest = Bad User `  
`name resolve order = bcast hosts wins `  
`include = /etc/samba/smbshared.conf `  
```
[Documents] 
    path = /share/documents 
    force user = myuser 
    force group = users 
    public = yes 
    writable = no 
 
[Public] 
    path = /share/public 
    force user = myuser 
    force group = users 
    create mask = 0664 
    force create mode = 0664 
    directory mask = 0777 
    force directory mode = 0777 
    public = yes 
    writable = yes 
```      
`path = /share/documents `  
`force user = myuser`  
`force group = users`  
`public = yes`  
`writable = no`  
```
create mask = 0664 
force create mode = 0664 
directory mask = 0777 
force directory mode = 0777 
```
`public = yes`  
`writable = yes`  
`sudo systemctl start smbd`  
`//myserver/shared/documents /mnt/documents cifs username=myuser,noauto 0 0`  
`sudo apt install smbclient cifs-utils`  
`sudo mount /mnt/documents`  
`sudo mount -t cifs //myserver/Documents -o username=myuser /mnt/documents`  
## [Setting up NFS shares](https://www.google.com "Setting up NFS shares")
`sudo mkdir /exports`  
`sudo apt install nfs-kernel-server `  
`sudo mv /etc/exports /etc/exports.orig`  
`/exports/backup`  
`/exports/documents`  
`/exports/public`  
```
/exports *(ro,fsid=0,no_subtree_check) 
/exports/backup 192.168.1.0/255.255.255.0(rw,no_subtree_check) 
/exports/documents 192.168.1.0/255.255.255.0(ro,no_subtree_check) 
/exports/public 192.168.1.0/255.255.255.0(rw,no_subtree_check) 
```
`man export`  
`# sudo Domain = localdomain `  
`sudo systemctl restart nfs-kernel-server`  
`systemctl status -l nfs-kernel-server`  
`sudo apt install nfs-common`  
`sudo mount myserver:/documents /mnt/documents `  
`/exports *(ro,fsid=0,no_subtree_check) `  
`sudo exportfs -a`  
## [Transferring files with `Rsync`](https://www.google.com "Transferring files with `Rsync`")
`sudo rsync -r /home/myusr /backup`  
`sudo rsync -a /home/myuser /backup`  
`-rlptgoD `  
`sudo rsync -av /home/myuser /backup`  
`sudo rsync -av /home/myuser admin@192.168.1.5:/backup`  
`sudo rsync -av --delete /src /target`  
`sudo rsync -avb --delete /src /target `  
`sudo rsync -avb --delete --backup-dir=/backup/incremental /src /target`  
```
CURDATE=$(date +%m-%d-%Y)  
export $CURDATE  
sudo rsync -avb --delete --backup-dir=/backup/incremental/$CURDATE /src /target  
```
`sudo rsync -avb --delete --backup-dir=/backup/incremental/08-17-2018 /src /target `  
## [Transferring files with `SCP`](https://www.google.com "Transferring files with `SCP`")
`which scp`  
`/usr/bin/scp`  
`scp myfile.txt jdoe@192.168.1.50:/home/jdoe `  
`scp myfile.txt jdoe@192.168.1.50:`  
`scp jdoe@192.168.1.50:myfile.txt  .`  
`scp -r /home/jdoe/downloads/linux_iso jdoe@192.168.1.50:downloads`  
`scp -r /home/jdoe/downloads/linux_iso jdoe@192.168.1.50:/home/jdoe/downloads `  
`scp -P 2222 -r /home/jdoe/downloads/linux_iso jdoe@192.168.1.50:downloads`  
`scp -rv /home/jdoe/downloads/linux_iso jdoe@192.168.1.50:downloads`  
## [Mounting remote directories with `SSHFS`](https://www.google.com "Mounting remote directories with SSHFS")
`sudo apt install sshfs`  
`sshfs myuser@192.168.1.50:/share/myfiles /mnt/myfiles`  
`sudo umount /mnt/myfiles `  
```
umount: /mnt/myfiles: Permission denied  
```
`fusermount -u /mnt/myfiles`  
`myuser@192.168.1.50:/share/myfiles    /mnt/myfiles    fuse.sshfs  rw,noauto,users,_netdev  0  0 `  
`mount /mnt/myfiles`  
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

#  [`Chapter 9. Databases`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [DataBase Management](https://www.google.com "DataBase Management")
`apt install tmux`  
`apt install tmux`  
## [Preparations for setting up a database server](https://www.google.com "Preparations for setting up a database server")
[How To Use LVM To Manage Storage Devices on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-lvm-to-manage-storage-devices-on-ubuntu-18-04 "How To Use LVM To Manage Storage Devices on Ubuntu 18.04")  
`sudo lvmdiskscan`  
## [Installing MariaDB](https://www.google.com "Installing MariaDB")
`sudo apt install mariadb-server`  
`sudo apt install mysql-server`  
`systemctl status mariadb`  
`sudo mysql_secure_installation`  

```
Enter current password for root (enter for none): 
Set root password? [Y/n] 
Remove anonymous users? [Y/n] 
Disallow root login remotely? [Y/n] 
Remove test database and access to it? [Y/n] 
Reload privilege tables now? [Y/n]
```
`sudo mariadb`  
`mariadb -u root -p`  
`UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE USER='root';`  
`FLUSH PRIVILEGES;`  
`Now, you'll be able to access the MariaDB shell as root with native authentication:`  
`mysql -u root -p`  
`MariaDB [(none)]>`  
## [MariaDB configuration](https://www.google.com "Understanding the MariaDB configuration files")
`debian.cnf`  
`debian-start`  
`mariadb.cnf`  
`my.cnf`  
`my.cnf.fallback`  
`conf.d`  
`mariadb.conf.d`  
```
[client] 
host     = localhost 
user     = root 
password =  
socket   = /var/run/mysqld/mysqld.sock 
[mysql_upgrade] 
host     = localhost 
user     = root 
password =  
socket   = /var/run/mysqld/mysqld.sock 
basedir  = /usr 
```
```
# The MariaDB/MySQL tools read configuration files in the following order: 
# 1. "/etc/mysql/mariadb.cnf" (this file) to set global defaults, 
# 2. "/etc/mysql/conf.d/*.cnf" to set global options. 
# 3. "/etc/mysql/mariadb.conf.d/*.cnf" to set MariaDB-only options. 
# 4. "~/.my.cnf" to set user-specific options. 
```
```
!includedir /etc/mysql/conf.d/ 
!includedir /etc/mysql/mariadb.conf.d/ 
```
/etc/mysql/conf.d/mysql.cnf
## [Managing MariaDB databases](https://www.google.com "Managing MariaDB databases")
`mariadb -u root -p`  
`MariaDB [(none)]>`  
`CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';`  
`FLUSH PRIVILEGES;`  
`CREATE USER 'admin'@'%' IDENTIFIED BY 'password'; `  
`CREATE USER 'admin'@'192.168.1.%' IDENTIFIED BY 'password'; `  
`GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';`  
`FLUSH PRIVILEGES;`  
`mariadb -u admin -p`  
~~`mariadb -u admin -p<password> `~~  
`GRANT SELECT ON *.* TO 'readonlyuser'@'localhost' IDENTIFIED BY 'password'; `  
`CREATE DATABASE mysampledb;`  
`SHOW DATABASES;`  
`SELECT HOST, USER, PASSWORD FROM mysql.user;`  
`GRANT SELECT ON mysampledb.* TO 'appuser'@'localhost' IDENTIFIED BY 'password';`  
`GRANT ALL ON mysampledb.* TO 'appuser'@'localhost' IDENTIFIED BY 'password';`  
`SHOW GRANTS FOR 'appuser'@'localhost';`  
`DELETE FROM mysql.user WHERE user='myuser' AND host='localhost';`  
`USE mysampledb;`  
`CREATE TABLE Employees (Name char(15), Age int(3), Occupation char(15));`  
`SHOW COLUMNS IN Employees;`  
`INSERT INTO Employees VALUES ('Joe Smith', '26', 'Ninja');`  
`SELECT * FROM Employees;`  
`DELETE FROM Employees WHERE Name = 'Joe Smith';`  
`DROP TABLE Employees;`  
`DROP DATABASE mysampledb;`  
`mysqldump -u admin -p --databases mysampledb > mysampledb.sql`  
`sudo mariadb < mysampledb.sql`  
## [Setting up a slave database server](https://www.google.com "Setting up a slave database server")
/etc/mysql/conf.d/__mysql.cnf__  
```
[mysql]  

[mysqld]  
log-bin  
binlog-do-db=mysampledb  
server-id=1  
```
/etc/mysql/mariadb.conf.d/__50-server.cnf__  
`bind-address = 127.0.0.1`  
`bind-address = 0.0.0.0`  
`GRANT REPLICATION SLAVE ON *.* to 'replicate'@'192.168.1.204' identified by 'slavepassword';`  
`sudo systemctl restart mariadb`  
`FLUSH TABLES WITH READ LOCK;`  
`mysqldump -u admin -p --databases mysampledb > mysampledb.sql`  
`mariadb -u root -p < mysampledb.sql`  

/etc/mysql/conf.d/__mysql.cnf__  
`[mysqld]`  
`server-id=2`  
`sudo systemctl restart mariadb`  
`CHANGE MASTER TO MASTER_HOST="192.168.1.184", MASTER_USER='replicate', MASTER_PASSWORD='slavepassword';`  
`UNLOCK TABLES;`  
`SHOW SLAVE STATUSG;`  
```
Slave_IO_State: Waiting for master to send event
```  
`START SLAVE;`  
`SHOW SLAVE STATUSG;`  
`USE mysampledb;`  
`INSERT INTO Employees VALUES ('Optimus Prime', '100', 'Transformer');`  
`USE mysampledb;`  
`SELECT * FROM Employees;`  
`sudo netstat -tulpn |grep mysql`  
```
tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN      946/mysqld  
```
`GRANT REPLICATION SLAVE ON *.* to 'replicate'@'192.168.1.204' identified by 'slavepassword';`  
`FLUSH PRIVILEGES`  
`CHANGE MASTER TO MASTER_HOST="192.168.1.184", MASTER_USER='replicate', MASTER_PASSWORD='slavepassword';`  
`STOP SLAVE;`  
`START SLAVE;`  
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

#  [`Chapter 10. Serving Web Content`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/10 "In this chapter, we'll take a look at Apache and NGINX, as well as securing it with SSL.")
## [Installing and configuring Apache](https://www.google.com "Installing and configuring Apache")
`sudo apt install apache2`  
`systemctl status apache2`  
__/var/www/__ html  index.html  
/etc/apache2/sites-available  __.conf__  
`sudo` __`a2ensite`__ `acmeconsulting.com.conf`  
`sudo systemctl reload apache2`  
`sudo` __`a2dissite`__ `acmeconsulting.com.conf`  
`sudo systemctl reload apache2`  
/etc/apache2/__sites-enabled__  
/etc/apache2/__apache2.conf__  
```
# Include the virtual host configurations:  
IncludeOptional sites-enabled/*.conf  
```
/etc/apache2/sites-available/__000-default.conf__  
```
<VirtualHost *:80> 
    ServerAdmin webmaster@localhost 
    DocumentRoot /var/www/html 
 
    ErrorLog ${APACHE_LOG_DIR}/error.log 
    CustomLog ${APACHE_LOG_DIR}/access.log combined 
</VirtualHost> 
```
/etc/apache2/__envvars__  
```
<VirtualHost 192.168.1.104:80> 
    ServerAdmin webmaster@localhost 
    DocumentRoot /var/www/acmeconsulting
    
    ErrorLog ${APACHE_LOG_DIR}/acmeconsulting.com-error.log 
    CustomLog ${APACHE_LOG_DIR}/acmeconsulting.com-access.log combined 
</VirtualHost> 
```
/etc/apache2/sites-available/__000-virtual-hosts.conf__
```
<VirtualHost *:80> 
    ServerName acmeconsulting.com 
    DocumentRoot /var/www/acmeconsulting 
</VirtualHost> 
 
<VirtualHost *:80> 
    ServerName acmesales.com 
    DocumentRoot /var/www/acmesales 
</VirtualHost>
```
## [Installing additional Apache modules](https://www.google.com "Installing additional Apache modules")
__`a2enmod`__  
`a2dismod`  
`apt search libapache2-mod`  
`sudo apt install libapache2-mod-php7.2`  
`apache2 -l`  
```
Which module(s) do you want to enable (wildcards ok)?
```  
`sudo` __`a2enmod`__ `php7.2`  
```
Module php7.2 already enabled
```  
```
Enabling module php7.2.
To activate the new configuration, you need to run:  
service apache2 restart  
```  
`sudo` __`a2dismod`__ `php7.2`  
```
Module php7.2 disabled.  
To activate the new configuration, you need to run:  
service apache2 restart
```  
`service apache2 restart`  
## [Securing Apache with SSL](https://www.google.com "Securing Apache with SSL")
`sudo netstat -tulpn |grep apache`  
```
tcp6       0      0 :::80       :::*        LISTEN      2791/apache2  
```
```
tcp6       0      0 :::80       :::*        LISTEN      3257/apache2  
tcp6       0      0 :::443      :::*        LISTEN      3257/apache2
```
`sudo` __`a2enmod`__ `ssl`  
`sudo systemctl restart apache2`  
/etc/apache2/sites-available/__default-ssl.conf__  
```
<IfModule mod_ssl.c> 
        <VirtualHost _default_:443> 
                ServerAdmin webmaster@localhost 
 
                DocumentRoot /var/www/html 
 
                ErrorLog ${APACHE_LOG_DIR}/error.log 
                CustomLog ${APACHE_LOG_DIR}/access.log combined 
 
                SSLEngine on 
 
        SSLCertificateFile      /etc/ssl/certs/ssl-cert-snakeoil.pem 
        SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key 
 
                <FilesMatch ".(cgi|shtml|phtml|php)$"> 
                                SSLOptions +StdEnvVars 
                </FilesMatch> 
                <Directory /usr/lib/cgi-bin> 
                                SSLOptions +StdEnvVars 
                </Directory> 
 
        </VirtualHost> 
</IfModule> 
```
`sudo a2ensite` __`default-ssl.conf`__  
`sudo mkdir /etc/apache2/`__`certs`__  
`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/certs/mysite.key -out /etc/apache2/certs/mysite.crt`  
```
Country Name (2 letter code) [AU]:US 
State or Province Name (full name) [Some-State]:Michigan 
Locality Name (eg, city) []:Detroit 
Organization Name (eg, company) [Internet Widgits Pty Ltd]:My Company 
Organizational Unit Name (eg, section) []:IT 
Common Name (e.g. server FQDN or YOUR name) []:myserver.mydomain.com 
Email Address []:webmaster@mycompany.com
```
mysite.__crt__  
mysite.__key__  
/etc/apache2/sites-available/__default-ssl.conf__   
```
# SSLCertificateFile       /etc/ssl/certs/ssl-cert-snakeoil.pem  
# SSLCertificateKeyFile    /etc/ssl/private/ssl-cert-snakeoil.key
``` 
```
SSLCertificateFile      /etc/apache2/certs/mysite.crt  
SSLCertificateKeyFile   /etc/apache2/certs/mysite.key
```  
`sudo systemctl reload apache2`  
`openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr `  
/etc/apache2/sites-available/__default-ssl.conf__   
`ServerName mydomain.com:443`  
```
<IfModule mod_ssl.c> 
        <VirtualHost *:443> 
                ServerName acmeconsulting.com:443 
 
               ServerAdmin webmaster@localhost 
 
                DocumentRoot /var/www/acmeconsulting 
 
                ErrorLog ${APACHE_LOG_DIR}/acmeconsulting.com-error.log 
                CustomLog ${APACHE_LOG_DIR}/acmeconsulting.com-access.log combined 
 
                SSLEngine on 
 
        SSLCertificateFile      /etc/apache2/certs/acmeconsulting/acme.crt 
        SSLCertificateKeyFile /etc/apache2/certs/acmeconsulting/acme.key 
 
                <FilesMatch ".(cgi|shtml|phtml|php)$"> 
                                SSLOptions +StdEnvVars 
                </FilesMatch> 
                <Directory /usr/lib/cgi-bin> 
                                SSLOptions +StdEnvVars 
                </Directory> 
 
        </VirtualHost> 
</IfModule> 
```
## [Installing and configuring NGINX](https://www.google.com "Installing and configuring NGINX")
`sudo apt install nginx`  
`/etc/nginx/sites-available/acmesales.com`  
`sudo ln -s /etc/nginx/sites-available/acmesales.com /etc/nginx/sites-enabled/acmesales.com`  
`sudo systemctl reload nginx`  
`sudo cp /etc/nginx/sites-available/default` __`/etc/nginx/sites-available/acmesales.com`__  
```
listen 80 default_server;  
listen [::]:80 default_server;  
```
```
listen 80;  
listen [::]:80;  
```
```
server_name acmesales.com www.acmesales.com;
```  
`root /var/www/`~~`html`~~ `;` 
```
root /var/www/acmesales.com;
```  
```
server { 
        listen 80; 
        listen [::]:80; 
 
        root /var/www/acmesales.com; 
 
        index index.html index.htm index.nginx-debian.html; 
 
        server_name acmesales.com www.acmesales.com; 
 
        location / { 
                try_files $uri $uri/ =404; 
        } 
} 
```
`listen 443 ssl;`  
`listen [::]:443 ssl;`  
`ssl_certificate /etc/certs/cert.pem;`  
`ssl_certificate_key /etc/certs/cert.key;`  
`ssl_session_timeout 5m;`  
```
server { 
        listen 443 ssl; 
        listen [::]:443 ssl; 
 
        root /var/www/html; 
 
        index index.html index.htm index.nginx-debian.html; 
 
        server_name acmesales.com www.acmesales.com; 
 
         ssl_certificate /etc/certs/cert.pem; 
         ssl_certificate_key /etc/certs/cert.key; 
         ssl_session_timeout 5m; 
        location / { 
                try_files $uri $uri/ =404; 
        } 
} 
```
/etc/nginx/__sites-available/default__  
```
return 301 https://$host$request_uri; 
```  
## [Setting up failover with keepalived](https://www.google.com "Setting up failover with keepalived")
`nmap -sP 192.168.1.0/24`  
`sudo apt install keepalived`  
```
Condition: start condition failed
```  
`sudo mkdir /etc/`__`keepalived`__  
`nano /etc/keepalived/`__`keepalived.conf`__
```
global_defs { 
    notification_email { 
    myemail@mycompany.com 
    } 
    notification_email_from keepalived@mycompany.com 
    smtp_server 192.168.1.150 
    smtp_connect_timeout 30 
    router_id mycompany_web_prod 
} 
vrrp_instance VI_1 { 
    smtp_alert 
    interface enp0s3 
    virtual_router_id 51 
    priority 100 
 
    advert_int 5 
    virtual_ipaddress { 
    192.168.1.200 
    } 
} 
```
```
global_defs { 
    notification_email { 
    myemail@mycompany.com 
    } 
    notification_email_from keepalived@mycompany.com 
    smtp_server 192.168.1.150 
    smtp_connect_timeout 30 
    router_id mycompany_web_prod 
} 
```
```
vrrp_instance VI_1 { 
    smtp_alert 
    interface enp0s3 
    virtual_router_id 51 
    priority 100 
 
    advert_int 5 
```
```
    virtual_ipaddress { 
    192.168.1.200 
} 
```
`sudo systemctl start keepalived`  
`sudo systemctl status -l keepalived`  
```
active (running)
```
`ip a`
```
<html> 
    <title>keepalived test</title> 
    <body> 
        <p>This is server #1!</p> 
    </body> 
</html> 
```
`sudo systemctl stop keepalived`  
## [Setting up and configuring Nextcloud](https://www.google.com "Setting up and configuring Nextcloud")
`wget <URL of Nextcloud>`  
`wget https://download.nextcloud.com/server/releases/nextcloud-13.0.0.zip`  
`unzip nextcloud-13.0.0.zip`  
`sudo apt install unzip`  
`sudo mv nextcloud /var/www/html/nextcloud`  
`sudo chown www-data:www-data -R /var/www/html/nextcloud`  
`nano /etc/apache2/sites-available/nextcloud.conf`  
```
Alias /nextcloud "/var/www/html/nextcloud/" 
 
<Directory /var/www/html/nextcloud/> 
  Options +FollowSymlinks 
  AllowOverride All 
 
 <IfModule mod_dav.c> 
  Dav off 
 </IfModule> 
 
 SetEnv HOME /var/www/html/nextcloud 
 SetEnv HTTP_HOME /var/www/html/nextcloud 
</Directory> 
```

`sudo a2ensite nextcloud.conf`  
`sudo apt install libapache2-mod-php7.2 php7.2-curl php7.2-gd php7.2-intl php7.2-mbstring php7.2-mysql php7.2-xml php7.2-zip`  
`sudo systemctl restart apache2`  
`CREATE DATABASE nextcloud;`  
`GRANT ALL ON nextcloud.* to 'nextcloud'@'localhost' IDENTIFIED BY 'super_secret_password';`  
`http://192.168.1.100/nextcloud `  
`http://nextcloud.yourdomain.com `  
/var/www/html/nextcloud/__data__  
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

[![Nginx HTTP Server book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/nginxHTTPserver.png?raw=true "
How Nginx and Apache benefit from each other")](https://www.packtpub.com/mapt/book/virtualization_and_cloud/9781788623551/7/ch07lvl1sec42/how-nginx-and-apache-benefit-from-each-other)
[![NGINX Cookbook cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/nginxCOOKbook.png?raw=true "
Since the mainline release (currently 1.11.19) has all of the latest features, you'll need to install it directly from the NGINX repositories. Thankfully, NGINX is kind enough to provide Red Hat Enterprise Linux (RHEL), CentOS, SUSE Linux Enterprise Server (SLES), Debian, and Ubuntu repositories, as well as OS X and Windows binaries.")](https://www.packtpub.com/mapt/book/networking_and_servers/9781786466174/1/01lvl1sec10/a-quick-installation-guide)

#  [`Chapter 11. Shell Techniques`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Learning Advanced Shell Techniques](https://www.google.com "Learning Advanced Shell Techniques")
`apt install tmux`  
`apt install tmux`  
## [Understanding the Linux shell](https://www.google.com "Understanding the Linux shell")
`cat /etc/passwd`  
## [Bash history](https://www.google.com "Bash history")
`history`  
`!100`  
`systemctl status apache2`  
`history -d 100`  
~~`mariadb -u root -pSuperSecretPassword`~~  
## [some useful command-line tricks](https://www.google.com "some useful command-line tricks")
`sudo !!`  
Ctrl R  
`sudo apt update && sudo apt install apache2`  
Ctrl x  
Ctrl E  
`sudo apt update; sudo apt install apache2`  
`echo $?`  
`alias install="sudo apt install"`  
`install tmux`  
`alias i="sudo apt install"`  
`i tmux`  
`alias cpu10='ps auxf | sort -nr -k 3 | head -10'`  
`alias mem10='ps auxf | sort -nr -k 4 | head -10'`  
`alias lsmount='mount |column -t'`  
`alias c=clear`  
```
alias i='sudo apt install'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'
alias mem10='ps auxf | sort -nr -k 4 | head -10'
alias lsmount='mount |column -t'
```
`cd -`  
## [Redirecting output](https://www.google.com "Redirecting output")
`cat /var/log/syslog | grep apache2`  
`echo "this is a test" >> ~/myfile.txt`  
~~`echo "this is a test" > ~/myfile.txt`~~  
`find /etc -name *apache*`  
```
find: '/etc/lvm/backup': Permission denied 
find: '/etc/lvm/archive': Permission denied 
find: '/etc/vpnc': Permission denied 
find: '/etc/ssl/private': Permission denied 
find: '/etc/libvirt/secrets': Permission denied 
find: '/etc/polkit-1/localauthority': Permission denied 
```
`find /etc -name *apache* 2>/dev/null`  
`find etc -name *apache* 1> ~/myfile.txt`  
## [Understanding variables](https://www.google.com "Understanding variables")
`myvar='Hello world!'`  
`echo $myvar`  
`mydir="/etc"`  
`ls $mydir`  
`env`  
`read age`  
`echo $age`  
`echo "Please enter your age"`  
`read age`  
`echo "Your age is $age"`  
## [Writing simple scripts](https://www.google.com "Writing simple scripts")
`nano ~/myscript.sh`  
```
#!/bin/bash
echo "My name is $USER"
echo "My home directory is $HOME"
```
`chmod +x ~/myscript.sh`  
`~/myscript.sh`  
`"My name is jay"`  
`"My home directory is /home/jay"`  
```
#!/bin/bash 
sudo apt install apache2 
sudo apt install libapache2-mod-php7.2 
sudo a2enmod php 
sudo systemctl restart apache2
```
```
#!/bin/bash 
 
# Install Apache if it's not already present 
if [ ! -f /usr/sbin/apache2 ]; then 
    sudo apt install -y apache2 
    sudo apt install -y libapache2-mod-php7.2 
    sudo a2enmod php 
    sudo systemctl restart apache2 
fi 
```
`# Install Apache if it's not already present `  
`if [ ! -f /usr/sbin/apache2 ]; then`  
```
#!/bin/bash 
myvar=10 
if [ $myvar -eq 1]; then 
    echo "The variable equals 1" 
else 
    echo "The variable doesn't equal 1" 
fi 
```
`-eq`  (equal to)  
`-ne`  (not equal to)  
`-gt`  (greater than)  
`-ge`  (greater than or equal to)  
`-lt`  (less than)  
`-le`  (less than or equal to)  
```
#!/bin/bash 
myvar=1 
while [ $myvar -le 15 ] 
do 
    echo $myvar 
    ((myvar++)) 
done 
```
`myvar=1 `  
`while [ $myvar -le 15 ]`  
`echo $myvar`  
`((myvar++))`  
`done`  
```
#!/bin/bash
turtles='Donatello Leonardo Michelangelo Raphael'
for t in $turtles
do
echo $t
done
```
`turtles='Donatello Leonardo Michelangelo Raphael'`  
`echo $turtles`  
`for t in $turtles`  
`do`  
`echo $t`  
`done`  
## [Putting it all together: Writing an rsync backup script](https://www.google.com "Putting it all together: Writing an rsync backup script")
`rsync -avb --delete --backup-dir=/backup/incremental/08-17-2018 /src /target`  
__`rsync -avb --delete --backup-dir=/backup/incremental/$CURDATE /src /target`__  
```
#/bin/bash 
CURDATE=$(date +%m-%d-%Y) 
if [ ! -f /usr/bin/rsync ]; then 
    sudo apt install -y rsync 
fi 
rsync -avb --delete --backup-dir=/backup/incremental/$CURDATE /src /target 
```
`chmod +x backup.sh`  
`mv backup.sh /usr/local/bin`  
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

#  [`Chapter 12. Virtualization`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Virtualization](https://www.google.com "Virtualization")
`apt install tmux`  
## [Setting up a virtual machine server](https://www.google.com "Setting up a virtual machine server")
`egrep -c '(vmx|svm)' /proc/cpuinfo`  
`sudo groupadd kvm`  
`sudo apt install bridge-utils libvirt-bin qemu-kvm qemu-system`  
`systemctl status libvirtd`  
`sudo systemctl stop libvirtd `  
`sudo chown root:kvm /var/lib/libvirt/images`  
`sudo chmod g+rw /var/lib/libvirt/images`  
`sudo usermod -aG kvm <user>`  
log out and log in again  
`sudo systemctl` __`start`__ `libvirtd`  
`sudo systemctl` __`status`__ `libvirtd`  
`sudo apt install` __`ssh-askpass virt-manager`__  
/etc/__libvirt__/libvirtd.conf  
`sudo cp /etc/libvirt/libvirtd.conf /etc/libvirt/libvirtd.conf.orig`  
```
unix_sock_group = "libvirtd"  

unix_sock_group = "kvm"  
```
```
unix_sock_ro_perms = "0777"

unix_sock_ro_perms = "0770"  
```
`sudo systemctl restart libvirtd`  
`virt-manager`  

`sudo chown root:kvm /var/lib/libvirt/images/ISO`  
`sudo chmod g+rw var/lib/libvirt/images/ISO`  
## [Creating virtual machines](https://www.google.com "Creating virtual machines")
`apt install tmux`  
## [Bridging the virtual machine network](https://www.google.com "Bridging the virtual machine network")
/etc/netplan/__01-netcfg.yaml__
```
network: 
  version: 2 
  renderer: networkd 
  ethernets: 
    enp0s3: 
      dhcp4: false 
  bridges: 
    br0: 
      interfaces: [enp0s3] 
      dhcp4: true 
      parameters: 
        stp: false 
        forward-delay: 0 
```
`sudo netplan apply`  
`ip addr show`  
## [Simplifying virtual machine creation with cloning](https://www.google.com "Simplifying virtual machine creation with cloning")
`sudo rm /etc/ssh/ssh_host_*`  
`sudo dpkg-reconfigure openssh-server`  
## [Managing virtual machines via the command line](https://www.google.com "Managing virtual machines via the command line")
`virsh` __`list`__  
`virsh` __`start my_vm`__  
`virsh` __`shutdown my_vm`__  
`virsh` __`suspend my_vm`__  
`virsh` __`resume my_vm`__  
`virsh` __`destroy my_vm`__  
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

#  [`Chapter 13. Containers`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
"..so now we have a Dockerfile, what do we do with it? Turn it into an image of course!  
Use the docker build command from within the directory that contains the Dockerfile."
### $`docker build -t ubuntu:1804 .`
## [Running Containers](https://www.google.com "Running Containers")
`apt install tmux`  
`apt install tmux`  
## [What is containerization?](https://www.google.com "What is containerization?")
`apt install tmux`  
`apt install tmux`  
## [Understanding the differences between Docker and LXD](https://www.google.com "Understanding the differences between Docker and LXD")
`apt install tmux`  
`apt install tmux`  
## [Installing Docker](https://www.google.com "Installing Docker")
`sudo apt install docker.io`  
`uname -m`  
```
x86_64
```
`systemctl status docker`  
`sudo usermod -aG docker <yourusername>`  
`groups`  
## [Managing Docker containers](https://www.google.com "Managing Docker containers")
`docker search ubuntu`  
`docker pull ubuntu`  
`docker images`  
`docker rmi 0458a4468cbc`  
`docker run -it ubuntu:latest /bin/bash`  
`docker ps`  
`docker ps -a`  
`Ctrl + P`  
`Ctrl + Q`  
`docker start 353c6fe0be4d`  
`docker attach 353c6fe0be4d`  
`docker run -dit ubuntu /bin/bash`  
`docker run -dit -p 8080:80 ubuntu /bin/bash`  
`docker attach dfb3e`  
~~`sudo apt install apache2`~~  
`apt update`  
`apt install apache2`  
`/etc/init.d/apache2 start`  
`sudo apt install nano`  
( very end of the ) __/etc/bash/rc__  
```
/etc/init.d/apache2 start
```  
`Ctrl + P`  
`Ctrl + Q`  
`docker ps`  
`docker commit <Container ID> ubuntu/apache-server:1.0`  
`docker images`  
`docker run -dit -p 8080:80 ubuntu/apache-server:1.0 /bin/bash`  
`docker stop <Container ID>`  
## [Automating Docker image creation with Dockerfiles](https://www.google.com "Automating Docker image creation with Dockerfiles")
```
FROM ubuntu
MAINTAINER Jay <myemail@somewhere.net>
# Update the container's packages
RUN apt update; apt dist-upgrade -y
RUN apt install -y apache2 vim-nox
RUN echo "/etc/init.d/apache2 start" >> /etc/bash.bashrc
docker build -t packt/apache-server:1.0 .
docker run -dit -p 8080:80 packt/apache-server:1.0 /bin/bash
```
`FROM ubuntu`  
`MAINTAINER Jay <myemail@somewhere.net>`  
`# Update the container's packages`  
`RUN apt update; apt dist-upgrade -y`  
`RUN apt install -y apache2 vim-nox`  
`RUN echo "/etc/init.d/apache2 start" >> /etc/bash.bashrc`  
`docker build -t packt/apache-server:1.0 .`  
`docker run -dit -p 8080:80 packt/apache-server:1.0 /bin/bash`  
## [Managing LXD containers](https://www.google.com "Managing LXD containers")
`sudo snap install lxd`  
`sudo usermod -aG lxd <yourusername>`  
`lxd init`  
`lxc launch ubuntu:18.04 mycontainer`  
`lxc exec mycontainer Bash`  
`lxc exec mycontainer -- sudo --login --user ubuntu`  
`lxc config set mycontainer boot.autostart 1`  
`sudo apt update && sudo apt install apache2`  
`curl <container_ip_address>`  
`lxc profile create external`  
`Profile extbr0 created`  
`lxc network edit external`  
```
description: External access profile
devices:
eth0:
name: eth0
nictype: bridged
parent: br0
type: nic
```
`lxc launch ubuntu:18.04 mynewcontainer -p default -p external`  
`lxc profile add mycontainer external`  
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

[![Mastering Docker book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/cover_DocMaster.png?raw=true "
Mastering Docker - Third Edition
By Russ McKendrick, Scott Gallagher
October 2018
Master Docker and leverage its power in your day-to-day workflow")](https://www.packtpub.com/mapt/book/virtualization_and_cloud/9781789616606/13/ch13lvl1sec113/docker-for-development)
[![Mastering DevOps video course](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/C08041_MockupCover_low.png?raw=true "
Dockerising your own App: Building Docker Image the Imperative Way")](https://www.schoolofdevops.net/courses/enrolled/254048)

#  [`Chapter 14. Ansible`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Automating Server Configuration with Ansible](https://www.google.com "Automating Server Configuration with Ansible")
`apt install tmux`  
`apt install tmux`  
## [Understanding the need for configuration management](https://www.google.com "Understanding the need for configuration management")
`apt install tmux`  
`apt install tmux`  
## [Why Ansible?](https://www.google.com "Why Ansible?")
`apt install tmux`  
`apt install tmux`  
## [Creating a Git repository](https://www.google.com "Creating a Git repository")
`sudo apt install git`  
`git config user.email "you@example.com"`  
`git config user.name "John Doe"`  
`git clone https://github.com/myusername/ansible.git`  
`echo "this is a test" > testfile.txt`  
`git add testfile.txt`  
`git commit -m "initial commit"`  
`git push origin master`  
`git add myplaybook.yml`  
`git commit -m "insert message about the commit here"`  
`git push origin master`  
## [Getting started with Ansible](https://www.google.com "Getting started with Ansible")
`sudo apt-add-repository ppa:ansible/ansible`  
`sudo apt update`  
`sudo apt install ansible`  
`/etc/sudoers.d/ansible`  
`ansible ALL=(ALL) NOPASSWD: ALL`  
`sudo chown root:root /etc/sudoers.d/ansible`  
`sudo chmod 440 /etc/sudoers.d/ansible`  
`sudo su - ansible`  
`ssh 192.168.1.123 sudo ls /etc`  
## [Making your servers do your bidding](https://www.google.com "Making your servers do your bidding")
`sudo touch /etc/ansible/hosts`  
`chown ansible /etc/ansible/hosts`  
`chmod 600 /etc/ansible/hosts`  
```
192.168.1.145  
192.168.1.125  
192.168.1.166  
```
```
myhost1.mydomain.com  
myhost2.mydomain.com  
myhost3.mydomain.com  
```
`nano` /etc/ansible/__ansible.cfg__  
```
[defaults]  
inventory = /path/to/hosts  
```
`ansible all -m ping`  
```
192.168.1.145 | SUCCESS => {
  "changed": false,
  "ping": "pong"
}
```
/etc/ansible/__packages.yml__  
```
---
- hosts: all
  become: true
  tasks:
  - name: Install htop
    apt: name=htop
```
`ansible-playbook packages.yml`  
```
---
- hosts: all
  become: true
  tasks:
  - name: Install htop
    apt: name=htop
  - name: Install git
    apt: name=git
  - name: Install vim-nox
    apt: name=vim-nox
```
```
---
- hosts: all
  become: true
  tasks:
  - name: Install packages
    apt: name={{item}}
    with_items:
      - htop
      - git
      - vim-nox
```
```
---
- hosts: all
  become: true
  tasks:
  - name: copy SSH motd
    copy: src=motd dest=/etc/motd
```  
## [Putting it all together – Automating web server deployment](https://www.google.com "Putting it all together – Automating web server deployment")
```
---
- hosts: all
  become: true
  tasks:
  - name: Install Apache
    apt: name=apache2
```
```
---
- hosts: all
  become: true
  tasks:
  - name: Install Apache
    apt: name=apache2
  - name: Start the apache2 services
    service: name=apache2 state=started
```
```
<html>
<title>Ansible is awesome!</title>
<body>
    <p>Ansible is amazing. With just a small text file, we automated the setup of a web server!</p>
</body>
</html>
```
```
---
- hosts: all
  become: true
  tasks:
  - name: Install Apache
    apt: name=apache2
  - name: Start the apache2 services
    service: name=apache2 state=started
  - name: Copy index.html
    copy: src=index.html dest=/var/www/html/index.html
```
`ansible-playbook apache.yml`  
## [Using Ansible's pull method](https://www.google.com "Using Ansible's pull method")
`ansible-pull -U https://github.com/myusername/ansible.git`  
`ansible-pull -U https://github.com/myusername/ansible.git myplaybook.yml`  
```
---
- hosts: localhost
  become: true
  tasks:
  - name: Install Apache
    apt: name=apache2
  - name: Start the apache2 services
    service: name=apache2 state=started
  - name: Copy index.html
    copy: src=index.html dest=/var/www/html/index.html
```
`sudo su - ansible`  
`ansible-pull -U https://github.com/myusername/ansible.git`  
`ansible-pull -U h https://github.com/myusername/ansible.git apache.yml`  
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

#  [`Chapter 15. Securing`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Securing Your Server](https://www.google.com "Securing Your Server")
`apt install tmux`  
`apt install tmux`  
## [Lowering your attack surface](https://www.google.com "Lowering your attack surface")

### [`sudo` __`netstat`__ `-tulpn`](https://linuxconfig.org/learning-linux-commands-netstat "Frequently used netstat flags")
[`sudo` __`netstat`__ `-tuelp`](https://linuxconfig.org/learning-linux-commands-netstat "Frequently used netstat flags")  
~~[`sudo` __`netstat`__ `-vWeenNcCF`](https://linuxconfig.org/learning-linux-commands-netstat "Frequently used netstat flags")~~  
[`sudo` __`netstat`__ `-vWnNcaeol`](https://linuxconfig.org/learning-linux-commands-netstat "Frequently used netstat flags")  
[`sudo` __`netstat`__ `-vWeenNac`](https://linuxconfig.org/learning-linux-commands-netstat "Frequently used netstat flags")  
`a` all  
[`c` continuous](https://www.sitepoint.com/community/t/short-sheet-for-netstat-flags/321864/2?u=turtlewolf1 "Shows the statistics of the Network Buffer Cache.")  
[`C` cache](https://www.sitepoint.com/community/t/short-sheet-for-netstat-flags/321864/2?u=turtlewolf1 "Shows the statistics of the Network Buffer Cache.")  
`e` extend   
`i` interface  
`l` listening  
`n` numbered  
`p` process id  
`r` routing  
`s` statistics  
`t` tcp  
`u` udp  
~~`~?~` add mores~~
```
usage: netstat [-vWeenNcCF] [<Af>] -r         netstat {-V|--version|-h|--help}
       netstat [-vWnNcaeol] [<Socket> ...]
       netstat { [-vWeenNac] -i | [-cnNe] -M | -s [-6tuw] }

        -r, --route              display routing table
        -i, --interfaces         display interface table
        -g, --groups             display multicast group memberships
        -s, --statistics         display networking statistics (like SNMP)
        -M, --masquerade         display masqueraded connections

        -v, --verbose            be verbose
        -W, --wide               don't truncate IP addresses
        -n, --numeric            don't resolve names
        --numeric-hosts          don't resolve host names
        --numeric-ports          don't resolve port names
        --numeric-users          don't resolve user names
        -N, --symbolic           resolve hardware names
        -e, --extend             display other/more information
        -p, --programs           display PID/Program name for sockets
        -o, --timers             display timers
        -c, --continuous         continuous listing

        -l, --listening          display listening server sockets
        -a, --all                display all sockets (default: connected)
        -F, --fib                display Forwarding Information Base (default)
        -C, --cache              display routing cache instead of FIB
        -Z, --context            display SELinux security context for sockets

  <Socket>={-t|--tcp} {-u|--udp} {-U|--udplite} {-S|--sctp} {-w|--raw}
           {-x|--unix} --ax25 --ipx --netrom
  <AF>=Use '-6|-4' or '-A <af>' or '--<af>'; default: inet
  List of possible address families (which support routing):
    inet (DARPA Internet) inet6 (IPv6) ax25 (AMPR AX.25)
    netrom (AMPR NET/ROM) ipx (Novell IPX) ddp (Appletalk DDP)
    x25 (CCITT X.25)
```
`sudo apt remove rpcbind`  
`dpkg --get-selections > installed_packages.txt`  
`cat installed_packages.txt`  
## [Understanding and responding to CVEs](https://www.google.com "Understanding and responding to CVEs")
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
`apt install tmux`  
## [Installing security updates](https://www.google.com "Installing security updates")
`sudo apt upgrade`  
`sudo systemctl restart bind9`  
`/var/cache/apt/archives`  
`sudo dpkg -i /path/to/package.deb`  
`sudo dpkg -i /var/cache/apt/archives/linux-generic_4.15.0.7.8_amd64.deb`  
`sudo apt -f install`  
## [Automatically installing patches with the Canonical Livepatch service](https://www.google.com "Automatically installing patches with the Canonical Livepatch service")
`sudo snap install canonical-livepatch`  
`sudo canonical-livepatch enable <token>`  
`sudo canonical-livepatch status`  
## [Monitoring Ubuntu servers with Canonical's Landscape service](https://www.google.com "Monitoring Ubuntu servers with Canonical's Landscape service")
`sudo add-apt-repository ppa:landscape/17.03`  
`sudo apt update`  
`sudo apt install landscape-server-quickstart`  
`https://<IP_Address>/account/standalone/computers`  
```
sudo apt updatesudo apt install landscape-clientsudo landscape-config --computer-title "My Server" --account-name standalone --url https://<IP_ADDRESS>/message-system --ping-url http://<IP_Address>/ping
```  
## [Securing OpenSSH](https://www.google.com "Securing OpenSSH")
`sudo systemctl restart ssh`  
`Port 22222`  
`ssh -p 22222 myhost`  
`scp -P 22222 myfile myserver:/path/to/dir`  
`AllowUsers larry moe curly`  
`sudo groupadd sshusers`  
`sudo usermod -aG sshusers myuser`  
`AllowGroups admins sshusers gremlins`  
`PermitRootLogin no`  
`PasswordAuthentication no`  
__`/etc/ssh/sshd_config`__  
```
Port 22222 
Protocol 2 
AllowUsers larry moe curly 
AllowGroups admins sshusers gremlins 
PermitRootLogin no 
PasswordAuthentication no 
```  
## [Installing and configuring Fail2ban](https://www.google.com "Installing and configuring Fail2ban")
#### [18.04 (Bionic Beaver) Digital Ocean](https://www.tricksofthetrades.net/2018/05/18/fail2ban-installing-bionic/ "Installing Fail2ban on Ubuntu 18.04 (Bionic Beaver)")
`sudo apt-get update -y`  
`sudo apt-get install fail2ban sendmail`  
`sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local`  
`cat /etc/fail2ban/jail.local`  
`sudo vim /etc/fail2ban/jail.local`  
`sudo nano /etc/fail2ban/jail.local`  
`sudo systemctl` ~~service~~ `enable fail2ban`  
`sudo systemctl` ~~service~~ `start fail2ban`  
`sudo fail2ban-client restart`  
`sudo fail2ban-client status`  
`sudo fail2ban-client status sshd`  
#### [18.04 (Bionic Beaver) Linode](https://www.linode.com/docs/security/using-fail2ban-for-security/ "Use Fail2ban to Secure Your Server")
`sudo apt-get update && sudo apt-get upgrade -y`  
`sudo apt-get install fail2ban`  
`sudo apt-get install sendmail`  
`ufw allow ssh`  
`ufw enable`  
`cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local`  
```
ignoreip = 127.0.0.1/8 ::1
maxretry = 7
port    = 22222
enabled = true
``` 
`sudo systemctl` ~~service~~ `start fail2ban`  
`sudo fail2ban-client restart`  
`sudo fail2ban-client status`  
`sudo fail2ban-client status sshd`  
#### [Installing and configuring Fail2ban](https://subscription.packtpub.com/book/networking_and_servers/9781788997560/15/ch15lvl1sec157/installing-and-configuring-fail2ban "Installing and configuring Fail2ban")
`sudo apt install fail2ban`  
`sudo cp /etc/fail2ban/jail.conf `  __`/etc/fail2ban/jail.local`__  
`sudo nano /etc/fail2ban/jail.local`  
`#ignoreip = 127.0.0.1/8 ::1`  
`Ignoreip = 127.0.0.1/8 ::1 192.168.1.0/24 192.168.1.245/24`  
`Ignoreip = 127.0.0.1/8 ::1 192.168.1.0`  
`bantime  = 10m`  
`maxretry = 7`  
__`[sshd]`__ _and another underneath_ __`[sshd-ddos]`__  
`port    = ssh`  
`port    = 22222`  
`sudo systemctl` __`restart`__ `fail2ban`  
`sudo systemctl` __`status -l`__ `fail2ban`  
`sudo` __`fail2ban-client status`__  
`enabled = true `  
```
[apache-auth] 
enabled = true 
port     = http,https 
logpath  = %(apache_error_log) 
```
`sudo systemctl restart fail2ban`  
`sudo systemctl status -l fail2ban`  
`sudo fail2ban-client status`  
```
Status
|- Number of jail: 2

  `- Jail list:    apache-auth, sshd
```  
#### [SELinux](https://youtu.be/HhydNtaLEK0 "Security Enhanced Linux")  
`sudo` __`getenforce`__  
`fail2ban-client status`  
`fail2ban-client status`  
`fail2ban-client status`  
`fail2ban-client status`
## [MariaDB best practices for secure database servers](https://www.google.com "MariaDB best practices for secure database servers")
`ALL: 192.168.1.50`  
`ALL: 192.168.1.0/255.255.255.0`  
`ALL: 192.168.1.`  
`ALL: ALL`  
`ssh: 192.168.1.`  
`ALL: ALL`  
`GRANT SELECT ON mysampledb.* TO 'appuser'@'localhost' IDENTIFIED BY 'password';`  
`GRANT SELECT ON mysampledb.* TO 'appuser'@'%' IDENTIFIED BY 'password';`  
`GRANT SELECT ON mysampledb.* TO 'appuser'@'192.168.1.50' IDENTIFIED BY 'password';`  
`GRANT SELECT ON mysampledb.* TO 'appuser'@'192.168.1.% IDENTIFIED BY 'password'`  
## [Setting up a firewall](https://www.google.com "Setting up a firewall")
#### [Setting up a firewall](https://subscription.packtpub.com/book/networking_and_servers/9781788997560/15/ch15lvl1sec159/setting-up-a-firewall "Setting up a firewall")
`sudo apt install ufw`  
`sudo ufw status`  
`sudo ufw allow from 192.168.1.156 to any port 22`  
`sudo ufw allow proto tcp from 82.99.220.212 to any port 22222`  
`sudo ufw allow from 82.99.220.212 to any port 22222/tcp`  
`sudo ufw allow from 82.99.220.212 to any port 22222`  
`sudo ufw allow from 192.168.1.0/24 to any port 22`  
~~`sudo ufw allow from 192.168.1.50`~~  
`sudo ufw allow 80`  
`sudo ufw allow 443`  
`sudo ufw enable`  
`sudo iptables -L`  
#### [How To Set Up a Firewall with UFW on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-18-04#step-3-%E2%80%94-allowing-ssh-connections "How To Set Up an Uncomplicated FireWall on Ubuntu 18.04")
~~`sudo apt install ufw`~~  
`sudo nano` __`/etc/default/ufw`__  
`IPV6=yes`  
`sudo iptables -L`  
`sudo ufw default deny incoming`  
`sudo ufw default allow outgoing`  
`sudo ufw allow ssh`  
`/etc/`__`services`__  
`sudo ufw allow 2222`  
`sudo ufw` __`enable`__  
`sudo ufw status` __`verbose`__  
`sudo iptables -L`  

`sudo ufw allow http`  
`sudo ufw allow https`  
`sudo ufw allow from 203.0.113.4`  
`sudo ufw allow from 203.0.113.4 to any port 22`  
`ip addr`  
`sudo ufw status numbered`  
`sudo ufw status verbose`  
`sudo ufw disable`  
`sudo ufw reset`    

#### [Setting up a firewall](https://www.google.com "Setting up a firewall")
`sudo apt install ufw`  
`sudo ufw status`  
`sudo ufw allow from 192.168.1.156 to any port 22`  
`sudo ufw allow from 192.168.1.0/24 to any port 22`  
`sudo ufw allow from 192.168.1.50`  
`sudo ufw allow 80`  
`sudo ufw allow 443`  
`sudo ufw enable`  
`Firewall is active and enabled on system startup`  
`sudo iptables -L`  
## [Encrypting and decrypting disks with LUKS](https://www.google.com "Encrypting and decrypting disks with LUKS")
`sudo apt install cryptsetup`  
`sudo cryptsetup luksFormat /dev/sdb`  
`WARNING!========This will overwrite data on /dev/sdb irrevocably.`  
`Are you sure? (Type uppercase yes):`  
`sudo cryptsetup luksOpen /dev/sdb backup_drive`  
`sudo mkfs.ext4 -L "backup_drive" /dev/mapper/backup_drive`  
`sudo mount /dev/mapper/backup_drive /media/backup_drive`  
`sudo umount /media/backup_drive`  
`sudo cryptsetup luksClose /dev/mapper/backup_drive`  
`sudo cryptsetup luksOpen /dev/sdb backup_drive`  
`sudo mount /dev/mapper/backup_drive /media/backup_drive`  
`sudo cryptsetup luksChangeKey /dev/sdb -S 0`  
## [Locking down sudo](https://www.google.com "Locking down sudo")
`charlie    ALL=(ALL:ALL) /usr/sbin/reboot,/usr/sbin/shutdown`  
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

#  [`Chapter 16. TroubleShooting`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Troubleshooting Ubuntu Servers](https://www.google.com "Troubleshooting Ubuntu Servers")
`apt install tmux`  
`apt install tmux`  
## [Evaluating the problem space](https://www.google.com "Evaluating the problem space")
`apt install tmux`  
`apt install tmux`  
## [Conducting a root cause analysis](https://www.google.com "Conducting a root cause analysis")    
`apt install tmux`  
`apt install tmux`  
## [Viewing system logs](https://www.google.com "Viewing system logs")    
`cat /var/log/apache2/access.log`  
`tail /var/log/apache2/access.log`  
`tail -n 100 /var/log/apache2/access.log`  
`tail -f /var/log/apache2/access.log`  
`less /var/log/apache2/access.log`  
`cat /var/log/syslog |grep dhcp`  
`zcat /var/log/syslog.2.gz`  
## [Tracing network issues](https://www.google.com "Tracing network issues")    
`nslookup myserver.local`  
`systemd-resolve --status | grep DNS Servers`  
`lspci | grep -i net`  
`lspci |grep -i net`  
```
01:00.1 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 12)02:00.0 Network controller: Intel Corporation Wireless 8260 (rev 3a)
```
## [Troubleshooting resource issues](https://www.google.com "Troubleshooting resource issues")    
`df -hdf -i`  
`sudo ncdu -x /home`  
`du -cksh * | sort -hr | head -n 15`  
`sudo touch /forcefsck`  
`sudo touch /home/forcefsck`  
`sudo iotop`  
## [Diagnosing defective RAM](https://www.google.com "Diagnosing defective RAM")
`apt install tmux`  
`apt install tmux`  
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
#  [`Chapter 17. Distasters`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## [Preventing & Recovering from Disasters](https://www.g.com "Chapter 17. Preventing & Recovering from Disasters") 
`apt install tmux`  
`apt install tmux`  
## [Preventing disasters](https://www.google.com "Preventing disasters")    
`apt install tmux`  
`apt install tmux`  
## [Utilizing Git for configuration management](https://www.google.com "Utilizing Git for configuration management")
`sudo apt install git`  
`sudo mkdir /git`  
`sudo chown jay:jay /git`  
`git init --bare apache2`  
`Initialized empty Git repository in /git/apache2/`  
`git clone 192.168.1.101:/git/apache2`  
`warning: You appear to have cloned an empty repository`  
`sudo cp -rp /etc/apache2 /etc/apache2.bak`  
`sudo mv /etc/apache2/* /git/apache2`  
`sudo rm /etc/apache2`  
`sudo find /git/apache2 -name '.?*' -prune -o -exec chown root:root {} +`  
`sudo ln -s /git/apache2 /etc/apache2`  
`ls -l /etc | grep apache2`  
`lrwxrwxrwx 1 root root 37 2016-06-25 20:59 apache2 -> /git/apache2`  
`sudo systemctl reload apache2`  
`git add`  
`git add <filename>`  
`git commit -a -m "My first commit."`  
`git push origin master`  
`git clone 192.168.1.101:/git/apache2`  
`git commit -a -m "Updated config files."`  
`git push origin master`  
`sudo apt install tig`  
`git checkout 356dd6153f187c1918f6e2398aa6d8c20fd26032`  
`git checkout master`  
`git revert --no-commit 356dd6153f187c1918f6e2398aa6d8c20fd26032`  
`git commit -a -m "The previous commit broke the application. Reverting."`  
`git push origin master`  
## [Implementing a backup plan](https://www.google.com "Implementing a backup plan")  
`URDATE=$(date +%m-%d-%Y)export $CURDATEsudo rsync -avb --delete --backup-dir=/backup/incremental/$CURDATE /src /target`  
`/backup/incremental/8-16-2018`  
## [Replacing failed RAID disks](https://www.google.com "Replacing failed RAID disks")    
`cat /proc/mdstat`  
`[UU]`  
`sudo hdparm -i /dev/sda`  
`sudo fdisk -l`  
`sudo sfdisk -d /dev/sda | sfdisk sudo /dev/sdb`  
`sudo fdisk -l`  
`sudo mdadm --manage /dev/md0 --add /dev/sdb1`  
`mdadm: added /dev/sdb1`  
`cat /proc/mdstat`  
## [Utilizing bootable recovery media](https://www.google.com "Utilizing bootable recovery media")    
`sudo add-apt-repository ppa:yannubuntu/boot-repair`  
`sudo apt update && apt install boot-repair`  
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