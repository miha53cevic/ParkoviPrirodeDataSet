import express from 'express';
import cors from 'cors';

import query from './db';

const app = express();

// Use cors for dev
app.use(cors({ origin: true, credentials: true }));

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Index route
app.get('/', (req, res) => {
    res.send(`<h1>Running on port: ${port}</h1>`);
});

app.get('/podaci', async (req, res) => {
    const queryString = "(SELECT p.idPark, naziv, povrsina, utemeljen, sluzbenaStranica, email, nazivLokacija, nazivDrzava, tel, nazivVrsta, nazivProdajnogMjesta, Znamenitost.nazivZnamenitosti, Znamenitost.opisZnamenitosti FROM Park AS p NATURAL JOIN Lokacija NATURAL JOIN Drzava NATURAL JOIN Vrsta LEFT JOIN Telefon ON p.idPark = Telefon.idPark LEFT JOIN MjestoProdajeUlaznice ON p.idPark = MjestoProdajeUlaznice.idPark LEFT JOIN Znamenitost ON p.idPark = Znamenitost.idPark ORDER BY p.idPark ASC)";
    const result = await query(queryString, []);
    res.send(result.response?.rows);
});

// Default route (404 not found)
app.use((req, res) => {
    res.sendStatus(404);
})

const port = process.env.PORT || 3001;
app.listen(port, () => {
    console.log(`Running on port ${port}`);
});