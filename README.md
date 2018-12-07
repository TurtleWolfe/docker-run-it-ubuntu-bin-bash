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
  
# $ [`docker run --name u1804 -dit -p 8080:80 ubuntu:18.04 //bin/bash`](https://stackoverflow.com/questions/39858121/how-can-i-resolve-the-error-oci-runtime-error-exec-no-such-file-or-directory-w "you might see this if you have installed Git for Windows with MSYS2 for example")
detached interactive terminal on port 8080 named u1804  

$ `docker stop u1804`  
$ `docker start u1804`  
# $ `docker attach u1804`  
__u1804__ represents __containerID__  
root@u1804:/# `ls -l`  
root@u1804:/# `apt-get update`  
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
root@u1804:/# `adduser jane_doe`  
root@u1804:/# `cat /etc/shadow | grep root`  
![preview screenshot](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/CaptureETCshadow.PNG?raw=true "asterix is like a wilde carde?")  
__any password ?__  
`user: * :password changed:7days between changes:max:warning:disable`  

__encrypted password__  
`user: x :password changed:7days between changes:max:warning:disable`  

__lockout login__  
`user: ! :password changed:7days between changes:max:warning:disable`  

__switch user__  
root@u1804:/# `su - jane_doe`

__list all files in long form__  
jane_doe@u1804:~$ `ls -al`  

__add user group__  
jane_doe@u1804:~$ `sudo groupadd admins`  

__modify secondary group to include user__  
jane_doe@u1804:~$ `sudo usermod -aG admins jane_doe`  

__lock password__ - will not affect SSH (see ch 15)   
jane_doe@u1804:\~$ `sudo passwd -l root`  
jane_doe@u1804:\~$ `sudo cat /etc/shadow | grep root`  
root@u1804:/# `su - root`  

__unlock password__  
jane_doe@u1804:~$ `sudo passwd -u <username>`  

__/etc/shadow__  
jane_doe@u1804:~$ `sudo chage -l root`  

__force password change__ - should move this into `/etc/skel` __?__ , for default configuration (see ch 1)   
jane_doe@u1804:~$ `sudo chage -d 0 <username>`  

__Pluggable Authentication Module (PAM):__  
jane_doe@u1804:~$ `sudo apt install libpam-cracklib`  

__configure password requirements in PAM__  
jane_doe@u1804:~$ `sudo nano /etc/pam.d/common-password`  
__!__ (use a 2nd TTY to prevent lock out)  

__add a user to `sudo` as a secondary group__  
jane_doe@u1804:~$ `sudo usermod -aG sudo <username>`  
may use another group (such as `wheel`)  

__configure `sudo` group or user access__  
jane_doe@u1804:~$ `visudo`  
checks to make sure your changes follow the correct syntax `/etc/sudoers`  
`jane_doe    ALL=(ALL:ALL) ALL`  
`charlie    ubuntu-server=(jane_doe:admins) /usr/bin/apt,/usr/sbin/reboot,/usr/sbin/shutdown`  
(root or username)    TTY IP=(USER:GROUP) COMMANDS  
__!__ It's always a good idea to use full paths when editing `sudo` command permissions  

__configure `visudo` default editor to `vim`__  
jane_doe@u1804:~$ `sudo EDITOR=vim visudo`  

`Object type  :  User  :  Group  :  Other's`  
` -dl  :  rwx :  rwx  :  rwx`  

__remove `read` from file permissions for `other's`__  
jane_doe@u1804:~$ `sudo chmod o-r /home/sue/budget.txt`  

__octal permission patterns__  
jane_doe@u1804:\~$ `chmod 600 filename.txt` (would be the same as) `chmod -rw------- filename.txt`  
jane_doe@u1804:\~$ `chmod 740 filename.txt` (would be the same as) `chmod -rwxr----- filename.txt`  
jane_doe@u1804:\~$ `chmod 770 filename.txt` (would be the same as) `chmod -rwxrwx--- filename.txt`  
jane_doe@u1804:\~$ `chmod 770 -R dir_name` (recursive directories)  

__change ownership of directory recursively__  
jane_doe@u1804:\~$ `sudo chown -R sue:sales dir_name`  

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

__hard link file1 to file3__  
jane_doe@u1804:~$ `ln file1 file3`  

__list inode number__  
jane_doe@u1804:~$ `ls -i`  

__remove file3__  
jane_doe@u1804:~$ `rm file3`  

__symlink file1 to file3__  
jane_doe@u1804:~$ `ln -s file1 file3`  

