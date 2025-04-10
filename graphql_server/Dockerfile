FROM node:22.13.1-alpine AS packages

WORKDIR /build

COPY package.json package-lock.json ./

RUN npm ci

FROM packages AS build

COPY . .


# RUN npx prisma generate
RUN npm run compile

FROM node:22.13.1-alpine AS runtime

RUN apk add --no-cache bash

WORKDIR /app

COPY --from=build /build/dist ./dist
COPY --from=build /build/package.json .
COPY --from=build /build/package-lock.json .
COPY --from=build /build/node_modules ./node_modules
COPY --from=build /build/prisma ./prisma
COPY ./run.sh .

ARG PORT=80
ENV PORT=${PORT}
EXPOSE ${PORT}

ENTRYPOINT [ "/app/run.sh" ]
