#!/bin/bash

# Remove the content of dist if it exists
rm -rf dist
mkdir -p dist/public

# Copy the client's index.html to the public directory to ensure Vite can find it
cp client/index.html dist/public/

# Custom Vite build command pointing directly to the index.html
echo "Building frontend..."
npx vite build --config vite.config.ts

# Build the server
echo "Building backend..."
npx esbuild server/index.ts --platform=node --packages=external --bundle --format=esm --outdir=dist

echo "Build completed successfully!"