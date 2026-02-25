FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
# IMPORTANT: upgrade Actual API to latest
RUN npm install @actual-app/api@latest

RUN npm install

COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["sh","-c","npm start -- --port=$PORT --sse --enable-write"]
