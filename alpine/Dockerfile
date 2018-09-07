FROM node:alpine
RUN apk add --update python py-pip git curl
RUN pip install awscli
RUN git config --global user.email "bitbucket.readonly@rabota.ua" && git config --global user.name "ruaonly"
RUN npm i -g npm
