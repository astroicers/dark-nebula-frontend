FROM node:20.11.0-alpine3.19 AS builder

WORKDIR /app

COPY package*.json ./
COPY tsconfig.json ./
COPY nuxt.config.ts ./
COPY .eslintrc.cjs ./
COPY .prettierrc.cjs ./
COPY tailwind.config.js ./

RUN npm install

COPY . .

RUN npm run build

FROM node:20.11.0-alpine3.19 AS production

WORKDIR /app

COPY --from=builder /app/.output ./.output
COPY --from=builder /app/public ./public
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/nuxt.config.ts ./

RUN npm install

ENV NODE_ENV production

CMD ["npm", "run", "preview"]
