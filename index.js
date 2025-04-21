// Simple server for Render deployment
const express = require('express');
const path = require('path');
const fs = require('fs');

const app = express();
const port = process.env.PORT || 10000;

// Define the public directory path
const publicDir = path.join(__dirname, 'public');

// Ensure the public directory exists
if (!fs.existsSync(publicDir)) {
  fs.mkdirSync(publicDir, { recursive: true });
}

// Serve static files
app.use(express.static(publicDir));

// Handle API requests
app.get('/api/*', (req, res) => {
  res.json({ 
    message: 'API endpoint reached', 
    path: req.path,
    status: 'This is a placeholder API response'
  });
});

// Default route - serve index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(publicDir, 'index.html'));
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});