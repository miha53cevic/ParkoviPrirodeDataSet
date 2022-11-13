import React, { useState } from 'react';
import { MenuItem, Paper, Select, TextField, FormControl, InputLabel, Button, Typography, Stack, Box } from '@mui/material';
import CsvDownloadButton from 'react-json-to-csv';
import { AgGridReact } from 'ag-grid-react';

import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';
import { GridApi } from 'ag-grid-community';

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

export interface Props {
    data: any[],
    columns: string[],
};

const DataTableContent: React.FC<Props> = ({ data, columns }) => {

    const [search, setSearch] = useState('');
    const [select, setSelect] = useState('wildcard');

    const [gridApi, setGridApi] = useState<GridApi<any> | null>(null);

    const [filteredData, setFilteredData] = useState<any[]>([]);

    ///////////////////////////////////////////////////////////////////////////

    const handleTrazi = async () => {
        if (!gridApi) return;

        // Reset all previous filters
        gridApi.setFilterModel(null);
        gridApi.setQuickFilter('');
        setFilteredData([]);

        if (select !== 'wildcard') {
            const instance = gridApi.getFilterInstance(select);
            //console.log(await instance?.getModel()); // Prvo napravi neki filter pa ga log da vidis kak izgleda object
            await instance?.setModel({ filterType: "text", type: "contains", filter: search })
            gridApi.onFilterChanged();
        } else {
            gridApi.setQuickFilter(search);
        }
    };

    /////////////////////////////////////////////////////////////////////////////////

    const downloadFile = (jsonFile: ParkJSON[]) => {
        const jsonString = `data:text/json;chatset=utf-8,${encodeURIComponent(
            JSON.stringify(jsonFile)
        )}`;
        const link = document.createElement("a");
        link.href = jsonString;
        link.download = "filtrirani.json";

        link.click();
    };

    const combineRowsToJSON = (data: any) => {
        // Spoji CSV duplic format (ParkCSVToJSON) u ParkJSON format
        const map = new Map<number, ParkJSON>();
        for (const park of data as ParkCSVToJSON[]) {
            if (map.has(park.idpark)) {
                if (!map.get(park.idpark)?.tel.includes(park.tel)) {
                    map.get(park.idpark)?.tel.push(park.tel);
                }
                if (!map.get(park.idpark)?.nazivprodajnogmjesta.includes(park.nazivprodajnogmjesta)) {
                    map.get(park.idpark)?.nazivprodajnogmjesta.push(park.nazivprodajnogmjesta);
                }
                if (!map.get(park.idpark)?.znamenitost.some((val) => val.nazivznamenitosti === park.nazivznamenitosti)) {
                    map.get(park.idpark)?.znamenitost.push({ nazivznamenitosti: park.nazivznamenitosti, opisznamenitosti: park.opisznamenitosti });
                }
            } else {
                map.set(park.idpark, {
                    idpark: park.idpark,
                    naziv: park.naziv,
                    povrsina: park.povrsina,
                    utemeljen: park.utemeljen,
                    sluzbenastranica: park.sluzbenastranica,
                    email: park.email,
                    nazivlokacija: park.nazivlokacija,
                    nazivdrzava: park.nazivdrzava,
                    tel: [park.tel],
                    nazivvrsta: park.nazivvrsta,
                    nazivprodajnogmjesta: [park.nazivprodajnogmjesta],
                    znamenitost: [{ nazivznamenitosti: park.nazivznamenitosti, opisznamenitosti: park.opisznamenitosti }]
                });
            }
        }
        const finalJSON: ParkJSON[] = [];
        map.forEach((park => finalJSON.push(park)));
        downloadFile(finalJSON);
    };


    const downloadJSON = () => {
        // Provjeri za slucaj da nismo jos trazili, a filtered je po defaultu prazan []
        if (search === '') {
            combineRowsToJSON(data);
        } else {
            combineRowsToJSON(filteredData);
        }
    };

    ///////////////////////////////////////////////////////////////////////////

    return (
        <>
            <Paper>
                <Stack direction='row' spacing='1rem' padding='1rem' justifyContent='end'>
                    <CsvDownloadButton data={(search !== '') ? filteredData : data} filename='filtrirani.csv'>Preuzmi CSV</CsvDownloadButton>
                    <Button variant='contained' color='secondary' onClick={downloadJSON}>Preuzmi JSON</Button>
                </Stack>
            </Paper>
            <br />
            <Paper>
                <div className="ag-theme-alpine" style={{ height: 'calc(100vh - 96px - 2rem)', width: '100%' }}>
                    <AgGridReact
                        onFilterChanged={(e) => e.api.forEachNodeAfterFilter((item) => { setFilteredData(old => [item.data, ...old]) })}
                        rowData={data}
                        columnDefs={columns.map(item => { return { field: item, filter: true } })}
                        pagination={true}
                        paginationPageSize={100}
                        onGridReady={(e) => setGridApi(e.api)}
                    />
                </div>
            </Paper>
            <br />
            <Paper sx={{ padding: '2rem' }}>
                <Typography variant='h4'>Filtracija</Typography>
                <br />
                <TextField label='Traži' fullWidth onChange={(e) => setSearch(e.target.value)} />
                <br />
                <br />
                <Stack direction='column' spacing='1rem'>
                    <FormControl sx={{ width: '250px' }}>
                        <InputLabel id="select">Odaberi polja za pretragu</InputLabel>
                        <Select
                            label='Odaberi polja za pretragu'
                            labelId='select'
                            value={select}
                            onChange={(e) => setSelect(e.target.value)}
                        >
                            <MenuItem value='wildcard'>Sva polja (wildcard)</MenuItem>
                            {columns.map((item, index) => (
                                <MenuItem key={index} value={item}>{item}</MenuItem>
                            ))}
                        </Select>
                    </FormControl>
                    <Box>
                        <Button variant='contained' color='secondary' onClick={handleTrazi}>Pretraži</Button>
                    </Box>
                </Stack>
            </Paper>
        </>
    );
};

export default DataTableContent;