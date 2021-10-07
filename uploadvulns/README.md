# UploadVulns

[link to the room](https://tryhackme.com/room/uploadvulns)

`export ip=10.10.215.99`


## Recon

### nmap
command: `nmap -A -p- -v -oN recon/nmap $ip`

### gobuster

command: `gobuster -u http://shell.uploadvulns.thm -w ~/Personal/tools/wordlists/dirbuster/directory-list-2.3-medium.txt -t 20`


## links
- https://en.wikipedia.org/wiki/List_of_file_signatures

## methodology

- Try re-uploading your originally accepted innocent file, and change  (extension/cotent type/magic number) of the file to be something that you would expect to be filtered. If the upload fails then you know that the server is using a (extension/cotent type/magic number)filter.


## TASK
### challenge

#### recon
- the backend is Express
- we found `/admin` to execute a module by gobuster.
- we can upload a js file in `POST /` with `"type":"image/jpeg"`

- `webshell.js` uploaded successfully.
- look where the file is uploaded

