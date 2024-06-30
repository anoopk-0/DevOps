
## Sample 1

# FROM:  baseImage
FROM node:14.16.0-alpine3.13

# group and users
RUN addgroup app && adduser -S -G app app

# assign a user
USER app

# working directory in container
WORKDIR /app

# creating a folder in container
RUN mkdir data

COPY package*.json .

RUN npm install

COPY . .

ENV API_URL=https://api.myapp.com/v1

EXPOSE 3000

CMD ["npm", "start"]


