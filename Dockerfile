FROM node:8-alpine
RUN apk add --update python py-pip
RUN pip install awscli