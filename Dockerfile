FROM node:8.11.1

MAINTAINER yang.wang17 "yang.wang17@ele.me"

WORKDIR /blog

COPY . /blog

RUN npm install

RUN npm install hexo-cli@1.1.0 -g

EXPOSE 4000

CMD ["hexo", "server"]