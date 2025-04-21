# Virtual Assistant Application

A mobile application with a tile-based interface and a persistent avatar that interacts with FastAPI endpoints.

## Deployment on Render

To deploy this application on Render:

1. Create a new Web Service on Render
2. Link to your GitHub repository
3. Use the following settings:
   - **Environment**: Node
   - **Build Command**: `chmod +x render-build.sh && ./render-build.sh`
   - **Start Command**: `NODE_ENV=production node dist/server.js`
   - **Root Directory**: /

## Important Files

- `render-build.sh`: Custom build script for Render deployment
- `Procfile`: Specifies the command to start the application
- `index.js`: Fallback server file if the build process encounters issues

## Running Locally
```
npm install
npm run dev
```

## Project Structure
- `/client` - React frontend application
- `/server` - Express backend
- `/shared` - Shared types and schemas

## Features
- Tile-based dashboard
- Interactive avatar
- Integration with multiple API endpoints