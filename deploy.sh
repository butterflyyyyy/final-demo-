#!/bin/bash

# Install dependencies
npm install

# Copy the index.html to make sure Vite can find it
mkdir -p dist/public
cp client/index.html dist/public/

# Build the client app - explicitly point to the index.html
npx vite build --config vite.config.ts

# Build the server
npx esbuild server/index.ts --platform=node --packages=external --bundle --format=esm --outdir=dist

echo "Build completed successfully!"