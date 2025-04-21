#!/bin/bash

echo "Starting simplified build process..."

# Install dependencies
echo "Installing dependencies..."
npm install

# Clean up and create proper directory structure
echo "Setting up build directories..."
rm -rf dist
mkdir -p dist
mkdir -p dist/public

# Copy our optimized server file directly to dist
echo "Setting up server..."
cp index.js dist/server.js

# Create a simple index.html for the web server
echo "Creating landing page..."
cat > dist/public/index.html << 'EOL'
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Virtual Assistant</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f5f5f5;
      }
      .container {
        text-align: center;
        padding: 2rem;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        max-width: 500px;
      }
      h1 {
        color: #4a6cf7;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Virtual Assistant</h1>
      <p>Your virtual assistant application is now running on Render.</p>
      <p>This is a placeholder page.</p>
    </div>
  </body>
</html>
EOL

echo "Build completed successfully!"