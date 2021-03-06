# AttackingKerberos


[link to the room](https://tryhackme.com/room/attackingkerberos)

`export ip=10.10.196.48`


## recon 

nmap : `nmap -A -vv -T5 -oN recon/nmap $ip`

## what is kerberos ?
Kerberos is the default authentication service for Microsoft Windows domains. It is intended to be more "secure" than NTLM by using third party ticket authorization as well as stronger encryption.

## Common terminology

- TGT: A ticket-granting ticket is an authentication ticket used to request service tickets from the TGS for specific resources from the domain.
- KDC: The Key Distribution Center is a service for issuing TGTs and service tickets that consist of the Authentication Service and the Ticket Granting Service. AS+ TGS
- AS: The Authentication Service issues TGTs to be used by the TGS in the domain to request access to other machines and service tickets.
- TGS: The Ticket Granting Service takes the TGT and returns a ticket to a machine on the domain.
- SPN:  A Service Principal Name is an identifier given to a service instance to associate a service instance with a domain service account. Windows requires that services have a domain service account which is why a service needs an SPN set.
- KDC Long Term Secret Key (KDC LT Key) : he KDC key is based on the KRBTGT service account. It is used to encrypt the TGT and sign the PAC.
- Client Long Term Secret Key (Client LT Key) : The client key is based on the computer or service account. It is used to check the encrypted timestamp and encrypt the session key.
- Service Long Term Secret Key (Service LT Key) : The service key is based on the service account. It is used to encrypt the service portion of the service ticket and sign the PAC.
- Session Key : Issued by the KDC when a TGT is issued. The user will provide the session key to the KDC along with the TGT when requesting a service ticket.
- Privilege Attribute Certificate (PAC) : The PAC holds all of the user's relevant information, it is sent along with the TGT to the KDC to be signed by the Target LT Key and the KDC LT Key in order to validate the user.


## workflow
AS-REQ - 1.) The client requests an Authentication Ticket or Ticket Granting Ticket (TGT).

AS-REP - 2.) The Key Distribution Center verifies the client and sends back an encrypted TGT.

TGS-REQ - 3.) The client sends the encrypted TGT to the Ticket Granting Server (TGS) with the Service Principal Name (SPN) of the service the client wants to access.

TGS-REP - 4.) The Key Distribution Center (KDC) verifies the TGT of the user and that the user has access to the service, then sends a valid session key for the service to the client.

AP-REQ - 5.) The client requests the service and sends the valid session key to prove the user has access.

AP-REP - 6.) The service grants access
## Attack Privilege Requirements 
- Kerbrute Enumeration - No domain access required 
- Pass the Ticket - Access as a user to the domain required(if admin logged into my lower machine)
- Kerberoasting - Access as any user required (abuse service accounts with SPN)
- AS-REP Roasting - Access as any user required (abuse no pre auth)
- Golden Ticket - Full domain compromise (domain admin) required 
- Silver Ticket - Service hash required 
- Skeleton Key - Full domain compromise (domain admin) required

## resources
- https://medium.com/@t0pazg3m/pass-the-ticket-ptt-attack-in-mimikatz-and-a-gotcha-96a5805e257a
- https://ired.team/offensive-security-experiments/active-directory-kerberos-abuse/as-rep-roasting-using-rubeus-and-hashcat
- https://posts.specterops.io/kerberoasting-revisited-d434351bd4d1
- https://www.harmj0y.net/blog/redteaming/not-a-security-boundary-breaking-forest-trusts/
- https://www.varonis.com/blog/kerberos-authentication-explained/
- https://www.blackhat.com/docs/us-14/materials/us-14-Duckwall-Abusing-Microsoft-Kerberos-Sorry-You-Guys-Don't-Get-It-wp.pdf
- https://www.sans.org/cyber-security-summit/archives/file/summit-archive-1493862736.pdf
- https://www.redsiege.com/wp-content/uploads/2020/04/20200430-kerb101.pdf
