vault_login() {
    export VAULT_ADDR=https://vault.example.com
    export VAULT_CLIENT_TIMEOUT=3
    export VAULT_MAX_RETRIES=0
    export http_proxy=http://vault.example.com:8888
    export https_proxy=http://vault.example.com:8888
    export HTTP_PROXY=http://vault.example.com:8888
    export HTTPS_PROXY=http://vault.example.com:8888

    # For users in the the AU domain
    vault login -method=ldap username=$1

    export VAULT_TOKEN=$(cat ~/.vault-token)
}
