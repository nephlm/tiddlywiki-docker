FROM node:buster-slim

RUN apt-get update && apt-get install -y s3fs

RUN npm install -g tiddlywiki@5.1.22

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki
ADD mount-bucket /usr/local/bin/mount-bucket

# Meta
CMD ["/usr/local/bin/init-and-run-wiki"]
EXPOSE 8080
