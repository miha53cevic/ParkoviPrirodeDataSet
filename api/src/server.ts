import express from 'express';
import cors from 'cors';
import api from './api';
import { createResponse } from './util';

const app = express();

// Use cors for dev
app.use(cors({ origin: true, credentials: true }));

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Index route
app.get('/', (req, res) => {
    res.send(`<h1>Running on port: ${port}</h1>`);
});

api(app);

// Default route (404 not found)
app.use((req, res) => {
    res.status(404).json(createResponse("NOT FOUND", "Traženi url ne postoji", null));
})

const port = process.env.PORT || 3001;
app.listen(port, () => {
    console.log(`Running on port ${port}`);
});