# syntax=docker/dockerfile:1

# specify the node base image with your desired version node:<version>
FROM node:latest

RUN curl -sfL https://install.goreleaser.com/github.com/tj/node-prune.sh | bash -s -- -b /usr/local/bin

# replace this with your application's default port
EXPOSE 3000

# ENV NODE_ENV=production

WORKDIR /app
COPY . /app
#COPY ["package.json", "package-lock.json*", "./app/"]

RUN npm install
RUN npm prune --production
#RUN /usr/local/bin/node-prune
#FROM node:latest
#WORKDIR /app
#COPY --from=build /app/node_modules ./node_modules


CMD [ "node", "." ]


