FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
# CMD ["npm", "run", "build"]

FROM nginx
EXPOSE 80
#Copy build folder from build image to nginx image
COPY --from=builder /app/build /usr/share/nginx/html
#Default command of nginx image automatically starts up.