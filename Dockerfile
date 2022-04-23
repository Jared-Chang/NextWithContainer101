FROM node:lts-alpine AS base

FROM base AS dev

WORKDIR /srv/dev

FROM base AS production

WORKDIR /srv/production
COPY ./demo .
WORKDIR /srv/production/demo
RUN npm install && npm run build

EXPOSE 3000
ENTRYPOINT ["npm", "run", "start"]
