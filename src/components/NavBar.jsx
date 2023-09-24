import { AppBar, Box, Button, Container, Link, Toolbar, Typography } from "@mui/material"
import { Link as RouterLink } from 'react-router-dom'

const NavBar = () => {

  return (
    <Container>
      <AppBar
        position="static"
        elevation={0}
        sx={{
          bgcolor: 'white',
          color: 'black'
        }}
      >
        <Toolbar
          disableGutters={true}
          sx={{
            display: 'flex',
            justifyContent: 'space-between',
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
                mr: 0,
                textDecoration: 'none'
              }}
            >
              Sign In
            </Button>
          </Box>
        </Toolbar>
      </AppBar>
    </Container>
  )
}

export default NavBar