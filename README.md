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
`sudo useradd -d /home/jdoe -m jdoe`  
`ls -l /home`  
`nano /usr/sbin/adduser`  
`sudo userdel dscully`  
`ls -l /home`  
`sudo mv /home/dscully /store/file_archive`  
`sudo mkdir -p /store/file_archive`  
`sudo userdel -r dscully`  
`sudo rm -r /home/dscully`  
__sudo rm -r /__ _( space )_ __home/dscully__
## [Understanding the `/etc/passwd` & `/etc/shadow files`](https://www.google.com "Understanding the `/etc/passwd` & `/etc/shadow files`")  
`cat /etc/passwd `  
`sudo cat /etc/shadow`  
`Example /etc...`  
  
root@u1804:/# `adduser jane_doe`  
root@u1804:/# `cat /etc/shadow | grep root`  
__any password ?__  
`user: * :password changed:7days between changes:max:warning:disable:8thN:9?`  
...  
__encrypted password__  
`user: x :password changed:7days between changes:max:warning:disable:8thN:9?`  
...  
__lockout login__  
`user: ! :password changed:7days between changes:max:warning:disable:8thN:9?`  
...  
__add a user to `sudo` as a secondary group__  
jane_doe@u1804:\~$ `sudo usermod -aG sudo jane_doe`  
...  
__switch user__  
root@u1804:/# `su - jane_doe`
...  
__list all files in long form__  
jane_doe@u1804:\~$ `ls -al`  
...  
__add user group__  
jane_doe@u1804:\~$ `sudo groupadd admins`  
...  
__modify secondary group to include user__  
jane_doe@u1804:\~$ `sudo usermod -aG admins jane_doe`  
...  
__lock password__ - will not affect SSH (see ch 15)   
jane_doe@u1804:\~$ `sudo passwd -l root`  
jane_doe@u1804:\~$ `sudo cat /etc/shadow | grep root`  
root@u1804:/# `su - root`  
...  
__unlock password__  
jane_doe@u1804:\~$ `sudo passwd -u <username>`  
...  
__/etc/shadow__  
jane_doe@u1804:\~$ `sudo chage -l root`  
...  
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
...  
__Pluggable Authentication Module (PAM):__  
jane_doe@u1804:\~$ `sudo apt install libpam-cracklib`  
...  
__install Nano__  
jane_doe@u1804:\~$ `sudo apt install nano`  
...  
__configure password requirements in PAM__  
jane_doe@u1804:\~$ `sudo nano /etc/pam.d/common-password`  
__!__ (use a 2nd TTY to prevent lock out)  
...  
## [Managing groups](https://www.google.com "Managing groups")  
`ls -l`  
`-rw-r--r-- 1 root bind  490 2013-04-15 22:05 named.conf`  
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

...  
__add a user to `sudo` as a secondary group__  
jane_doe@u1804:\~$ `sudo usermod -aG sudo <username>`  
jane_doe@u1804:\~$ `sudo usermod -aG sudo jane_doe`  
may use another group (such as `wheel`)  
...  
__configure `sudo` group or user access__  
jane_doe@u1804:\~$ `sudo visudo`  
checks to make sure your changes follow the correct syntax `/etc/sudoers`
`jane_doe    ALL=(ALL:ALL) ALL`  
`charlie    ubuntu-server=(jane_doe:admins) /usr/bin/apt,/usr/sbin/reboot,/usr/sbin/shutdown`  
(root or username)    TTY IP=(USER:GROUP) COMMANDS  
__!__ It's always a good idea to use full paths when editing `sudo` command permissions  
...  
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
...  
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
...  
__nano `save changes`__  
`Ctrl + W`  
__nano `exit editor`__  
`Ctrl + X`  
...  
__configure `visudo`__ _default `Editor` to_ __`vim`__  
jane_doe@u1804:\~$ `sudo EDITOR=vim visudo`  
__`etc / sudoers`__  
`Object type  :  User  :  Group  :  Other's`  
` -dl  :  rwx :  rwx  :  rwx`  
...  
__`sudo group`__  
`%sudo   ALL=(ALL:ALL) ALL `  
__`user`__  
`root    ALL=(ALL:ALL) ALL `  
...  
`TTY  :  User  :  Group  :  Command`   
_note that it's best to use full paths_  
charlie could run these : __`commands`__  
`charlie    ALL=(ALL:ALL) /usr/sbin/reboot,/usr/sbin/shutdown`  
_but not others_  
`Sorry, user charlie is not allowed to execute '/usr/bin/apt install tmux' as root on ubuntu-server. `  
_limited to certain_ __`terminal`__   
`charlie    ubuntu-server=(ALL:ALL) /usr/bin/apt`  
_restrict_ __`user`__ _&_ __`group`__ _options_    
`charlie    ubuntu-server= /usr/bin/apt`  
_restrict to certain_ __`( user : group )`__  
`charlie    ubuntu-server=(dscully:admins) ALL`  

