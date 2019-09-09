import React from 'react';

import classes from './NavigationItems.css';
import NavigationItem from './NavigationItem/NavigationItem';

const navigationItems = () => (
    <ul className={classes.NavigationItems}>
        <NavigationItem link="/" exact>Home</NavigationItem>
        <NavigationItem link="/diet">Diet</NavigationItem>
        <NavigationItem link="/training">Training</NavigationItem>
        <NavigationItem link="/settings">Settings</NavigationItem>
    </ul>
);

export default navigationItems;