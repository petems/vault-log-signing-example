#!/bin/bash

export VAULT_TOKEN=ROOT
export VAULT_ADDR=http://127.0.0.1:8200

vault secrets enable transit
vault write -f transit/keys/test type=rsa-4096