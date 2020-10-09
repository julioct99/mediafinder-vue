# Using Nginx's latest release as base image
FROM nginx:1.19.2-alpine

# Copy the local "public" folder into the Nginx served folder
COPY ./dist /usr/share/nginx/html/

# Cope the configuration file
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf