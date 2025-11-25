# Install Docker Inside Jenkins 

## Install required dependencies
apt-get update
apt-get install -y ca-certificates curl gnupg

sleep 2 

## Add Docker’s official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

sleep 2

## Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
  https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" \
  > /etc/apt/sources.list.d/docker.list

sleep 2

## Install Docker CLI (client only)
apt-get update
apt-get install -y docker-ce-cli

sleep 2

## Chmod docker daemon mode
chmod 666 /var/run/docker.sock 

sleep 3 

## Install Nodejs 

## Add NodeSource repo
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

## Install Node.js
apt-get install -y nodejs

## Verify 
node -v
npm -v

## Get Jenkins Password 

cat /var/jenkins_home/secrets/initialAdminPassword

