import { Router } from "express";

import query from '../db';
import { createResponse, NOT_IMPLEMENTED } from "../util";

const router = Router();

const url = '/drzave';

router.get(url, async (req, res) => {
    
    const queryString = "SELECT * FROM Drzava";
    const result = await query(queryString, []);
    if (result.error) return res.status(500).json(createResponse('SERVER ERROR', 'Greška s bazom podataka', result.error));

    return res.status(200).send(createResponse('OK', 'Drzave parkova prirode unesenih u bazi', result.response?.rows));
});

router.post(url, NOT_IMPLEMENTED);
router.put(url, NOT_IMPLEMENTED);
router.delete(url, NOT_IMPLEMENTED);

export default router;