__disk filesystem in human readable__  
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

__disk functions__  
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
__disk filesystem in human readable__  _..(confirm unmounted)_  
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

__swap volume (__ with __`auto` )__  
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
```
/swapfile   none   swap   sw   0 0
```  
__Activate SwapFile__ (__ with __`auto` )__  
jane_doe@u1804:\~$ `sudo swapon -a`  

_check if_ __lvm2__  _is installed_  
jane_doe@u1804:\~$ `dpkg -s lvm2 | grep status`  
_should return_ `install ok installed` _if it is installed already_  
...  
__install lvm2__  _( if it is not already installed )_  
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
__create Logical Volume__  
jane_doe@u1804:\~$ `sudo lvcreate -n myvol1 -L 10g vg-test`  
...  
__display Logical Volumes__  
jane_doe@u1804:\~$ `sudo lvdisplay`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo mkfs.ext4 /dev/vg-test/myvol1`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo mount /dev/vg-test/myvol1 /mnt/lvm/myvol1`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo lvextend -n /dev/vg-test/myvol1 -l +100%FREE`  
...  
__xxxChange This__  
`Logical volume vg-test/myvol1 successfully resized.`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `df -h`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo resize2fs /dev/mapper/vg--test-myvol1`  
...  
__xxxChange This__  
`The filesystem on /dev/mapper/vg--test-myvol1 is now 5241856 (4k) blocks long.`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ 
```
sudo vgextend vg-test /dev/sdc
sudo vgextend vg-test /dev/sdd
sudo vgextend vg-test /dev/sde
```  
__xxxChange This__  
`Volume group "vg-test" successfully extended`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo lvextend -L+10g /dev/vg-test/myvol1`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo resize2fs /dev/vg-test/myvol1`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo lvcreate -s -n mysnapshot -L 4g vg-test/myvol1`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `Logical volume "mysnapshot" created.`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo lvconvert --merge vg-test/mysnapshot`  

```
Merging of volume mysnapshot started.
myvol1: Merged: 100.0%`
```    
__xxxChange This__  
jane_doe@u1804:\~$ `sudo lvremove vg-test/myvol1`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo vgremove vg-test`  
...  
__xxxChange This__  
jane_doe@u1804:\~$ `sudo `  

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
### TTY# `code samples...`

#  [`Chapter 5. Packages`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 6. Processes`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 7. Services`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 8. Files`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 9. Databases`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 10. Serving Web Content`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/10 "In this chapter, we'll take a look at Apache and NGINX, as well as securing it with SSL.")
### TTY# `code samples...`
[![Nginx HTTP Server book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/nginxHTTPserver.png?raw=true "
How Nginx and Apache benefit from each other")](https://www.packtpub.com/mapt/book/virtualization_and_cloud/9781788623551/7/ch07lvl1sec42/how-nginx-and-apache-benefit-from-each-other)
[![NGINX Cookbook cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/nginxCOOKbook.png?raw=true "
Since the mainline release (currently 1.11.19) has all of the latest features, you'll need to install it directly from the NGINX repositories. Thankfully, NGINX is kind enough to provide Red Hat Enterprise Linux (RHEL), CentOS, SUSE Linux Enterprise Server (SLES), Debian, and Ubuntu repositories, as well as OS X and Windows binaries.")](https://www.packtpub.com/mapt/book/networking_and_servers/9781786466174/1/01lvl1sec10/a-quick-installation-guide)

#  [`Chapter 11. Shell Techniques`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
    
#  [`Chapter 12. Virtualization`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 13. Containers`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
"..so now we have a Dockerfile, what do we do with it? Turn it into an image of course!  
Use the docker build command from within the directory that contains the Dockerfile."
### $`docker build -t ubuntu:1804 .`
[![Mastering Docker book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/cover_DocMaster.png?raw=true "
Mastering Docker - Third Edition
By Russ McKendrick, Scott Gallagher
October 2018
Master Docker and leverage its power in your day-to-day workflow")](https://www.packtpub.com/mapt/book/virtualization_and_cloud/9781789616606/13/ch13lvl1sec113/docker-for-development)
[![Mastering DevOps video course](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/C08041_MockupCover_low.png?raw=true "
Dockerising your own App: Building Docker Image the Imperative Way")](https://www.schoolofdevops.net/courses/enrolled/254048)

#  [`Chapter 14. Networks`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 15. Securing`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 16. TroubleShooting`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`

#  [`Chapter 17. Distasters`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
