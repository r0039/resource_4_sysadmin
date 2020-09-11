Docker registry in Azure. To deploy, run `docker stack deploy -c stack.yml skylab_registry_prod` command on Manager node
Please create the `htpasswd` secret file before deploy the stack. To generate the credential, you can use following command
`docker run --rm --entrypoint htpasswd registry:2 -Bbn username password`
