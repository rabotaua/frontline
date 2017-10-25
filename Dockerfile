FROM node:8
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install awscli
RUN git config --global user.email "bitbucket.readonly@rabota.ua" && git config --global user.name "ruaonly"
