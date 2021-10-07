# active directory

[link to the room](https://tryhackme.com/room/activedirectorybasics)

## physical active directory 

### domain controller
A domain controller is a Windows server that has Active Directory Domain Services (AD DS) 

- holds the AD DS data store 
- handles authentication and authorization services 
- replicate updates from other domain controllers in the forest
- Allows admin access to manage domain resources

#### AD DS data store
db that holds holds users, groups, and services:
- NTDS.dit : db that contains info about AD DC, password hashes for domain users
- stored by default in %SystemRoot%\NTDS
- accessible only by the DC

## forest
A forest is a collection of one or more domain trees inside of an Active Directory network.

- Trees - A hierarchy of domains in AD DS
- Domains - Used to group and manage objects 
- Organizational Units (OUs) - Containers for groups, computers, users, printers and other OUs
- Trusts - Allows users to access resources in other domains
- Objects - users, groups, printers, computers, shares
- Domain Services - DNS Server, LLMNR, IPv6
- Domain Schema - Rules for object creation

## users + groups

- NB: when you create a domain controller it comes with default groups and two default users: **Administrator** and **guest**

### users
Users are the core to Active Directory, type of users are: 
- Domain Admins - control the domains and are the only ones with access to the domain controller.
- Service Accounts (Can be Domain Admins) -never used except for service maintenance
- Local Administrators - can make changes to local machines as an administrator and may even be able to control other normal users, but they cannot access the domain controller
- Domain Users - These are your everyday users. They can log in on the machines they have the authorization to access and may have local administrator rights to machines depending on the organization
### groups
Groups make it easier to give permissions to users and objects by organizing them into groups with specified permissions. there are two types:

- Security Groups - These groups are used to specify permissions for a large number of users
- Distribution Groups - These groups are used to specify email distribution lists.
#### default security groups
- Domain Controllers - All domain controllers in the domain
- Domain Guests - All domain guests
- Domain Users - All domain users
- Domain Computers - All workstations and servers joined to the domain
- Domain Admins - Designated administrators of the domain
- Enterprise Admins - Designated administrators of the enterprise
- Schema Admins - Designated administrators of the schema
- DNS Admins - DNS Administrators Group
- DNS Update Proxy - DNS clients who are permitted to perform dynamic updates
- Allowed RODC Password Replication Group - Members in this group can have their passwords replicated to all read-only domain controllers in the domain
- Group Policy Creator Owners - Members in this group can modify group policy for the domain
- Denied RODC Password Replication Group - Members in this group cannot have their passwords replicated to any read-only domain controllers in the domain
- Protected Users - Members of this group are afforded additional protections against authentication security threats. 
- Cert Publishers - Members of this group are permitted to publish certificates to the directory
- Read-Only Domain Controllers - Members of this group are Read-Only Domain Controllers in the domain
- Enterprise Read-Only Domain Controllers - Members of this group are Read-Only Domain Controllers in the enterprise
- Key Admins - Members of this group can perform administrative actions on key objects within the domain.
- Enterprise Key Admins - Members of this group can perform administrative actions on key objects within the forest.
- Cloneable Domain Controllers - Members of this group that are domain controllers may be cloned.
- RAS and IAS Servers - Servers in this group can access remote access properties of users




## trusts + policies
the rules in place of how the domains inside of a forest can interact with each other, how an external forest can interact with the forest.

### domain trust
There are two types of trusts that determine how the domains communicate.
- Directional - The direction of the trust flows from a trusting domain to a trusted domain
- Transitive - The trust relationship expands beyond just two domains to include other trusted domains

NB: when attacking an Active Directory environment you can sometimes abuse these trusts in order to move laterally throughout the network. 

### domain policies 
You can think of domain policies like domain groups, except instead of permissions they contain rules, and instead of only applying to a group of users, the policies apply to a domain as a whole.

- Disable Windows Defender - Disables windows defender across all machine on the domain
- Digitally Sign Communication (Always) - Can disable or enable SMB signing on the domain controller

## AD DS + Authentication

### AD DS
AD DS - allow for management of the domain, security certificates, LDAPs, and much more. 
 They are services that the domain controller provides 
 to the rest of the domain or tree.  

- LDAP - Lightweight Directory Access Protocol; provides communication between applications and directory services
- Certificate Services - allows the domain controller to create, validate, and revoke public key certificates
- DNS, LLMNR, NBT-NS - Domain Name Services for identifying IP hostnames

### domain authentication
There are two main types of authentication in place for Active Directory: NTLM and Kerberos.

- Kerberos - The default authentication service for Active Directory uses ticket-granting tickets and service tickets to authenticate users and give users access to other resources across the domain.
- NTLM - default Windows authentication protocol uses an encrypted challenge/response protocol

## AD in the cloud 

### Azure AD 
Azure acts as the middle man between your physical Active Directory and your users' sign on. This allows for a more secure transaction between domains, making a lot of Active Directory attacks ineffective.


## links:

[power view cheat sheet](https://gist.github.com/HarmJ0y/3328d954607d71362e3c)



