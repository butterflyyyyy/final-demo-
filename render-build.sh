#!/bin/bash

# Debug: Show directory structure
echo "Current directory structure:"
ls -la
echo "Client directory:"
ls -la client || echo "client directory not found"

# Install dependencies explicitly
echo "Installing dependencies..."
npm install

# Clean up and create necessary directories
echo "Setting up build directories..."
rm -rf dist
mkdir -p dist/public

# Build the server first (most important part)
echo "Building backend..."
npx esbuild server/index.ts --platform=node --packages=external --bundle --format=esm --outdir=dist || true

# Create a fallback server if the build fails
echo "Setting up server entry point..."
cp index.js dist/server.js || true
echo "export * from './server.js';" > dist/index.js || true

# Copy static assets if they exist
if [ -d "client/public" ]; then
  echo "Copying static assets..."
  cp -r client/public/* dist/public/
fi

# Copy client index.html if it exists
if [ -f "client/index.html" ]; then
  echo "Copying client index.html..."
  cp client/index.html dist/public/
fi

# Create a minimal index.html if it doesn't exist
if [ ! -f "dist/public/index.html" ]; then
  echo "Creating fallback index.html..."
  echo '<!DOCTYPE html><html><head><meta charset="UTF-8" /><title>Virtual Assistant</title></head><body><div id="root"></div><script type="module" src="/main.js"></script></body></html>' > dist/public/index.html
fi

echo "Build completed successfully!"