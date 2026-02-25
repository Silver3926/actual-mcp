FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --production

# Force upgrade safely after install
RUN npm update @actual-app/api

COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["sh","-c","npm start -- --port=$PORT --sse --enable-write"]
