FROM debian:9
MAINTAINER obed.n.munoz@gmail.com

# Software Update
RUN apt-get update -y
RUN apt install software-properties-common curl gnupg2 locales alien openssh-server samba-libs samba-dev -y

# SaltCloud
RUN curl -Ok https://repo.saltstack.com/apt/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub
RUN apt-key add SALTSTACK-GPG-KEY.pub
RUN echo "deb http://repo.saltstack.com/apt/debian/9/amd64/latest stretch main" > /etc/apt/sources.list.d/saltstack.list
RUN apt-get update -y
RUN apt-get install salt-cloud python-novaclient -y

RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
RUN locale-gen

# Install extra utilities
RUN apt-get install tmux -y