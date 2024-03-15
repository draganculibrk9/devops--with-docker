# builder stage
FROM node:16.20.2 as builder

WORKDIR /usr/src/app

COPY package* .

RUN npm ci

COPY . .

RUN npm run build

# run stage
FROM node:16.20.2-alpine

RUN npm i -g serve && \
    adduser -D appuser && \
    chown appuser .

EXPOSE 5000

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/build ./build

USER appuser

CMD serve -s -l 5000 build