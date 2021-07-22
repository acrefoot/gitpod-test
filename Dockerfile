FROM amd64/node:lts

RUN apt-get update && apt-get install -y \
  vim

WORKDIR /code

COPY package.json .
COPY package-lock.json .

RUN npm install --global npm@7
RUN npm install --ignore-scripts

COPY . .

RUN npm run postinstall

ENTRYPOINT ["./init_db.sh"]

EXPOSE 3000
CMD ["npm", "run", "dev"]
