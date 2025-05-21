import express from 'express';
import dotenv from 'dotenv';
dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.get('/api', (req, res) => {
  res.send('Welcome to the Reydall E-Commerce API!');
});

app.listen(PORT, () => {
  console.log(`Backend server running on port ${PORT}`);
});
