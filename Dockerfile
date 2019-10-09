# Build Phase
FROM node:alpine as builder
WORKDIR /home/sanskar/react-app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# Run Phase
FROM nginx
COPY --from=builder /home/sanskar/react-app/build /usr/share/nginx/html