## [Setting permissions on files and directories](https://www.google.com "Setting permissions on files and directories")    
`ls -l`  
```
-rw-rw-rw- 1 doctor doctor   5          Jan 11   12:52 welcome 
-rw-r--r--    1 root     root       665       Feb 19   2014 profile 
-rwxr-xr-x 1 dalek   dalek      35125  Nov  7    2013 exterminate
```  
`-rw-rw-rw- 1 doctor doctor    5 Jan 11 12:52 welcome`  
`-rwxr-xr-x 1 dalek dalek      35125 Nov  7  2013 exterminate`  
```
-rw-r--r-- 1   sue   accounting      35125  Nov  7  2013 budget.txt 
drwxr-x--- 1   bob   sales           35125  Nov  7  2013 annual_projects
```  
`chmod o-r budget.txt`  
`chmod o-r /home/sue/budget.txt`  
`chmod 770 -R mydir`  
```  
`ls -l`  
`-rw-rw-rw- 1 doctor doctor    5 Jan 11 12:52 welcome`  
`-rwxr-xr-x 1 dalek dalek      35125 Nov  7  2013 exterminate`  
```
`sudo chown sue myfile.txt`  
`sudo chown -R sue mydir`  
`sudo chown sue:sales myfile.txt`  
`# sudo chown sales myfile.txt`  
__remove `read` from file permissions for `other's`__  
jane_doe@u1804:\~$ `sudo chmod o-r /home/sue/budget.txt`  
...  
__octal permission patterns__  
jane_doe@u1804:\~$ `chmod 600 filename.txt` ( same as ) `chmod -rw------- filename.txt`  
jane_doe@u1804:\~$ `chmod 740 filename.txt` ( same as ) `chmod -rwxr----- filename.txt`  
jane_doe@u1804:\~$ `chmod 770 filename.txt` ( same as ) `chmod -rwxrwx--- filename.txt`  
jane_doe@u1804:\~$ `chmod 770 -R dir_name` (recursive directories)  
...  
__change ownership of directory recursively__  
jane_doe@u1804:\~$ `sudo chown -R jane_doe:admins dir_name`  
...  
__change group ownership__  
jane_doe@u1804:\~$ `sudo chgrp sales myfile.txt`  

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

#  [`customize TTY prompt`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/2/ch02lvl1sec23/creating-and-removing-users "Creating and removing users")

### root@u1804:/# [`echo 'export PS1="[\u@\h \w]\$ "' >> ~/.bash_profile`](https://www.packtpub.com/mapt/video/application_development/9781789802610/79474/79509/customizing-the-shell-prompt "Customizing the Shell Prompt")

### root@u1804:/# [`nano ~/.bash_profile`](https://vitux.com/how-to-customize-ubuntu-bash-prompt/ "How to Customize your Ubuntu Terminal Prompt")
 
### root@u1804:/# `exit` 
 
#  [`Chapter 3. Storage Volumes`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "managing storage is more than just adding disks, Logical Volume Manager (LVM)")

`/`  
The beginning of the __filesystem__, all directories are underneath this

`/home`  
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
__hard link file1 to file3__  
jane_doe@u1804:~$ `ln file1 file3`  

__list inode number__  
jane_doe@u1804:~$ `ls -i`  

__remove file3__  
jane_doe@u1804:~$ `rm file3`  

__symlink file1 to file3__  
jane_doe@u1804:~$ `ln -s file1 file3`  

__disk filesystem__ in __human readable__  
jane_doe@u1804:~$ `df -h`  
will show available `cyber` space  

