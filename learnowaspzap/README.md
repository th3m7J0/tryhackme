# LearnOwaspZap

[link to the room](https://tryhackme.com/room/learnowaspzap)


`export ip=10.10.32.7`

## Recon

### nmap 
command: `nmap -sC -sV -vv -T5 -oN recon/nmap $ip`


### gobuster
command: `gobuster -u http://$ip/ -w ~/Personal/tools/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,zip,txt,md -t 20 -o recon/gobuster`



## links
- Desktop eManuel: https://www.zaproxy.org/docs/desktop/ui/
- OWASP ZAP Forums: https://groups.google.com/forum/#!forum/zaproxy-users 
- ZAP in Ten: https://www.alldaydevops.com/zap-in-ten

