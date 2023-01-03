import React from 'react';
import { AppBar, Box, Button, Stack, Toolbar, Typography } from '@mui/material';
import ForestIcon from '@mui/icons-material/Forest';
import { useNavigate } from 'react-router-dom';

import UserSettingsButton from './components/UserSettingsButton';

const TopAppBar: React.FC = () => {

    const navigateTo = useNavigate();

    /////////////////////////////////////////////////////////////////

    const handleLogoClick = () => {
        navigateTo('/');
    };

    const handleDataTableClick = () => {
        navigateTo('/datatable');
    };

    /////////////////////////////////////////////////////////////////

    return (
        <AppBar position='relative'>
            <Toolbar>
                <Stack direction='row' onClick={handleLogoClick} sx={{ cursor: 'pointer', flex: 1 }}>
                    <ForestIcon fontSize='large' />
                    <Typography
                        variant="h6"
                        sx={{
                            mx: 2,
                            fontFamily: 'monospace',
                            fontWeight: 'bold',
                            letterSpacing: '.3rem',
                            color: 'inherit',
                        }}
                    >
                        Parkovi Prirode DataSet
                    </Typography>
                </Stack>
                <Box sx={{ mr: '1rem' }}>
                    <Button
                        variant='contained'
                        color='secondary'
                        onClick={handleDataTableClick}
                    >
                        Datatable
                    </Button>
                </Box>
                <UserSettingsButton />
            </Toolbar>
        </AppBar>
    );
};

export default TopAppBar;