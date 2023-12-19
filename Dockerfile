
FROM node:18

WORKDIR /app

COPY package*.json ./

EXPOSE 3000

RUN yarn install --production=true

COPY . .

COPY ./wait-for-it.sh ./

RUN chmod +x wait-for-it.sh

CMD ["./wait-for-it.sh", "mysql:3307", "--", "./startup.sh"]



