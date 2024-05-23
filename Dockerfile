FROM node:10.1.0-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

COPY . /app

EXPOSE 9070

ENV NODE_ENV production

ENTRYPOINT ["/bin/bash", "-c", "node -r esm ./bin/server"]

CMD ["--port", "9070"]