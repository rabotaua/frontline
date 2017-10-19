FROM node:8-alpine
RUN apk add --update python py-pip git
RUN pip install awscli