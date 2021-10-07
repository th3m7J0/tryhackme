# Hashingcrypto101

[link to the room](https://tryhackme.com/room/hashingcrypto101)


# cheatsheet
- https://hashcat.net/wiki/doku.php?id=example_hashes
- Unix style password hashes: `$format$rounds$salt$hash`
    - `$1$`: md5crypt, used in Cisco stuff and older Linux/Unix systems
    - `$6$`: sha512crypt (Default for most Linux/Unix systems)
    - `$2$, $2a$, $2b$, $2x$, $2y$`: Bcrypt (Popular for web applications)
- Rainbow table: a table mapping the hash with the plaintext.

- word mangling with john is useful by feeding info like username use it with `--single` option.
