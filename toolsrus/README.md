# Toolsrus

[link to the romm](https://tryhackme.com/room/toolsrus)


`export ip=10.10.98.228`

## recon

- nmap : `nmap -A -vv -T5 -oN recon/nmap $ip`
- gobuster `gobuster -u http://$ip -w ~/Personal/tools/wordlists/dirbuster/directory-list-2.3-small.txt -t 20 -x php,md,txt -o recon/gobuster` 
- gobuster (status code): `gobuster -u http://$ip -w ~/Personal/tools/wordlists/dirbuster/directory-list-2.3-small.txt -t 30 -o recon/gobuster.v0 -s 200,204,301,302,307,401,403`
- nikto: `docker run sullo/nikto -h $ip | tee recon/nikto`
- nikto (tomcat server): `docker run sullo/nikto -h $ip:1234 | tee recon/nikto.v2`
- nikto (tomcat server with basic auth): `docker run sullo/nikto -h $ip:1234 -id bob:bubbles | tee recon/nikto.v3`

## Loot

- from `/guidelines` we found: 
```
Hey bob, did you update that TomCat server?
```
- from hydra we have password of bob is `bubbles`


