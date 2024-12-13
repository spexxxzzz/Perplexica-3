FROM node:18-slim

WORKDIR /home/Perplexica-3

COPY src /home/Perplexica-3/src
COPY tsconfig.json /home/Perplexica-3/
COPY drizzle.config.ts /home/Perplexica-3/
COPY package.json /home/Perplexica-3/
COPY yarn.lock /home/Perplexica-3/

RUN mkdir /home/Perplexica-3/data
RUN mkdir /home/Perplexica-3/uploads

RUN yarn install --frozen-lockfile --network-timeout 600000
RUN yarn build

CMD ["yarn", "start"]