##### Show info like number of containers, etc  

### $ `docker info`  

##### List all containers (Even if not running)
### $ `docker container ls -a`  

##### Get logs (Use name or ID)
### $ `docker container logs [NAME]`  

##### Stop all running containers
### $ `docker container stop $(docker ps -aq)`  

##### To remove a running container use force(-f)
### $ `docker container rm -f [ID]`  

##### Remove all containers
### $ `docker rm $(docker ps -aq)`  

##### Remove all images
### $ `docker rmi $(docker images -a -q)`  
  
##  $ [`docker run --name u1804 -dit -p 8080:80 ubuntu:18.04 //bin/bash`](https://stackoverflow.com/questions/39858121/how-can-i-resolve-the-error-oci-runtime-error-exec-no-such-file-or-directory-w "you might see this if you have installed Git for Windows with MSYS2 for example")
detached interactive terminal on port 8080 named u1804  

##### $`docker stop u1804`  
##### $`docker start u1804`  
### $`docker attach u1804`  
__u1804__ represents __containerID__  
### root@u1804:/# `ls -l`  
### root@u1804:/# `apt-get update`  
### root@u1804:/# `apt-get install -y curl`  
### root@u1804:/# `curl https://www.google.com`  
[![Mastering Ubuntu Server book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/B10288.png?raw=true "Mastering Ubuntu Server - Second Edition
By Jay LaCroix
May 2018
Get up-to-date with the finer points of Ubuntu Server using this comprehensive guide")](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560)
[![Mastering Ubuntu Server book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/V12701_Low.png?raw=true "Linux Administration Bootcamp: Go from Beginner to Advanced [ Video ]
By Jason Cannon
November 2018
Learn Red Hat Linux and CentOS: Use these in-demand skills to start a career as a Linux Server Admin or Linux Administrator!")](https://www.packtpub.com/mapt/video/application_development/9781789612189/87094/87095/the-linux-directory-structure)
##  [`Chapter 2. Managing Users`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/2/ch02lvl1sec23/creating-and-removing-users "Creating and removing users")
### root@u1804:/# `adduser jonDOE`  
### root@u1804:/# `cat /etc/shadow | grep root`  
`!` lockout login  
`x` encrypted password  
`*` any password?  
![preview screenshot](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/CaptureETCshadow.PNG?raw=true "Logo Title Text 1")  
### root@u1804:/# [`echo 'export PS1="[\u@\h \w]\$ "' >> ~/.bash_profile`](https://www.packtpub.com/mapt/video/application_development/9781789802610/79474/79509/customizing-the-shell-prompt "Customizing the Shell Prompt")
### root@u1804:/# [`nano ~/.bash_profile`](https://vitux.com/how-to-customize-ubuntu-bash-prompt/ "How to Customize your Ubuntu Terminal Prompt")
 
### root@u1804:/# `exit` 
 
##  [`Chapter 3. Storage Volumes`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 4. Networks`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 5. Packages`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 6. Processes`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 7. Services`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 8. Files`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 9. Databases`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
#  [`Chapter 10. Serving Web Content`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/10 "In this chapter, we'll take a look at Apache and NGINX, as well as securing it with SSL.")
### TTY# `code samples...`
[![Nginx HTTP Server book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/nginxHTTPserver.png?raw=true "
How Nginx and Apache benefit from each other")](https://www.packtpub.com/mapt/book/virtualization_and_cloud/9781788623551/7/ch07lvl1sec42/how-nginx-and-apache-benefit-from-each-other)
[![NGINX Cookbook cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/nginxCOOKbook.png?raw=true "
Since the mainline release (currently 1.11.19) has all of the latest features, you'll need to install it directly from the NGINX repositories. Thankfully, NGINX is kind enough to provide Red Hat Enterprise Linux (RHEL), CentOS, SUSE Linux Enterprise Server (SLES), Debian, and Ubuntu repositories, as well as OS X and Windows binaries.")](https://www.packtpub.com/mapt/book/networking_and_servers/9781786466174/1/01lvl1sec10/a-quick-installation-guide)
##  [`Chapter 11. Shell Techniques`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 12. Virtualization`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 13. Containers`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### $`docker build -t ubuntu:1804 .`
[![Mastering Docker book cover](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/cover_DocMaster.png?raw=true "
Mastering Docker - Third Edition
By Russ McKendrick, Scott Gallagher
October 2018
Master Docker and leverage its power in your day-to-day workflow")](https://www.packtpub.com/mapt/book/virtualization_and_cloud/9781789616606/13/ch13lvl1sec113/docker-for-development)
[![Mastering DevOps video course](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/C08041_MockupCover_low.png?raw=true "
Dockerising your own App: Building Docker Image the Imperative Way")](https://www.schoolofdevops.net/courses/enrolled/254048)
##  [`Chapter 14. Networks`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 15. Securing`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 16. TroubleShooting`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
##  [`Chapter 17. Distasters`](https://www.packtpub.com/mapt/book/networking_and_servers/9781788997560/13/ch13lvl1sec136/automating-docker-image-creation-with-dockerfiles "Automating Docker image creation with Dockerfiles")
### TTY# `code samples...`
