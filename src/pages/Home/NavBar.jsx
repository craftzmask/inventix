import { AppBar, Box, Button, Container, Link, Toolbar, Typography } from '@mui/material'
import { Link as RouterLink } from 'react-router-dom'

const links = [
  {
    title: 'feature',
    to: '#',
  },
  {
    title: 'contact',
    to: '#',
  },
  {
    title: 'pricing',
    to: '#',
  }
]

const NavBar = () => {
  return (
    <Container>
      <AppBar position='static' elevation={0} sx={{ bgcolor: 'white', color: 'black' }}>
        <Toolbar
          disableGutters={true}
          sx={{ display: 'flex', justifyContent: 'space-between' }}
        >

          <Typography variant='h6'>Inventix</Typography>

          <Box component='nav' display='flex' alignItems='center' columnGap={3}>
            {links.map(link => (
              <Link
                key={link.title}
                component={RouterLink}
                to={link.to}
                variant='button'
                sx={{
                  color: 'black',
                  textDecoration: 'none',
                  ':hover': { textDecoration: 'underline' }
                }}
              >
                {link.title}
              </Link>
            ))}

            <Button
              component={RouterLink} to='/login'
              variant='outlined'
              sx={{ textDecoration: 'none' }}
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