### I'm extending the [Automated Initial Server Setup from Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/automating-initial-server-setup-with-ubuntu-18-04) on Digital Ocean using the user-data insert to start a new server.
I've added the `time zone` and variables for `IP address` and `SSH port`  
I'm installing `Fail2Ban` & makign use of `PAM`  
I'd like to hide the `ip address` from __social media__
but not necessarily the `logs`, so where is this greeting line being set?
#### Logged in from IP Adress
![loginPAGEshowsIPA](https://user-images.githubusercontent.com/7327259/56312356-fa222b80-611d-11e9-86bc-a14b59efb9bb.PNG)
#### UFW `open SSH` gets version 6 by default
and I'd like to add version six `ip addresses` to `UFW`  

![portV6](https://user-images.githubusercontent.com/7327259/56312351-f9899500-611d-11e9-94f7-b2217b85691d.PNG)
#### UFW uncomplicated firewall
![securingUFW22222tcp](https://user-images.githubusercontent.com/7327259/56312354-fa222b80-611d-11e9-847c-3ca07e0f7dff.PNG)


```
#!/bin/bash
set -euo pipefail

########################
### SCRIPT VARIABLES ###
########################

# Name of the user to create and grant sudo privileges
USERNAME=jane_doe

# IP Address for accessing SSH
IP_ADDRESS=203.0.113.255

# Port for accessing SSH
SSH_PORT=22222

# Whether to copy root user's `authorized_keys` file to the new sudo user.
COPY_AUTHORIZED_KEYS_FROM_ROOT=true

# Additional public keys to add to the new sudo user
OTHER_PUBLIC_KEYS_TO_ADD=(
"ssh-rsa AAAAB..."
)

# set TimeZone
timedatectl set-timezone America/New_York

####################
### SCRIPT LOGIC ###
####################

# customize TTY prompt

# Add sudo user and grant privileges
useradd --create-home --shell "/bin/bash" --groups sudo "${USERNAME}"

# Check whether the root account has a real password set
encrypted_root_pw="$(grep root /etc/shadow | cut --delimiter=: --fields=2)"

if [ "${encrypted_root_pw}" != "*" ]; then
    # Transfer auto-generated root password to user if present
    # and lock the root account to password-based access
    echo "${USERNAME}:${encrypted_root_pw}" | chpasswd --encrypted
    passwd --lock root
else
    # Delete invalid password for user if using keys so that a new password
    # can be set without providing a previous value
    passwd --delete "${USERNAME}"
fi

# Expire the sudo user's password immediately to force a change
chage --lastday 0 "${USERNAME}"

# Create SSH directory for sudo user
home_directory="$(eval echo ~${USERNAME})"
mkdir --parents "${home_directory}/.ssh"

# Copy `authorized_keys` file from root if requested
if [ "${COPY_AUTHORIZED_KEYS_FROM_ROOT}" = true ]; then
    cp /root/.ssh/authorized_keys "${home_directory}/.ssh"
fi

# Add additional provided public keys
for pub_key in "${OTHER_PUBLIC_KEYS_TO_ADD[@]}"; do
    echo "${pub_key}" >> "${home_directory}/.ssh/authorized_keys"
done

# Adjust SSH configuration ownership and permissions
chmod 0700 "${home_directory}/.ssh"
chmod 0600 "${home_directory}/.ssh/authorized_keys"
chown --recursive "${USERNAME}":"${USERNAME}" "${home_directory}/.ssh"

# Chapter 2, Users
# install PAM (Pluggable Authentication Modules)
apt-get -y install libpam-cracklib
# module-type	control		module-path	arguments
echo 'password required pam_pwhistory.so remember=99 use_authok' >> /etc/pam.d/common-password
# difference ( at least three characters have to be different )
# difok=3
# obscure ( prevents simple passwords from being used )
# obscure

# Chapter 15, Securing SSH
groupadd sshusers
usermod -aG sshusers "${USERNAME}"
echo "Port ${SSH_PORT}" >> /etc/ssh/sshd_config
echo 'Protocol 2' >> /etc/ssh/sshd_config
echo 'AllowGroups sudo sshusers' >> /etc/ssh/sshd_config
# sed -i "s/#Port 22/Port ${SSH_PORT}/" /etc/ssh/sshd_config
# Disable root SSH login with password (& key)
sed --in-place 's/^PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
if sshd -t -q; then
    systemctl restart sshd
fi

# Add exception for SSH and then enable UFW firewall
# ufw allow from "${IP_ADDRESS}" to any port "${SSH_PORT}"/tcp
# ufw allow from "${IP_ADDRESS}" to any port "${SSH_PORT}"
ufw allow proto tcp from "${IP_ADDRESS}" to any port "${SSH_PORT}"
# ufw allow 80
# ufw allow 443
# ufw allow OpenSSH
ufw --force enable

# Chapter 15, Fail2Ban
apt-get -y install fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sed -i "s/#ignoreip = 127.0.0.1\/8 ::1/ignoreip = 127.0.0.1\/8 ::1 ${IP_ADDRESS}/" /etc/fail2ban/jail.local
# sed -i 's/bantime  = 10m/bantime  = 10m/' /etc/fail2ban/jail.local
sed -i 's/maxretry = 5/maxretry = 7/' /etc/fail2ban/jail.local
# sed -i 's/…/port    = ssh/' /etc/fail2ban/jail.local
# sed -i 's/…/port    = "${SSH_PORT}"/' /etc/fail2ban/jail.local
# sed -i 's/…/enabled = true/' /etc/fail2ban/jail.local
# sed -i "s/$match/$match\n$insert/" $file
sed -i "s/logpath = %(sshd_log)s/logpath = %(sshd_log)s\nenabled = true/" /etc/fail2ban/jail.local
# .....................................................
# sed -i 's/…/enabled = true/' /etc/fail2ban/jail.local
# sed -i 's/…/enabled = true/' /etc/fail2ban/jail.local
# sed -i 's/…/…/' /etc/fail2ban/jail.local
# sed -i 's/…/…/' /etc/fail2ban/jail.local

# AppArmor
# sed -i 's/…/…/' /etc/dir/file.txt

# MariaDB over or MySQL
# sed -i 's/…/…/' /etc/dir/file.txt

# NginX
# sed -i 's/…/…/' /etc/dir/file.txt

# Apache
# sed -i 's/…/…/' /etc/dir/file.txt

# Update, Upgrade & AutoRemove
apt-get update
apt-get -y upgrade
apt-get -y autoremove

#Reboot
# shutdown -r now
# reboot
```


