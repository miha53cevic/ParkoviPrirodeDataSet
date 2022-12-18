import { Pool } from 'pg';

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'ORLab',
    password: 'Radijator1',
    port: 5432,
});

const query = async (sql: string, paramaters: any[]) => {
    try {
        const response = await pool.query(sql, paramaters);
        return {
            response: response,
            error: null,
        };
    } catch (err) {
        console.error(err);
        return {
            response: null,
            error: err,
        };
    }
};

export default query;