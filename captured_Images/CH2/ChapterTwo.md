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
may use another group (such as `wheel`)  
...  
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
function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

PS1='${debian_chroot:+($debian_chroot)}\n\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[33m\]:\[\e[m\]\[\e[32;40m\]\@\[\e[m\]\[\e[33m\]:\[\e[m\]\[\e[35;40m\]\H\[\e[m\]\n\[\e[31m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[30m\]-\[\e[m\]\[\e[36m\]u1804\[\e[m\]\[\e[30m\]-\[\e[m\]\[\e[33;40m\]\w\[\e[m\]\[\e[30m\]:\[\e[m\]\[\e[36m\]\\$\[\e[m\]\[\e[30m\]:\[\e[m\] '
```
```
PS1='${debian_chroot:+($debian_chroot)}\n\[\e[32;40m\]\@\[\e[m\]\[\e[33m\]:\[\e[m\]\[\e[35;40m\]\H\[\e[m\]\n\[\e[31m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[30m\]-\[\e[m\]\[\e[36m\]u1804\[\e[m\]\[\e[30m\]-\[\e[m\]\[\e[33;40m\]\w\[\e[m\]\[\e[30m\]:\[\e[m\]\[\e[36m\]\\$\[\e[m\]\[\e[30m\]:\[\e[m\] '
```
```
export PS1="\n\[\e[32;40m\]\@\[\e[m\]\[\e[33m\]:\[\e[m\]\[\e[35;40m\]\H\[\e[m\]\n\[\e[31m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[30m\]-\[\e[m\]\[\e[36m\]u1804\[\e[m\]\[\e[30m\]-\[\e[m\]\[\e[33;40m\]\w\[\e[m\]\[\e[30m\]:\[\e[m\]\[\e[36m\]\\$\[\e[m\]\[\e[30m\]:\[\e[m\] "
```