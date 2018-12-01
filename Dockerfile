#
# Ubuntu 18.04 Dockerfile
# https://github.com/turtlewolfe/ubuntu1804
#

# Pull base image.
FROM ubuntu:18.04

# Install.
RUN apt update; apt dist-upgrade -y
RUN apt install -y apache2 vim-nox
RUN echo "/etc/init.d/apache2 start" >> /etc/bash.bashrc
                                    #u
                                    # # Add files.
                                    # ADD root/.bashrc /root/.bashrc
                                    # ADD root/.gitconfig /root/.gitconfig
                                    # ADD root/.scripts /root/.scripts

                                    # # Set environment variables.
                                    # ENV HOME /root

                                    # # Define working directory.
                                    # WORKDIR /root

                                    # # Define default command.
                                    # CMD ["bash"]