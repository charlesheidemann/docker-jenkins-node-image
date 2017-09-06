FROM jenkins/jenkins:2.74
# if we want to install via apt

USER root

RUN apt-get update
RUN  apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/debian \
     $(lsb_release -cs) \
     stable"
RUN apt-get update
RUN apt-get install -y nodejs && apt-get install -y docker-ce && npm install newman --global && ln -s /node_modules/newman/bin/newman.js /usr/bin/newman

# drop back to the regular jenkins user
USER jenkins
