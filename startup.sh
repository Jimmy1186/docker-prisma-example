#!/bin/sh
yarn prisma generate
npx prisma migrate dev
yarn run debug
