FROM node:latest
RUN apt-get update && apt-get install -y python3-pip curl
RUN pip3 install awscli
RUN git config --global user.email "bitbucket.readonly@rabota.ua" && git config --global user.name "ruaonly"
RUN npm i -g npm
# node-sass
# RUN npm i -g --unsafe-perm node-sass
