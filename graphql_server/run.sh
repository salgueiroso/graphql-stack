#!/usr/bin/env bash

npx prisma db push

exec node ./dist/index.js
