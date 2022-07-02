FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx as prod_server
# where we're copying to is just a nginx specific convention for path
COPY --from=builder /app/build /usr/share/nginx/html