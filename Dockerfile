FROM node:10.1.0-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

# RUN yarn install esm

COPY . /app

EXPOSE 9070

ENV NODE_ENV production

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

# Default command to run your application (can be overridden during deployment)
CMD ["--port", "9070"]