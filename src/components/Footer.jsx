import { Box, Container, IconButton, Link, Typography } from "@mui/material"
import { Link as RouterLink } from 'react-router-dom'
import FacebookIcon from '@mui/icons-material/Facebook'
import InstagramIcon from '@mui/icons-material/Instagram'
import TwitterIcon from '@mui/icons-material/Twitter'

const Footer = () => {
  return (
    <Box sx={{ pt: 5, pb: 1, bgcolor: '#f9fafa' }}>
      <Container sx={{ display: 'flex', justifyContent: 'space-between' }}>
        <Box>
          <Typography variant="h6">Inventix</Typography>
          <Box sx={{ mt: 2, display: 'flex', columnGap: 2 }}>
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

        <Box sx={{ display: 'flex', columnGap: 20 }}>
          <Box sx={{ display: 'flex', flexDirection: 'column', rowGap: 1 }}>
              <Typography>Company</Typography>
              <Link component={RouterLink} to="/contact" sx={{
                  color: '#4c5a67',
                  textDecoration: 'none',
                  ":hover": { textDecoration: 'underline' } 
                }}
              >
                <Typography>About Us</Typography>
              </Link>

              <Link sx={{
                  color: '#4c5a67',
                  textDecoration: 'none',
                  ":hover": { textDecoration: 'underline' } 
                }}
              >
                <Typography>Pricing</Typography>
              </Link>
            </Box>


          <Box sx={{ display: 'flex', flexDirection: 'column', rowGap: 1 }}>
            <Typography>Services</Typography>
            <Link component={RouterLink} to="/contact" sx={{
                color: '#4c5a67',
                textDecoration: 'none',
                ":hover": { textDecoration: 'underline' } 
              }}
            >
              <Typography>Contact</Typography>
            </Link>
            <Link component={RouterLink} to="/login" sx={{
                color: '#4c5a67',
                textDecoration: 'none',
                ":hover": { textDecoration: 'underline' } 
              }}
            >
              <Typography>Login</Typography>
            </Link>
            <Link component={RouterLink} to="/signup" sx={{
                color: '#4c5a67',
                textDecoration: 'none',
                ":hover": { textDecoration: 'underline' } 
              }}
            >
              <Typography>Sign Up</Typography>
            </Link>
          </Box>

          <Box sx={{ display: 'flex', flexDirection: 'column', rowGap: 1 }}>
            <Typography>Legal</Typography>
            <Link sx={{
                color: '#4c5a67',
                textDecoration: 'none',
                ":hover": { textDecoration: 'underline' } 
              }}
            >
              <Typography>Terms & Conditions</Typography>
            </Link>
            <Link sx={{
                color: '#4c5a67',
                textDecoration: 'none',
                ":hover": { textDecoration: 'underline' } 
              }}
            >
              <Typography>Privacy Policy</Typography>
            </Link>
            <Link sx={{
                color: '#4c5a67',
                textDecoration: 'none',
                ":hover": { textDecoration: 'underline' } 
              }}
            >
              <Typography>Licenses (EULA)</Typography>
            </Link>
          </Box>
        </Box>

      </Container>

      <Container sx={{ mt: 5, color: "#74808B", fontWeight: 'light' }}>
        <Typography>© Inventix | Disclaimer and Terms of Use.</Typography>
      </Container>
    </Box>
  )
}

export default Footer