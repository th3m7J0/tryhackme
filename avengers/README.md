# Avengers

[link to the room](https://tryhackme.com/room/avengers)


## recon

nmap: `nmap -A -v -oN recon/nmap $ip`

gobuster: `gobuster -u http://$ip -w ~/Personal/tools/wordlists/dirbuster/directory-list-2.3-small.txt -t 20 -o recon/gobuster`