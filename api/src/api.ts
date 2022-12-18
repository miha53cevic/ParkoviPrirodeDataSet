import { Application } from "express";
import podaciRouter from './routers/podaciRouter';
import parkRouter from './routers/parkRouter';
import vrsteRouter from './routers/vrsteRouter';
import drzaveRouter from './routers/drzaveRouter';
import lokacijeRouter from './routers/lokacijeRouter';
import telefoniRouter from './routers/telefoniRouter';
import mjesta_prodajeRouter from './routers/mjesta_prodajeRouter';
import znamenitostiRouter from './routers/znamenitostiRouter';

import openapi from './openapi.json';

const baseUrl = '/api/v1/';

const api = (app: Application) => {
    app.use(baseUrl, podaciRouter);
    app.use(baseUrl, parkRouter);
    app.use(baseUrl, vrsteRouter);
    app.use(baseUrl, drzaveRouter);
    app.use(baseUrl, lokacijeRouter);
    app.use(baseUrl, telefoniRouter);
    app.use(baseUrl, mjesta_prodajeRouter);
    app.use(baseUrl, znamenitostiRouter);
    app.use(baseUrl, (req, res) => {
        res.status(200).send(openapi);
    });
};

export default api;