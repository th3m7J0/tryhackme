# windows 

[link to the room](https://tryhackme.com/room/intro2windows)

## folders
- PerfLogs
- Program Files
- Program Files (x86)
- Users
- Windows

## permissions
- Full control
- Modify
- Read & execute
- List folders content
- Read
- Write
- Special permissions

### icacls (check file permission):
I - permission inherited from the parent container
F - full access (full control)
M - Modify right/access
OI - object inherit
IO - inherit only
CI - container inherit
RX - read and execute
AD - append data (add subdirectories)
WD - write data and add files

## authentication

- SAML: SSO it define rules that allows users access web apps.
- OAUTH2.0: authorization token.
- OpennId connect: 
    - authentication standard built on top of OAuth 2.0
    - it uses simple JSON Web Tokens (JWT)


