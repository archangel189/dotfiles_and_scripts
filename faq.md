## Docker Registry — "certificate signed by unknown authority" error

### Problem

Authentication with IAG internal Docker registry (art2.auiag.corp) may fail when publishing your own Docker image:

```
$ docker push art2.auiag.corp/docker-serverspec:latest
The push refers to a repository [art2.auiag.corp/docker-serverspec]
Get https://art2.auiag.corp/v1/_ping: x509: certificate signed by unknown authority
```

### Solution

On the terminal where the Docker daemon is running, execute the following command to get inside the Docker machine:

`docker-machine ssh`

Once inside, open `/var/lib/boot2docker/profile` and add the `--insecure-registry` flag to `EXTRA_ARGS`, as per below:

```
EXTRA_ARGS='
--label provider=virtualbox --insecure-registry art2.auiag.corp
'
```

Restart the Docker daemon on the machine:

`/etc/init.d/docker restart`

You can now push your Docker image, using a slightly different command:
`docker --tlsverify=false push art2.auiag.corp/docker-serverspec:latest`
