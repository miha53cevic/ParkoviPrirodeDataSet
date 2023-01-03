import React from 'react';
import IconButton from '@mui/material/IconButton';
import { Menu, MenuItem, Avatar, CircularProgress } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import { useAuth0 } from '@auth0/auth0-react';

/**
 * A dropdown button that should be used on AppBars
 * @returns void
 * @example
 * return <UserSettingsButton />
 */
const UserSettingsButton: React.FC = () => {

    const route = useNavigate();

    const { user, isAuthenticated, isLoading, logout, loginWithPopup } = useAuth0();

    ///////////////////////////////////////////////////////////////////////////////////

    const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null);
    const open = Boolean(anchorEl);
    
    const handleClick = (event: React.MouseEvent<HTMLElement>) => {
        setAnchorEl(event.currentTarget);
    };

    const handleClose = () => {
        setAnchorEl(null);
    };

    ///////////////////////////////////////////////////////////////////////////////////

    const handleProfile = () => {
        handleClose();
        route('/profil');
    };

    const handleLogout = async () => {
        handleClose();
        logout({ returnTo: window.location.origin, localOnly: true, });
    };

    const handleLogoutAuth0 = async () => {
        handleClose();
        logout({ returnTo: window.location.origin });
    };

    const handleLogin = async () => {
        handleClose();
        await loginWithPopup();
    };

    ///////////////////////////////////////////////////////////////////////////////////
    if (isLoading) return <CircularProgress color='secondary' />;
    if (!isAuthenticated) {
        return (
            <div>
                <IconButton
                    onClick={handleClick}
                >
                    <Avatar sx={{ color: 'white', width: '48px', height: '48px' }} />
                </IconButton>
                <Menu
                    anchorEl={anchorEl}
                    open={open}
                    onClose={handleClose}
                >
                    <MenuItem onClick={handleLogin}>Login</MenuItem>
                </Menu>
            </div>
        );
    } else {
        return (
            <div>
                <IconButton
                    onClick={handleClick}
                >
                    <Avatar sx={{ color: 'white', width: '48px', height: '48px' }} src={user?.picture} />
                </IconButton>
                <Menu
                    anchorEl={anchorEl}
                    open={open}
                    onClose={handleClose}
                >
                    <MenuItem onClick={handleProfile}>Profil</MenuItem>
                    <MenuItem onClick={handleLogout}>Logout</MenuItem>
                    <MenuItem onClick={handleLogoutAuth0}>Logout Auth0</MenuItem>
                </Menu>
            </div>
        );
    }
};

export default UserSettingsButton;