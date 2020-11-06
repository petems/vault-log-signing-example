# vault-log-signing-example

A quick example of using Vault to sign and verify a given log file.

## Setup

```
docker-compose up -d
./setup_transit.sh
```

## Signing file

```
./line_sign.sh test.txt
Signing complete
```

View the signed file:

```
cat test.txt.sig
vault:v1:EY75gtUzuLChW/g9wpQYxvlIhWe0rgv6epH5gMhY20t7cTuMQJsParbSmLT4+eQPsTK6MXJicPn8YmZIBG/xa1KZHsKyAe5BrXbMwBfmJFbco1U08pSVMXa4s40jWlfwQvpjjdRfH6dsQvs39cVIoDwMJ09EwJjqTw+ofCUyRVoEaMZ12Y9Fg3L9QdElwFjudNeheQNz9ZkAt4cwZ26VE2oCOUuq56VT+Bm0F2MeoDyP4/9Xvvwetgb28DQWl0rkpZLbLpJPOvsLWtuFwpKGRDkMCH/uohCZqiqg8cxgMaj+SxRfhdOgTvnGTpenI9oNFgW+bTZ+6P71BL5mfQGCN9ZYGJdFBS26JWBzH4sJQ8wyvjJ5JXfiwqmFr1Q07KlK/COULRFpjzkCGfhB4/FFdbpgFe4FSq7uoznZS++2nDy2fP5AScbauU7lRQoGk6CgwMqdHti30T9EUkbeQNP36W+8REqQmSoi6tj/OYUlQ+mTylV9gK3pLt83lvIfz/YvyWJWMMkzGJflGiHjAamBRo6XR0UTtdtwvXQl6uHzw3ElWJZSTu0lpFAAhVXJF11BC+3w2nCwDcXsChDsitf5wIHlhJlRzNUIH6aLrS4woBIA8NkVNUeZg/7kBzfWi4RXNdmMeyB8fFeLX4mWuzAFJq3FNbzEnSb2znHvAYB/NZ0=|What is Lorem Ipsum?
```

## Verify the signature

```
./line_verify.sh test.txt.sig
Verfied
```

## More information

* https://www.vaultproject.io/api-docs/secret/transit#sign-data
* https://www.vaultproject.io/api-docs/secret/transit#verify-signed-data
* https://medium.com/hashicorp-engineering/hashicorp-vault-for-tamper-protection-and-whoops-i-accidentally-created-a-blockchain-1980dbeb909b