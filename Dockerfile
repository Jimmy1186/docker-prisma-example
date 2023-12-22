
FROM node:18

WORKDIR /app

COPY package*.json ./
RUN yarn install

COPY . .


COPY ./wait-for-it.sh ./
COPY ./startup.sh ./

RUN npx prisma generate
RUN chmod +x wait-for-it.sh
RUN chmod +x startup.sh
EXPOSE 3000

# CMD ["./startup.sh"]
CMD ["./wait-for-it.sh", "db:3306", "--", "./startup.sh"]