import React from 'react';
import { CircularProgress, Stack } from '@mui/material';

const Loading = () => {
    return (
        <Stack direction='column' justifyContent='center' alignItems='center' sx={{ minHeight: '100vh' }}>
            <CircularProgress />
        </Stack>
    );
};

export default Loading;