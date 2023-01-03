import React from 'react';
import { Avatar, Container, Grid, Paper, Stack, Typography } from '@mui/material';
import { useAuth0 } from '@auth0/auth0-react';

import TopAppBar from '../components/TopAppBar';
import Loading from '../components/Loading';
import ForbiddenAccess from '../components/ForbiddenAccess';

const Profil: React.FC = () => {

    const { user, isAuthenticated, isLoading } = useAuth0();

    if (isLoading) return <Loading />;
    if (!isAuthenticated) return <ForbiddenAccess />;
    return (
        <main>
            <TopAppBar />
            <Container sx={{ padding: '2rem' }}>
                <Paper sx={{ padding: '4rem' }}>
                    <Grid container spacing='4rem'>
                        <Grid item xs={12} md={6}>
                            <Stack direction='column' alignItems='center' justifyContent='center'>
                                <Avatar sx={{ width: '64px', height: '64px' }} src={user?.picture} />
                            </Stack>
                        </Grid>
                        <Grid item xs={12} md={6}>
                            <Stack direction='column'>
                                <Typography variant='h6'>{user?.nickname}</Typography>
                                <Typography>{user?.email}</Typography>
                                <Typography variant='button' sx={{ color: user?.email_verified ? 'green' : 'red' }}>
                                    {user?.email_verified ? 'VERIFICIRAN EMAIL' : 'NIJE VERIFICIRAN EMAIL'}
                                </Typography>
                            </Stack>
                        </Grid>
                    </Grid>
                </Paper>
            </Container>
        </main>
    );
};

export default Profil;