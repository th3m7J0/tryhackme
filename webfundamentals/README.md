# Web fundamentals vulnerabilities


## XXE
There are two types of XXE attacks: in-band and out-of-band (OOB-XXE).
1) An in-band XXE attack is the one in which the attacker can receive an immediate response to the XXE payload.

2) out-of-band XXE attacks (also called blind XXE), there is no immediate response from the web application and attacker has to reflect the output of their XXE payload to some other file or their own server.

## XSS
1. Escaping - Escape all user input. This means any data your application has received  is secure before rendering it for your end users. By escaping user input, key characters in the data received bu the web age will be prevented from being interpreter in any malicious way. For example, you could disallow the < and > characters from being rendered.

2. Validating Input - This is the process of ensuring your application is rendering the correct data and preventing malicious data from doing harm to your site, database and users. Input validation is disallowing certain characters from being submit in the first place.

3. Sanitising - Lastly, sanitizing data is a strong defence but should not be used to battle XSS attacks alone. Sanitizing user input is especially helpful on sites that allow HTML markup, changing the unacceptable user input into an acceptable format. For example you could sanitise the < character into the HTML entity &#60;

## SSRF

- port scanning http://localhost:[port]
- reading local files file://[file]

### Task
nmap : 
```
PORT     STATE SERVICE REASON  VERSION
22/tcp   open  ssh     syn-ack OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 68:72:c3:c0:53:b8:31:77:d7:d0:ad:dc:be:7d:cc:d2 (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCe3FuzlF3QOb2x2QFTXYf15QcO8JGJJAJnvv3OMDV7+lAuJh1tQXAuqyEG4UXMuRqyHeQQjYXcXNlGPKDKMV0WTN8GWv9R3dyg3FYsqIQyz/q6NAeGIlb2oUK6mpDj1oOQlMtl9/ORMP+Rx9yc7FKNDxIwwgNqKeCowk4X3Hgj5QvSFBinlHvzZW5LLneZSSngx7O+x1OAJlBDf9qSls6cW0qtpvJ9YsO5hKPLBOkR2BFRCDeLl3rTHgAH3ZhZa5l9dHRkEPh1POZKX6fo0L1QwF0eUcJBOm6bpjZLK0S109FmlAjWgx+T1JYRihRsOmZUWZEvHhKegK+d/1rRd7z7
|   256 7d:5b:c3:14:c7:86:df:90:f7:31:43:f8:b9:09:04:e4 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBG16kzU7fGAINJ0ZpRCFdOgoOxmkh3WiYb2OXcJChcZNyNNFe1PbkbebGlkag0EHn2WydcjCdXKyLaXDtFHcFt4=
|   256 40:d6:4a:57:98:40:5b:84:d8:06:8f:7d:49:fe:e7:3b (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDc22nrpKcLefmD318ZTPAg0FZoRNbxM5zfeSiVFcgKq
5000/tcp open  http    syn-ack Werkzeug httpd 0.14.1 (Python 3.6.9)
| http-methods: 
|_  Supported Methods: GET HEAD OPTIONS
|_http-server-header: Werkzeug/0.14.1 Python/3.6.9
|_http-title: Live demonstrations
8000/tcp open  http    syn-ack Werkzeug httpd 0.14.1 (Python 3.6.9)
| http-methods: 
|_  Supported Methods: HEAD
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```
exploiting ssrf: 
ports (22 3306 5000 8000 6783)


