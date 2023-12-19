// index.js

const express = require('express');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const app = express();
const port = 3000;

app.use(express.json());


app.get('/log', async (req, res) => {
  const txt = await prisma.txt.findMany()
  res.json(txt);
});

app.post('/add-log', async (req, res) => {
    const txt = await prisma.txt.create({
        data: {
            log: 'fake data'
        }
    })
    res.json(txt);
  });
  

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
