#!/bin/bash
# Usage: line_verify.sh YOURFILE.sig [vault key name]
# Use optional arg2 for key name or just default "test"
key=${2:-"test"}
while read l
do
    # Separate signature from original line.
    signature=$(echo "$l" | cut -d '|' -f 1)
    let siglen=${#signature}+1

    # Get base64 of line text starting after signature |
    l64=$(echo -n "${l:$siglen}" | base64)

    verifyResponse=$(vault write -field valid transit/verify/$key/sha2-256 input="$l64" signature="$signature")
    response=$?
    
    # If this line fails to verify, exit.
    if [[ $verifyResponse == "false" ]]
    then
        echo "Line signature invalid: $l"
        exit 1
    fi
    if [[ $response -ne 0 ]]
    then
        echo "Error from Vault, exiting"
        exit 1
    fi
done < "$1"

echo "Verfied"