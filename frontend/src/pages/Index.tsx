import React from 'react';
import { Container, Paper, Stack, Typography, Grid, Button } from '@mui/material';

import TopAppBar from '../components/TopAppBar';
import { jsonToCSV } from 'react-papaparse';
import { useAuth0 } from '@auth0/auth0-react';

const downloadJSON = (jsonFile: any) => {
    const jsonString = `data:text/json;chatset=utf-8,${encodeURIComponent(
        JSON.stringify(jsonFile)
    )}`;
    const link = document.createElement("a");
    link.href = jsonString;
    link.download = "parkoviOsvjezeni.json";

    link.click();
};

const downloadCSV = (jsonFile: any) => {
    // Convert JSON to CSV
    const csv = jsonToCSV(jsonFile, { delimiter: ';' });

    const jsonString = `data:text/csv;charset=utf-8,${encodeURIComponent(
        csv
    )}`;
    const link = document.createElement("a");
    link.href = jsonString;
    link.download = "parkoviOsvjezeni.csv";

    link.click();
};

const Index: React.FC = () => {

    const { isAuthenticated } = useAuth0();

    //////////////////////////////////////////////////////////////////////////////////

    const handleOsvijeziPreslike = async () => {
        const res = await fetch(`${import.meta.env.VITE_BACKEND_URL}/podaci`);
        const data = await res.json();
        const jsonFile = data.response;

        downloadJSON(jsonFile);
        downloadCSV(jsonFile);
    };

    //////////////////////////////////////////////////////////////////////////////////

    return (
        <main>
            <TopAppBar />
            <Container sx={{ padding: '2rem' }}>
                <Paper sx={{ padding: '2rem' }}>
                    <Typography variant='h4'>Kratki opis</Typography>
                    <br />
                    <Typography>
                        Nacionalni parkovi i parkovi prirode dataset. Ovo je Otvoreni skup podataka koji sadrži informacije o parkovima
                        prirode i nacionalnim parkovima. Informacije koje sadrži su naziv parka, kontaktne informacije kao telefonski
                        brojevi i email, lokaciju parka te neke znamenitosti u parku odnosno atrakcije.
                    </Typography>
                </Paper>
                <br />
                <Paper sx={{ padding: '2rem' }}>
                    <Typography variant='h4'>Preuzimanje podataka</Typography>
                    <br />
                    <Grid container>
                        <Grid item xs={12} md={6}>
                            <Stack direction='row' spacing='1rem'>
                                <a href='/parkovi_prirode.csv' download>CSV Format</a>
                                <a href='/parkovi_prirode.json' download>JSON Format</a>
                            </Stack>
                        </Grid>
                        <Grid item xs={12} md={6}>
                            {isAuthenticated &&
                                <Button variant='contained' color='secondary' onClick={handleOsvijeziPreslike}>Osviježi preslike</Button>
                            }
                        </Grid>
                    </Grid>
                </Paper>
                <br />
                <Paper sx={{ padding: '2rem' }}>
                    <Typography variant='h4'>Korisne informacije</Typography>
                    <br />
                    <Stack direction='column' spacing='1rem'>
                        <Typography><b>Autor:</b> Mihael Petričević</Typography>
                        <Typography><b>Jezik skupa podataka:</b> Hrvatski / Croatian</Typography>
                        <Typography><b>Licenca</b> <a href="https://github.com/miha53cevic/ParkoviPrirodeDataSet/blob/main/LICENSE" target='_blank'>MIT</a></Typography>
                        <Typography><b>Formati:</b> CSV, JSON</Typography>
                        <Typography><b>Encoding:</b> UTF-8</Typography>
                        <Typography><b>Trenutna verzija skupa podataka:</b> 1.0.0</Typography>
                        <Typography><b>Zadnje ažurirano:</b> 1.11.2022.</Typography>
                        <Typography><b>Orginalno napravljeno:</b> 1.11.2022.</Typography>
                        <Typography><b>Baza Podataka:</b> PostgreSQL</Typography>
                        <Typography><b>Verzija PostgreSQL:</b> 15.0</Typography>
                    </Stack>
                </Paper>
                <br />
                <Paper sx={{ padding: '2rem' }}>
                    <Typography variant='h4'>Opis baze podataka</Typography>
                    <br />
                    <Stack direction='column' justifyContent='center' alignItems='center'>
                        <img src={'/baza.png'} alt='slika baze podataka' />
                    </Stack>
                </Paper>
                <br />
                <Paper sx={{ padding: '2rem' }}>
                    <Typography variant='h4'>Opis atributa</Typography>
                    <br />
                    <Stack direction='row' justifyContent='center'>
                        <table border={1}>
                            <thead>
                                <tr>
                                    <th>Naziv atributa</th>
                                    <th>Opis</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>idPark</td>
                                    <td>Jedinstvena šifra za Park Prirode</td>
                                </tr>
                                <tr>
                                    <td>naziv</td>
                                    <td>Naziv Parka Prirode</td>
                                </tr>
                                <tr>
                                    <td>povrsina</td>
                                    <td>Površina Parka u km^2</td>
                                </tr>
                                <tr>
                                    <td>utemeljen</td>
                                    <td>Datum kada je postao Park Prirode u YEAR-MONTH-DAY formatu</td>
                                </tr>
                                <tr>
                                    <td>sluzbenaStranica</td>
                                    <td>URL službene stranice</td>
                                </tr>
                                <tr>
                                    <td>email</td>
                                    <td>Email za kontakt Parka Prirode</td>
                                </tr>
                                <tr>
                                    <td>nazivLokacija</td>
                                    <td>Naziv lokacije gdje se nalazi Park Prirode</td>
                                </tr>
                                <tr>
                                    <td>nazivVrsta</td>
                                    <td>Koje vrste je, npr. Park Prirode ili Nacionalni Park</td>
                                </tr>
                                <tr>
                                    <td>tel</td>
                                    <td>Kontaktni broj parka (može ih biti više)</td>
                                </tr>
                                <tr>
                                    <td>nazivProdajnogMjesta</td>
                                    <td>Naziv mjesta gdje se mogu kupiti karte za ulaz u Park Prirode</td>
                                </tr>
                                <tr>
                                    <td>nazivDrzava</td>
                                    <td>Naziv drzave u kojoj se nalazi Park Prirode</td>
                                </tr>
                                <tr>
                                    <td>nazivZnamenitosti</td>
                                    <td>Naziv neke znamenitosti unutar Parka Prirode (može ih biti više)</td>
                                </tr>
                                <tr>
                                    <td>opisZnamenitosti</td>
                                    <td>opis neke znamenitosti u Parku Prirode</td>
                                </tr>
                            </tbody>
                        </table>
                    </Stack>
                </Paper>
            </Container>
        </main>
    );
};

export default Index;