__disk filesystem inodes__  
jane_doe@u1804:~$ `df -i`  
shows available `inodes`  

__disk usage__  
jane_doe@u1804:~$ `du -hsc *`  
will show `disk usage` in `human` readable, `summary` of `current` working directory total  

_install_ __NCurses Disk Usage__  
jane_doe@u1804:~$ `sudo apt install ncdu`  

__disk usage__  
jane_doe@u1804:~$ `ncu -x`  
`-x` limit to the current filesystem  
_during interface;_ `d` would delete 

__disk functions__ _-list_ 
jane_doe@u1804:~$ `sudo fdisk -l`  
utility for `listing`, `creating` or `deleting` disk partions 

__follow display messages__  
jane_doe@u1804:~$ `dmesg --follow`  
When done, press `Ctrl + C` on your keyboard: 

__list block devices__  
jane_doe@u1804:~$ `lsblk`  
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

__disk function__ _..( utility again )_   
jane_doe@u1804:\~$ `sudo fdisk -l`  
_review added disk partion_  
__( _or to try again_ )__  
jane_doe@u1804:\~$ `sudo fdisk`  
`g` _new __GPT__ layout_  
`o` _new MBR layout_  

__disk format__  _(partition `ext4`)_  
jane_doe@u1804:\~$ `sudo mkfs.ext4 /dev/sdb1` _..(volume path)_  
_or_  
__disk format__  _(partition `xfs`)_  
jane_doe@u1804:\~$ `sudo mfs.xfs /dev/sdb1` _..(volume path)_  

__disk function__  _(review)_   
jane_doe@u1804:\~$ `sudo fdisk -l`  
__make directory__  
jane_doe@u1804:\~$ `sudo mkdir /mnt/vol1` _..(volume path)_  
__mount device to directory__  
jane_doe@u1804:\~$ `sudo mount /dev/sdb1 /mnt/vol1` _..(volume path)_  
__mount device to directory with `type` option__  _..(usually un-necessary)_  
jane_doe@u1804:\~$ `sudo mount /dev/sdb1 -t ext4 /mnt/vol1` _..(volume path)_  
...  
__unmount device__  
jane_doe@u1804:\~$ `sudo umount /mnt/vol1`  
__disk filesystem__ in __human readable__  _..(confirm unmounted)_  
jane_doe@u1804:\~$ `df -h`  

__block identification, UUID__  _..( __/__ etc __/__ f stab )_  
jane_doe@u1804:\~$ `blkid`  
...  
__make new directory for extra storage__  _..( __/__ mnt __/__ extra_storage )_  
jane_doe@u1804:\~$ `sudo mkdir /mnt/extra_storage`  
...  
__edit `/etc/fstab`__  
jane_doe@u1804:\~$ `sudo nano /etc/fstab`  
...  
`UUID=e51bcc9e-45dd-45c7 /mnt/extra_storage  ext4  rw,auto 0 0`  
...  
__mounting volume (__ with __`auto` )__  
jane_doe@u1804:\~$ `sudo mount -a`  
...  
`UUID=e51bcc9e-45dd-45c7 /mnt/ext_disk  ext4  rw,noauto 0 0`  
...  
__mounting an external disk__ (with __`noauto`__ ) perhaps per back-up  
jane_doe@u1804:\~$ `sudo mount /mnt/ext_disk`  
...  
__list everything that is mounted__  
jane_doe@u1804:\~$ `mount`  

## SWAP-file
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
__swap volume__ (  with __`auto`__ )  
jane_doe@u1804:\~$ `sudo swapon -a`  
don't forget to edit `fstab`  
...  
`/swapfile   none   swap   sw   0 0`  
...  
__check memory__  
jane_doe@u1804:\~$ `free -m`  
...  
__file allocate__  
jane_doe@u1804:\~$ `sudo fallocate -l 4G /swapfile`  
_creates a 4 gigabyte file_  
...  
__make swap__  
jane_doe@u1804:\~$ `sudo mkswap /swapfile`  
_makes it the swap file_  
...  
_don't forget to edit_  __/__ `etc` __/__ `f stab`  
`/swapfile   none   swap   sw   0 0`
__Activate SwapFile__ (__ with __`auto` )__  
jane_doe@u1804:\~$ `sudo swapon -a`  

