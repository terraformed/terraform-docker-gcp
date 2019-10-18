#############Execute docker install script#############
sudo apt-get update
chmod 700 /root/docker-install.sh
/root/docker-install.sh >> /root/docker-install.log
mv /root/docker-install.sh /root/docker-install.sh.EXECUTED #prevent it from running again

#############Install Docker network#############
#create a network most containers will use
docker network create dockernet >> /root/dockernet.log
docker network ls >> /root/dockernet.log


#############Bring up docker containers############
docker-compose -f /root/docker-compose.yml up -d 
