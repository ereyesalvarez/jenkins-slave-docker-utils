FROM jenkins/jnlp-slave:latest

USER root

RUN  apt-get update -y
RUN  apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common -y

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN  apt-key fingerprint 0EBFCD88

RUN  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN  apt-get update -y

RUN apt-get install docker-ce docker-ce-cli containerd.io -y

# Install AWS CLI
RUN  apt-get install zip

RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

RUN unzip awscliv2.zip

RUN ./aws/install

USER jenkins

