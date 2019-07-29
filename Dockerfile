FROM node:10.13-alpine
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
RUN npm install react-scripts -g --silent
RUN npm install -g serve
COPY . .
RUN npm run build
EXPOSE 5000
CMD serve -s build