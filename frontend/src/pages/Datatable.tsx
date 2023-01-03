import React, { useState, useEffect } from 'react';
import { Container } from '@mui/material';

import TopAppBar from '../components/TopAppBar';
import DataTableContent from '../features/DataTableContent';

const Datatable: React.FC = () => {

    const [data, setData] = useState([]);

    //////////////////////////////////////////////////////////////////////////////////

    // Load data
    useEffect(() => {
        fetch(import.meta.env.VITE_BACKEND_URL + '/podaci')
            .then(res => res.json())
            .then(data => setData(data.response))
            .catch(err => console.error(err));
    }, []);

    //////////////////////////////////////////////////////////////////////////////////

    if (!data.length) return <p>Loading</p>;
    else {
        const columns = Object.keys(data[0]);
        return (
            <main>
                <TopAppBar />
                <Container sx={{ padding: '2rem' }}>
                    <DataTableContent data={data} columns={columns} />
                </Container>
            </main>
        )
    };
};

export default Datatable;