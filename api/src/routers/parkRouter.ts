import { Router } from "express";

import query from '../db';
import { createResponse, NOT_IMPLEMENTED, ParkCSVToJSON, ParkJSON, ParkJSONLD } from "../util";

const router = Router();

const url = '/park/:id';

router.get(url, async (req, res) => {
    // @ts-ignore
    const { id } = req.params;

    const queryString = "(SELECT p.idPark, naziv, povrsina, utemeljen, sluzbenaStranica, email, nazivLokacija, nazivDrzava, tel, nazivVrsta, nazivProdajnogMjesta, Znamenitost.nazivZnamenitosti, Znamenitost.opisZnamenitosti FROM Park AS p NATURAL JOIN Lokacija NATURAL JOIN Drzava NATURAL JOIN Vrsta LEFT JOIN Telefon ON p.idPark = Telefon.idPark LEFT JOIN MjestoProdajeUlaznice ON p.idPark = MjestoProdajeUlaznice.idPark LEFT JOIN Znamenitost ON p.idPark = Znamenitost.idPark WHERE p.idPark = $1 ORDER BY p.idPark ASC)";
    const result = await query(queryString, [id]);
    if (result.error) return res.status(500).json(createResponse('SERVER ERROR', 'Greška s bazom podataka', result.error));

    if (!result.response?.rowCount) return res.status(404).json(createResponse('NOT FOUND', `Ne postoji park s id: ${id}`, null));

    const map = new Map<number, ParkJSON>();
    for (const park of result.response?.rows as ParkCSVToJSON[]) {
        if (map.has(park.idpark)) {
            if (!map.get(park.idpark)?.tel.includes(park.tel)) {
                map.get(park.idpark)?.tel.push(park.tel);
            }
            if (!map.get(park.idpark)?.nazivprodajnogmjesta.includes(park.nazivprodajnogmjesta)) {
                map.get(park.idpark)?.nazivprodajnogmjesta.push(park.nazivprodajnogmjesta);
            }
            if (!map.get(park.idpark)?.znamenitost.some((val) => val.nazivznamenitosti === park.nazivznamenitosti)) {
                map.get(park.idpark)?.znamenitost.push({ nazivznamenitosti: park.nazivznamenitosti, opisznamenitosti: park.opisznamenitosti });
            }
        } else {
            map.set(park.idpark, {
                idpark: park.idpark,
                naziv: park.naziv,
                povrsina: park.povrsina,
                utemeljen: park.utemeljen,
                sluzbenastranica: park.sluzbenastranica,
                email: park.email,
                nazivlokacija: park.nazivlokacija,
                nazivdrzava: park.nazivdrzava,
                tel: [park.tel],
                nazivvrsta: park.nazivvrsta,
                nazivprodajnogmjesta: [park.nazivprodajnogmjesta],
                znamenitost: [{ nazivznamenitosti: park.nazivznamenitosti, opisznamenitosti: park.opisznamenitosti }]
            });
        }
    }
    const finalJSON: ParkJSON[] = [];
    map.forEach((park => finalJSON.push(park)));

    // Dodaj jsonld podatke
    const temp = finalJSON[0];
    const jsonld: ParkJSONLD = {
        "@context": {
            "@vocab": 'http://schema.org/',
            "idpark": "identifier",
            "naziv": "name",
            "tel": "telephone",
            "nazivlokacija": "address",
            "nazivdrzava": "containedInPlace",
            "nazivvrsta": "disambiguatingDescription",
            "povrsina": "additionalProperty",
            "utemeljen": "additionalProperty",
            "sluzbenastranica": "additionalProperty",
            "nazivprodajnogmjesta": "additionalProperty",
            "email": "additionalProperty"
        },
        "@type": 'Park',
        idpark: temp.idpark,
        naziv: temp.naziv,
        povrsina: {
            "@type": 'Float',
            '@value': temp.povrsina,
        },
        utemeljen: {
            '@type': 'Date',
            '@value': temp.utemeljen,
        },
        sluzbenastranica: temp.sluzbenastranica,
        email: temp.email,
        nazivlokacija: temp.nazivlokacija,
        nazivdrzava: temp.nazivdrzava,
        tel: temp.tel,
        nazivvrsta: temp.nazivvrsta,
        nazivprodajnogmjesta: temp.nazivprodajnogmjesta,
        znamenitost: temp.znamenitost,
    };


    return res.status(200).send(createResponse('OK', `Vraćen park s id: ${id}`, jsonld));
});

router.post(url, NOT_IMPLEMENTED);

router.put(url, async (req, res) => {

    const { id } = req.params;
    const { naziv, povrsina, utemljen, sluzbenaStranica, email, idLokacija, idDrzava, idVrsta } = req.body;

    const queryString = "UPDATE Park SET naziv=$1, povrsina=$2, utemeljen=$3, sluzbenaStranica=$4, email=$5, idLokacija=$6, idDrzava=$7, idVrsta=$8 WHERE Park.idPark = $9";
    const result = await query(queryString, [naziv, povrsina, utemljen, sluzbenaStranica, email, idLokacija, idDrzava, idVrsta, id]);
    if (result.error) return res.status(500).json(createResponse('SERVER ERROR', 'Greška s bazom podataka', result.error));
    if (!result.response?.rowCount) return res.status(400).json(createResponse('BAD REQUEST', `Ne postoji park s id: ${id}`, null))

    return res.status(200).send(createResponse('OK', `Promjenjen park s id: ${id}`, result.response?.rows));
});

router.delete(url, async (req, res) => {

    const { id } = req.params;

    const queryString = "DELETE FROM Park WHERE Park.idPark = $1";
    const result = await query(queryString, [id]);
    if (result.error) return res.status(500).json(createResponse('SERVER ERROR', 'Greška s bazom podataka', result.error));
    if (!result.response?.rowCount) return res.status(400).json(createResponse('BAD REQUEST', `Ne postoji park s id: ${id}`, null));

    return res.status(200).send(createResponse('OK', `Uspješno izbrisan park s id: ${id}`, result.response?.rows));
});

/////////////////////////////////////////////////////////////////////

router.get('/park', NOT_IMPLEMENTED);
router.post('/park', async (req, res) => {

    const { idPark, naziv, povrsina, utemljen, sluzbenaStranica, email, idLokacija, idDrzava, idVrsta } = req.body;

    const queryString = "SELECT * FROM Park WHERE Park.idPark = $1 LIMIT 1";
    const result = await query(queryString, [idPark]);
    if (result.error) return res.status(500).json(createResponse('SERVER ERROR', 'Greška s bazom podataka', result.error));
    if (result.response?.rowCount) return res.status(400).json(createResponse('BAD REQUEST', `Već postoji park s id: ${idPark}`, null));

    const queryString2 = "INSERT INTO Park VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);";
    const result2 = await query(queryString2, [idPark, naziv, povrsina, utemljen, sluzbenaStranica, email, idLokacija, idDrzava, idVrsta]);
    if (result2.error) return res.status(500).json(createResponse('SERVER ERROR', 'Greška s bazom podataka', result2.error));

    return res.status(200).send(createResponse('OK', `Uspješno dodan park s id: ${idPark}`, result2.response?.rows));
});
router.put('/park', NOT_IMPLEMENTED);
router.delete('/park', NOT_IMPLEMENTED);

/////////////////////////////////////////////////////////////////////

export default router;
