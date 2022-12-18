import { Router } from "express";

import query from '../db';
import { createResponse, NOT_IMPLEMENTED } from "../util";

const router = Router();

const url = '/podaci';

router.get(url, async (req, res) => {
    
    const queryString = "(SELECT p.idPark, naziv, povrsina, utemeljen, sluzbenaStranica, email, nazivLokacija, nazivDrzava, tel, nazivVrsta, nazivProdajnogMjesta, Znamenitost.nazivZnamenitosti, Znamenitost.opisZnamenitosti FROM Park AS p NATURAL JOIN Lokacija NATURAL JOIN Drzava NATURAL JOIN Vrsta LEFT JOIN Telefon ON p.idPark = Telefon.idPark LEFT JOIN MjestoProdajeUlaznice ON p.idPark = MjestoProdajeUlaznice.idPark LEFT JOIN Znamenitost ON p.idPark = Znamenitost.idPark ORDER BY p.idPark ASC)";
    const result = await query(queryString, []);
    if (result.error) return res.status(500).json(createResponse('SERVER ERROR', 'Greška s bazom podataka', result.error));

    return res.status(200).send(createResponse('OK', 'Dump svih parkova', result.response?.rows));
});

router.post(url, NOT_IMPLEMENTED);
router.put(url, NOT_IMPLEMENTED);
router.delete(url, NOT_IMPLEMENTED);

export default router;
