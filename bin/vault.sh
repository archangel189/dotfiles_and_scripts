vault_login() {
    export VAULT_ADDR=https://vault.example.com
    export http_proxy=http://vault.example.com:8888
    export https_proxy=http://vault.example.com:8888
    export HTTP_PROXY=http://vault.example.com:8888
    export HTTPS_PROXY=http://vault.example.com:8888
    export no_proxy='*.local, localhost, 127.0.0.1, 169.254/16'
    export VAULT_CLIENT_TIMEOUT=3
    export VAULT_MAX_RETRIES=0

    # For users in the the AU domain
    vault login -method=ldap username=$1

    export VAULT_TOKEN=$(cat ~/.vault-token)
}
