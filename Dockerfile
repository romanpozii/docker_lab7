
FROM node:alpine AS builder


WORKDIR /app


COPY ./package.json ./


RUN npm install

RUN npm run build


FROM nginx:latest


COPY --from=builder /app /usr/share/nginx/html


HEALTHCHECK --interval=30s --timeout=3s \
CMD wget --quiet --tries=1 --spider http://localhost || exit 1


ARG VERSION
ENV APP_VERSION=$VERSION


#docker buildx build --platform linux/amd64,linux/arm64 --push --tag itlord18/labtest:v7 --cache-to=type=registry,ref=itlord18/labtest:cache,max_size=5GB --cache-from=type=registry,ref=itlord18/labtest:cache -f Dockerfile .