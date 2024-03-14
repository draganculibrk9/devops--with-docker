FROM node:16.20.2

WORKDIR /usr/src/app

RUN npm i -g serve

COPY package* .

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 5000

CMD serve -s -l 5000 build