## LVM
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
_check if_ __lvm2__  _is installed_  
jane_doe@u1804:\~$ `dpkg -s lvm2 | grep status`  
_should return_ `install ok installed` _if it is installed already_  
...  
__install lvm2__  _( Logical Volume Management )_  
jane_doe@u1804:\~$ `sudo apt install lvm2`  
...  
__disk functions__  
jane_doe@u1804:\~$ `sudo fdisk -l`  
_should list partions_  
...  
__pvcreate__ _( create physical volumes )_  
jane_doe@u1804:\~$  
```  
    sudo pvcreate /dev/sdb  
    sudo pvcreate /dev/sdc  
    sudo pvcreate /dev/sdd  
    sudo pvcreate /dev/sde  
```   
__display Physical Volumes__  
jane_doe@u1804:\~$ `sudo pvdisplay`  
...  
__create Volume Group__  
jane_doe@u1804:\~$ `sudo vgcreate vg-test /dev/sdb1` _..(volume path)_   
...  
__display Volume Groups__  
jane_doe@u1804:\~$ `vgdisplay`  
...  
__create Logical Volume__  `-n` _name_ , `-L` _size ?_ , _group name_ ,  
jane_doe@u1804:\~$ `sudo lvcreate -n myvol1 -L 10g vg-test`  
...  
__display Logical Volumes__  
jane_doe@u1804:\~$ `sudo lvdisplay`  
...  
__make file system__ , _( format logical volume )_   
jane_doe@u1804:\~$ `sudo mkfs.ext4 /dev/vg-test/myvol1`  
...  
__mount device__ _to_ __directory__  
jane_doe@u1804:\~$ `sudo mount /dev/vg-test/myvol1 /mnt/lvm/myvol1`  
...  
__disk filesystem__ in __human readable__  _..( confirm volume is mounted & it's size )_  
jane_doe@u1804:\~$ `df -h`  
...  
__Extend Logical Volume__  _( use the remaining space )_  
jane_doe@u1804:\~$ `sudo lvextend -n /dev/vg-test/myvol1 -l +100%FREE`  
  _( should return )_  
`Logical volume vg-test/myvol1 successfully resized.`  
...  
__disk filesystem__ in __human readable__  _..( confirm, still need to resize file system )_  
jane_doe@u1804:\~$ `df -h`  
...  
__Resize File-System__  _..( ext4 )_  
jane_doe@u1804:\~$ `sudo resize2fs /dev/mapper/vg--test-myvol1`  
_( should return )_  
`The filesystem on /dev/mapper/vg--test-myvol1 is now 5241856 (4k) blocks long.`  
...  
__disk filesystem__ in __human readable__  _..( added space now usable )_  
jane_doe@u1804:\~$ `df -h`  
...  
__Extend Volume Group__  _( add additonal volumes to group )_  
jane_doe@u1804:\~$
```
sudo vgextend vg-test /dev/sdc
sudo vgextend vg-test /dev/sdd
sudo vgextend vg-test /dev/sde
```  
_( should return )_  
`Volume group "vg-test" successfully extended`  
...  
__display Physical Volumes__ _( confirm additional physical volumes attached )_  
jane_doe@u1804:\~$ `sudo pvdisplay`  
...  
__Extend Logical Volume__ _( extend logical volume 10 gigabytes )_  
jane_doe@u1804:\~$ `sudo lvextend -L+10g /dev/vg-test/myvol1`  
...  
__resize file-system__ _( make free space available to filesystem )_  
jane_doe@u1804:\~$ `sudo resize2fs /dev/vg-test/myvol1`  

__create Logical Volume__  `-s` _snapshot_ , `-n` _name_ , `-L` _maximu size ?_ , _group name_ __/__ _volume_ ,  
jane_doe@u1804:\~$ `sudo lvcreate -s -n mysnapshot -L 4g vg-test/myvol1`  
_( should return )_  
 `Logical volume "mysnapshot" created.`  
...  
__logical volume size__ _( monitor it's size )_  
jane_doe@u1804:\~$ `lvs`  
...  
__logical volume convert__  
jane_doe@u1804:\~$ `sudo lvconvert --merge vg-test/mysnapshot`  
_( should return )_
```
Merging of volume mysnapshot started.
myvol1: Merged: 100.0%`
```    
...  
__logical volume size__ _( recheck )_  
jane_doe@u1804:\~$ `lvs`  
...  
__remove logical volume__  
jane_doe@u1804:\~$ `sudo lvremove vg-test/myvol1`  
...  
__remove logical group__  
jane_doe@u1804:\~$ `sudo vgremove vg-test`  

## RAID - Redundant Array of Inexpensive Disks
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
__disk functions__ _-list_  
jane_doe@u1804:\~$ `sudo fdisk -l`  
_( one is hardware, multilple is software )_  
...  
__Multiple Disk And Disk Administration__  
jane_doe@u1804:\~$ `mdadm`  

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
## Host Name
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
__hostname__  
jane_doe@u1804:\~$ `hostname`    
...  
__Host Name Control__ _- set host name_  
jane_doe@u1804:\~$ `sudo hostnamectl set-hostname dev2.mynetwork.org`  
...  
__concatenate__ __/__ `etc` __/__ `hostname` )_  
jane_doe@u1804:\~$ `cat /etc/hostname`  
...  
__edit__ __/__ `etc` __/__ `hostname` )   _- ( previous to 15.04, edit maunually )_  
jane_doe@u1804:\~$ `edit /etc/hostname`  
...  
`unable to resolve host dev.mynetwork.org`  
...  
__edit__ __/__ `etc` __/__ `hosts` )   _- ( edit maunually )_  
jane_doe@u1804:\~$ `edit /etc/hosts`  

## managing Network Interfaces
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
__currently assigned IP address__  
jane_doe@u1804:\~$ `ip addr show`  
_( or shortened to )_  
jane_doe@u1804:\~$ `ip a`    
...  
__state of interface__ _( toggling up & down )_  
jane_doe@u1804:\~$ 
```
sudo ip link set enp0s3 down 
sudo ip link set enp0s3 up
```  
_older systems would _
__edit__ __/__ `etc` __/__ `udev` __/__ `rules.d` __/__ `70-persistent-net-rules`  
jane_doe@u1804:\~$ `cat /etc/udev/rules.d/70-persistent-net-rules`  
...  
`en` _- Ethernet_  
`wl` _- Wireless_  
`p` _- Bus Number_  
`s` _- Slot_  
`enp0s3` _( wired network, first bus in PCI slot 3 )_  
...  
~~__InterFace Configuration__  
jane_doe@u1804:\~$ `ifconfig`  
_( or )_ jane_doe@u1804:\~$ `/sbin/ifconfig`  
_( deprecated, replace with `ip` )_~~   
...  
__Internet Protocol__  
jane_doe@u1804:\~$ `ip`  
_( iproute2 replaces net-tools )_  
...  
__Interface Down__  
jane_doe@u1804:\~$ `sudo ifconfig enp0s3 down`  
_( ~~iproute2 replaces~~ net-tools )_  
...  
__Interface Up__  
jane_doe@u1804:\~$ `sudo ifconfig enp0s3 up`  
_( ~~iproute2 replaces~~ net-tools )_  
...  

## Assigning static IP addresses
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
__concatenate__ __/__ `etc` __/__ `netplan` )  
jane_doe@u1804:\~$ `cat /etc/netplan`  
_( something.yaml )_
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
jane_doe@u1804:\~$ `sudo netplan apply`  
  
__legacy variant__  _( basically, any version of Ubuntu older than 17.10 )_  
__concatenate__ __/__ `etc` __/__ `network`  __/__ `interfaces` )  
jane_doe@u1804:\~$ `cat /network/interfaces`  
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
jane_doe@u1804:\~$ `sudo systemctl restart networking.service`  
_( legacy variant , before systemD )_  
jane_doe@u1804:\~$ `sudo /etc/init.d/networking restart`  

__install tmux__  - _terminal multiplexer_  
jane_doe@u1804:\~$ `sudo apt install tmux`  
_( activate )_  
jane_doe@u1804:\~$ `tmux`  
_( demo )_  
jane_doe@u1804:\~$ `top`  
`Ctrl + B`  
`D` _( should exit )_  
...  
__reattach__  - _terminal multiplexer_  
jane_doe@u1804:\~$ `tmux a`  
...  
__!__ _use_ `tmux` _before_ ___either___ `restarting` _technique_  
...  
_show_ __IP addresses__  
jane_doe@u1804:\~$ `ip a`  

## NetworkManager
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
___NetworkManager___ _is a utility for managing network connectivity on your server, though it's largely been replaced with_ ___Netplan___.  

## Linux name resolution
__concatenate__ __/__ `etc` __/__ `nsswitch.conf` )    
`hosts:          files dns`  
...  
__concatenate__ __/__ `etc` __/__ `hosts` )    
`10.10.96.124 minecraftserver`  
...  
_On legacy __Ubuntu__ servers , there was a file ,_ __/__ `etc` __/__ `resolv.conf`  
jane_doe@u1804:\~$ `cat /network/resolv.conf`  
...  
__DNS nameservers__ _that the server is currently pointing to_  
jane_doe@u1804:\~$ `systemd-resolve --status |grep DNS\ Servers`  

## OpenSSH  
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
_( confirm_ __SSH Daemon__  _installation )_  
jane_doe@u1804:\~$ `which sshd`  
_( should return )_ 
`/usr/sbin/sshd`  
...  
__install OpenSSH-Server__  
jane_doe@u1804:\~$ `sudo apt install openssh-server`  
...  
_( confirm_ __SSH Client__  _installation )_  
jane_doe@u1804:\~$ `which ssh`  
_( should return )_ 
`/usr/sbin/ssh`  
...  
__install OpenSSH-Client__  
jane_doe@u1804:\~$ `sudo apt install openssh-client`  
...  
__SSH__ _status_  
jane_doe@u1804:\~$ `systemctl status ssh`  
...  
__SSH__ _start_  
jane_doe@u1804:\~$ `sudo systemctl start ssh`  
...  
__SSH__ _enable_  
jane_doe@u1804:\~$ `sudo systemctl enable ssh`  
...  
__legacy variant__  _( 14.04 & 12.04 )_  
jane_doe@u1804:\~$ `sudo service ssh start`  
jane_doe@u1804:\~$ `sudo update-rc.d ssh defaults`  
...  
__listening ports ,__ _restrict output to SSH_  
jane_doe@u1804:\~$ `sudo netstat -tulpn |grep ssh`  
...  
__SSH__ _connect via_  __IP address__  
jane_doe@u1804:\~$ `ssh 10.10.96.10`  
...  
__SSH__ _connect_ __user @__ _, via_  __IP address__  
jane_doe@u1804:\~$ `ssh fmulder@10.10.96.10`  
...  
__SSH__ _, port , user @ , IP address_  
jane_doe@u1804:\~$ `ssh -p 2242 fmulder@10.10.96.10`  
...  
__exit__  
jane_doe@u1804:\~$ `exit`  
_or_ __`Ctrl+D`__  _, especially if you have processes to leave running in the background_

## SSH key management
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
__Generate SSH Key__  
jane_doe@u1804:\~$ `ssh-keygen`  
_( default location )_ 
`/home/<user>/.ssh`  
_( passphrase , optional )_  
...  
__id_rsa__ _&_ __id_rsa.pub__  
jane_doe@u1804:\~$ `ls -l /home/<user>/.ssh`  
jane_doe@u1804:\~$ `ls -l /home/jane_doe/.ssh`  
...  
__SSH__ _transmit __public__ key to a target server,_  
jane_doe@u1804:\~$ `ssh-copy-id -i ~/.ssh/id_rsa.pub unicorn`  
_( default location )_  
`~/.ssh/authorized_keys`  
...  
_start_ __SSH__ _agent_  
jane_doe@u1804:\~$ `eval $(ssh-agent)`  
...  
__unlock key__  _( via agent )_  
jane_doe@u1804:\~$ `ssh-add ~/.ssh/id_rsa`  
...  
__change pass-phrase__  
jane_doe@u1804:\~$ `ssh-keygen -p`  
`Enter` _accepts default file_ `id_rsa`

## simplifying SSH connections with a `config file
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
__edit__ __/__ `home` __/__ `<user>` __/__ `.ssh` __/__ `config` )    
jane_doe@u1804:\~$ `nano /home/jane_doe/.ssh/config`  
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
jane_doe@u1804:\~$ `ssh nagios`  
 ( same as.. )_  
jane_doe@u1804:\~$ `ssh -p 2222 nagiosuser@nagios.local.lan`  

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

#  [`Chapter 5. Packages`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## package management  
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
## hardware enablement updates  
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
## Debian vs Snap   
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
## Installing & removing software  
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
## Searching for packages  
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
## managing repositories  
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
## Backing up & restoring Debian packages  
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
## Cleaning up orphaned apt packages  
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
## Making use of Aptitude  
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
## package management  
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
## package management  
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

#  [`Chapter 6. Processes`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
## Monitor & Controll Processes  
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
## `PS` Command  
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
## Managing jobs  
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
## misbehaving processes  
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
## htop  
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
## system processes  
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
## Monitoring memory usage  
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
## scheduling Tasks with Cron  
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
## load average  
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
## Setting Up Network Services  
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
## Planning an IP address scheme  
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
## Serving IP addresses with isc-dhcp-server  
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
## Setting up DNS with bind  
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
## Creating a secondary (slave) DNS server  
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
## Setting up an internet gateway  
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
## Keeping your clock in sync with NTP  
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
## Sharing & Transferring Files  
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
## File server considerations  
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
## Sharing files with Windows users via Samba  
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
## Setting up NFS shares  
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
## Transferring files with `Rsync`  
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
## Transferring files with `SCP`  
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
## Mounting remote directories with SSHFS  
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
## DataBase Management  
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
## Preparations for setting up a database server  
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
## Installing MariaDB  
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
## MariaDB configuration  
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
## Managing MariaDB databases  
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
## Setting up a slave database server  
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
## Installing and configuring Apache  
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
## Installing additional Apache modules  
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
## Securing Apache with SSL  
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
## Installing and configuring NGINX  
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
## Setting up failover with keepalived  
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
## Setting up and configuring Nextcloud    
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
## Learning Advanced Shell Techniques  
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
## Understanding the Linux shell  
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
## Bash history  
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
## some useful command-line tricks  
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
## Redirecting output  
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
## Understanding variables  
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
## Writing simple scripts  
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
## Putting it all together: Writing an rsync backup script    
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
## Chapter 12. Virtualization  
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
## Setting up a virtual machine server  
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
## Creating virtual machines  
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
## Bridging the virtual machine network  
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
## Simplifying virtual machine creation with cloning  
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
## Managing virtual machines via the command line    
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
## Chapter 13. Running Containers  
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
## What is containerization?  
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
## Understanding the differences between Docker and LXD  
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
## Installing Docker  
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
## Managing Docker containers  
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
## Automating Docker image creation with Dockerfiles  
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
## Managing LXD containers  
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
## Automating Server Configuration with Ansible  
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
## Understanding the need for configuration management  
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
## Why Ansible?  
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
## Creating a Git repository  
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
## Getting started with Ansible  
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
## Making your servers do your bidding  
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
## Putting it all together – Automating web server deployment  
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
## Using Ansible's pull method  
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
## Chapter 15. Securing Your Server  
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
## Lowering your attack surface  
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
## Understanding and responding to CVEs  
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
## Installing security updates  
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
## Automatically installing patches with the Canonical Livepatch service  
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
## Monitoring Ubuntu servers with Canonical's Landscape service  
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
## Securing OpenSSH  
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
## Installing and configuring Fail2ban  
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
## MariaDB best practices for secure database servers  
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
## Setting up a firewall  
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
## Encrypting and decrypting disks with LUKS  
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
## Locking down sudo  
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
## Chapter 16. Troubleshooting Ubuntu Servers  
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
## Evaluating the problem space  
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
## Conducting a root cause analysis  
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
## Viewing system logs  
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
## Tracing network issues  
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
## Troubleshooting resource issues  
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
## Diagnosing defective RAM    
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
## Chapter 17. Preventing and Recovering from Disasters  
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
## Preventing disasters  
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
## Utilizing Git for configuration management  
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
## Implementing a backup plan  
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
## Replacing failed RAID disks  
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
## Utilizing bootable recovery media  
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