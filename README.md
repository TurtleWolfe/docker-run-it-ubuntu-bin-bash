### Show info like number of containers, etc
```
$ docker info
```
##### List all containers (Even if not running)
```
$ docker container ls -a
```
##### Stop all running containers
```
$ docker container stop $(docker ps -aq)
```
##### To remove a running container use force(-f)
```
$ docker container rm -f [ID]
```
##### Remove all containers
```
$ docker rm $(docker ps -aq)
```
##### Get logs (Use name or ID)
```
$ docker container logs [NAME]
```
##### List the images we have pulled
```
$ docker image ls
```
##### Remove all images
```
$ docker rmi $(docker images -a -q)
```
###  $[`docker run --name u1804 -dit -p 8080:80 ubuntu:18.04 //bin/bash`](https://stackoverflow.com/questions/39858121/how-can-i-resolve-the-error-oci-runtime-error-exec-no-such-file-or-directory-w "you might see this if you have installed Git for Windows with MSYS2 for example")
detached interactive terminal on port 8080 named u1804  

### $`docker stop u1804`  
### $`docker start u1804`  
### $`docker attach u1804`  
__u1804__ represents __containerID__  
### root@u1804:/# `ls -l`  
### root@u1804:/# `exit`  
