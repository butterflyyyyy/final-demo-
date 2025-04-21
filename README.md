# Virtual Assistant Application

A mobile application with a tile-based interface and a persistent avatar that interacts with FastAPI endpoints.

## Deployment on Render

### Automated Deployment
This project includes a `render.yaml` file for Blueprint deployment on Render.

### Manual Deployment Steps
1. Create a new Web Service on Render
2. Link to your GitHub repository
3. Use the following settings:
   - **Environment**: Node
   - **Build Command**: `chmod +x render-build.sh && ./render-build.sh`
   - **Start Command**: `NODE_ENV=production node dist/index.js`
   - **Root Directory**: /

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