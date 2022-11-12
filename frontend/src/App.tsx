import React from 'react'
import { ThemeProvider } from '@emotion/react';
import { CssBaseline } from '@mui/material';
import { BrowserRouter, Route, Routes } from 'react-router-dom';

import NotFound from './pages/NotFound';
import Index from './pages/Index';
import Datatable from './pages/Datatable';

import theme from './DefaultTheme';

const App: React.FC = () => {

    return (
        <ThemeProvider theme={theme}>
            <CssBaseline />
            <BrowserRouter>
                <Routes>
                    <Route path='*' element={<NotFound />} />
                    <Route path='/' element={<Index />} />
                    <Route path='/datatable' element={<Datatable />} />
                </Routes>
            </BrowserRouter>
        </ThemeProvider>
    );
}

export default App
