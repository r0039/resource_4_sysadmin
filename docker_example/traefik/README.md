# HTTP/HTTPS Reverse Proxy and Load Balancer based on Traefik (https://traefik.io)
Please deploy / update the traefik service manually on docker-manager1 node instead of using gitlab-ci because it is the proxy for our docker registry.

To build, run:
docker build -t registry-aws.innogr.am/traefik:aws-production -f Dockerfile .
docker login -u skylab -p xxxxx registry-aws.innogr.am
docker push registry-aws.innogr.am/traefik:aws-production
To deploy, run: docker stack deploy -c stack.yml traefik
