import { AppBar, Box, Button, Link, Toolbar, Typography } from "@mui/material"
import { Link as RouterLink } from 'react-router-dom'

const NavBar = () => {

  return (
    <AppBar
      position="static"
      elevation={0}
      sx={{
        bgcolor: 'white',
        color: 'black'
      }}
    >
      <Toolbar 
        sx={{
          display: 'flex',
          justifyContent: 'space-between'
        }}
      >
        <Typography variant="h6">Inventix</Typography>
        
        <Box component="nav" sx={{  }}>
          <Link
            component={RouterLink}
            variant="button"
            sx={{
              my: 1,
              mx: 1.5,
              color: 'black',
              textDecoration: 'none'
            }}
          >
            Features
          </Link>
          <Link
            component={RouterLink}
            variant="button"
            sx={{
              my: 1,
              mx: 1.5,
              color: 'black',
              textDecoration: 'none'
            }}
          >
            Support
          </Link>
          <Link
            component={RouterLink}
            variant="button"
            sx={{
              my: 1,
              mx: 1.5,
              color: 'black',
              textDecoration: 'none'
            }}
          >
            Pricing
          </Link>

          <Button
            component={RouterLink} to="/login"
            variant="outlined"
            sx={{
              my: 1,
              mx: 1.5,
              textDecoration: 'none'
            }}
          >
            Sign In
          </Button>
        </Box>
      </Toolbar>
    </AppBar>
  )
}

export default NavBar