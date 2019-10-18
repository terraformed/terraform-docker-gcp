cat > /root/docker-compose.yml <<- "SCRIPT"

version: '3'
services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_PASSWORD: example
    networks:
      - dockernet
    
networks: #use same network across containers to simplify communication between containers
  dockernet:
    #driver: bridge
    external: # network created previously by 'docker network create dockernet' command
      name: dockernet

SCRIPT
