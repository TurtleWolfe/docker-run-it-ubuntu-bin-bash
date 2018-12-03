##### Show info like number of containers, etc  

### $ `docker info`  

##### List all containers (Even if not running)
### $ `docker container ls -a`  

##### Stop all running containers
### $ `docker container stop $(docker ps -aq)`  

##### To remove a running container use force(-f)
### $ `docker container rm -f [ID]`  

##### Remove all containers
### $ `docker rm $(docker ps -aq)`  

##### Get logs (Use name or ID)
### $ `docker container logs [NAME]`  

##### Remove all images
### $ `docker rmi $(docker images -a -q)`  
  
##  $ [`docker run --name u1804 -dit -p 8080:80 ubuntu:18.04 //bin/bash`](https://stackoverflow.com/questions/39858121/how-can-i-resolve-the-error-oci-runtime-error-exec-no-such-file-or-directory-w "you might see this if you have installed Git for Windows with MSYS2 for example")
detached interactive terminal on port 8080 named u1804  

### $`docker stop u1804`  
### $`docker start u1804`  
### $`docker attach u1804`  
__u1804__ represents __containerID__  
### root@u1804:/# `ls -l`  
### root@u1804:/# `apt-get update`  
### root@u1804:/# `adduser jonDOE`  
### root@u1804:/# `cat /etc/shadow | grep root`  
`!` lockout login  
`x` encrypted password  
`*` any password? 
![alt text](https://github.com/TurtleWolf/docker-run-it-ubuntu-bin-bash/blob/master/captured_Images/CaptureETCshadow.PNG?raw=true "Logo Title Text 1")  
 
### root@u1804:/# `apt-get install -y curl`  
### root@u1804:/# `curl https://www.google.com`  
### root@u1804:/# `exit`  

### root@u1804:/# [`echo 'export PS1="[\u@\h \w]\$ "' >> ~/.bash_profile`](https://www.packtpub.com/mapt/video/application_development/9781789802610/79474/79509/customizing-the-shell-prompt "Customizing the Shell Prompt")
### root@u1804:/# [`nano ~/.bash_profile`](https://vitux.com/how-to-customize-ubuntu-bash-prompt/ "How to Customize your Ubuntu Terminal Prompt")
### $`docker build -t ubuntu:1804 .`
