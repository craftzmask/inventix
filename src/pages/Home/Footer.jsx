import { Box, Container, IconButton, Link, Typography } from '@mui/material'
import { Link as RouterLink } from 'react-router-dom'
import FacebookIcon from '@mui/icons-material/Facebook'
import InstagramIcon from '@mui/icons-material/Instagram'
import TwitterIcon from '@mui/icons-material/Twitter'

const companyLinks = [
  {
    title: 'about us',
    to: '#'
  },
  {
    title: 'pricing',
    to: '#'
  }
]

const serviceLinks = [
  {
    title: 'contact',
    to: '#'
  },
  {
    title: 'sign in',
    to: '/login'
  },
  {
    title: 'sign up',
    to: '/signup'
  }
]

const legalLinks = [
  {
    title: 'terms & conditions',
    to: '#'
  },
  {
    title: 'privacy policy',
    to: '#'
  },
  {
    title: 'licenses',
    to: '#'
  }
]

const Footer = () => {
  return (
    <Box pt={5} pb={1} bgcolor='#f9fafa'>
      <Container sx={{ display: 'flex', justifyContent: 'space-between' }}>
        <Box>
          <Typography variant='h6'>Inventix</Typography>
          <Box display='flex' columnGap={2} mt={2}>
            <IconButton sx={{ p: 0 }}>
              <FacebookIcon />
            </IconButton>
            <IconButton sx={{ p: 0 }}>
              <InstagramIcon />
            </IconButton>
            <IconButton sx={{ p: 0 }}>
              <TwitterIcon />
            </IconButton>
          </Box>
        </Box>

        <Box display='flex' alignItems='center' columnGap={20}>
          <Box display='flex' flexDirection='column' rowGap={1}>
            <Typography>Company</Typography>
            {linksGenerator(companyLinks)}
          </Box>
          <Box display='flex' flexDirection='column' rowGap={1}>
            <Typography>Services</Typography>
            {linksGenerator(serviceLinks)}  
          </Box>
          <Box display='flex' flexDirection='column' rowGap={1}>
            <Typography>Legal</Typography>
            {linksGenerator(legalLinks)}
          </Box>
        </Box>
      </Container>

      <Container sx={{ mt: 5, color: '#74808B', fontWeight: 'light' }}>
        <Typography>© Inventix | Disclaimer and Terms of Use.</Typography>
      </Container>
    </Box>
  )
}

const linksGenerator = links => (
  links.map(link => (
    <Link key={link.title} component={RouterLink} to={link.to} sx={{
        color: '#4c5a67',
        textDecoration: 'none',
        ':hover': { textDecoration: 'underline' } 
      }}
    >
      <Typography sx={{ textTransform: 'capitalize' }}>
        {link.title}
      </Typography>
    </Link>
  ))
)

export default Footer