// Simple server entry point for Render deployment
import express from 'express';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const app = express();
const port = process.env.PORT || 5000;

// Serve static files from the "public" directory
app.use(express.static(join(__dirname, 'dist/public')));

// Handle API requests
app.get('/api/*', (req, res) => {
  res.json({ message: 'API endpoint reached', path: req.path });
});

// For any other GET request, send back the index.html file
app.get('*', (req, res) => {
  res.sendFile(join(__dirname, 'dist/public/index.html'));
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});