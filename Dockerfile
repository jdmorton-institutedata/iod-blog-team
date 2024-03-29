FROM node:19-alpine

ARG NODE_ENV
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_HOST
ARG DB_PORT
ARG DB_SSL
ARG BASE_URL
ARG PORT
ARG CORS_ORIGIN="*"
ARG UPLOADS_DIR="uploads"

# Set environment variables during the build process
ENV NODE_ENV=$NODE_ENV
ENV DB_NAME=$DB_NAME
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_HOST=$DB_HOST
ENV DB_PORT=$DB_PORT
ENV DB_SSL=$DB_SSL
ENV BASE_URL=$BASE_URL
ENV PORT=$PORT
ENV CORS_ORIGIN=$CORS_ORIGIN
ENV UPLOADS_DIR=$UPLOADS_DIR

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3000

CMD ["npm", "run", "start-dev" ]
