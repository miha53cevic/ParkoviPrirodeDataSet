import React from 'react'
import { ThemeProvider } from '@emotion/react';
import { CssBaseline } from '@mui/material';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { Auth0Provider } from "@auth0/auth0-react";

import NotFound from './pages/NotFound';
import Index from './pages/Index';
import Datatable from './pages/Datatable';
import Profil from './pages/Profil';

import theme from './DefaultTheme';

const App: React.FC = () => {

    return (
        <ThemeProvider theme={theme}>
            <CssBaseline />
            <Auth0Provider
                domain='dev-drb7mvsbbxrv6sa8.eu.auth0.com'
                clientId='cFrxXfiBe34cOlC2LUHHRcmesL5K7WTS'
                redirectUri={window.location.origin}
                useRefreshTokens
                cacheLocation="localstorage"
            >
                <BrowserRouter>
                    <Routes>
                        <Route path='*' element={<NotFound />} />
                        <Route path='/' element={<Index />} />
                        <Route path='/datatable' element={<Datatable />} />
                        <Route path='/profil' element={<Profil />} />
                    </Routes>
                </BrowserRouter>
            </Auth0Provider>
        </ThemeProvider>
    );
}

export default App
