# base Image of OS, as node already has base image of the alpine
FROM node:alpine3.19 

# creating and copying the contant in that dir
COPY . /src

WORKDIR /src

# command to run the application
CMD node index.js