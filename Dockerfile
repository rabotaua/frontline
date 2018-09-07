FROM node:latest
RUN apt-get update && apt-get install -y python3-pip curl
RUN pip3 install awscli
RUN git config --global user.email "bitbucket.readonly@rabota.ua" && git config --global user.name "ruaonly"
# node-sass
RUN apt-get install -y  gcc g++ build-essential
RUN npm i -g node-sass@4.8