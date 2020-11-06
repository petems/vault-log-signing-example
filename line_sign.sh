#!/bin/bash
# Usage: line_sign.sh YOURFILE [vault key name]
# Use optional a
key=${2:-"test"}

if [ ! -f "$1" ]; then
  echo "File given $1 does not exist"
  exit 1
fi

if [ -f "$1.sig" ]; then
  echo "Sig file $1.sig already exists, please delete"
  exit 1
fi

while read l
do
    # Get base64 of line text.
    l64=$(echo -n "$l" | base64)
    signature=$(vault write -field signature transit/sign/$key/sha2-256 input="$l64")

    # Append SIGNATURE|LINE text to YOURFILE.sig
    echo "$signature|$l" >> $1.sig
done < "$1"

echo "Signing complete"