import { Request, Response } from "express";

export interface Znamenitost {
    nazivznamenitosti: string,
    opisznamenitosti: string,
};

export interface ParkJSON {
    idpark: number,
    naziv: string,
    povrsina: string,
    utemeljen: string,
    sluzbenastranica: string,
    email: string,
    nazivlokacija: string,
    nazivdrzava: string,
    tel: string[],
    nazivvrsta: string,
    nazivprodajnogmjesta: string[],
    znamenitost: Znamenitost[],
};

export interface ParkJSONLD {
    '@context': {
        '@vocab': string,
        [key: string]: string,
    },
    '@type': string,
    idpark: number,
    naziv: string,
    povrsina: {
        '@type': string,
        '@value': string,
    },
    utemeljen: {
        '@type': string,
        '@value': string,
    },
    sluzbenastranica: string,
    email: string,
    nazivlokacija: string,
    nazivdrzava: string,
    tel: string[],
    nazivvrsta: string,
    nazivprodajnogmjesta: string[],
    znamenitost: Znamenitost[],
};

export interface ParkCSVToJSON {
    idpark: number,
    naziv: string,
    povrsina: string,
    utemeljen: string,
    sluzbenastranica: string,
    email: string,
    nazivlokacija: string,
    nazivdrzava: string,
    tel: string,
    nazivvrsta: string,
    nazivprodajnogmjesta: string,
    nazivznamenitosti: string,
    opisznamenitosti: string,
};

export const createResponse = (status: string, message: string, response: any) => {
    return {
        status: status,
        message: message,
        response: response,
    };
};

export const NOT_IMPLEMENTED = (req: Request, res: Response) => {
    res.status(501).json(createResponse("Not Implemented", "Method not implemented for requested resource", null));
};
