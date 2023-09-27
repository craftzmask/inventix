import { useInView } from 'react-intersection-observer'
import { Box, Button, Container, Fade, Grid, Typography } from '@mui/material'
import { Link as RouterLink } from 'react-router-dom'
import PaymentsOutlinedIcon from '@mui/icons-material/PaymentsOutlined'
import ManageAccountsOutlinedIcon from '@mui/icons-material/ManageAccountsOutlined'
import PieChartOutlineOutlinedIcon from '@mui/icons-material/PieChartOutlineOutlined'
import dashboardImage from '../../assets/dashboard.png'
import heroImage from '../../assets/hero-image.png'

const features = [
  {
    icon: <PaymentsOutlinedIcon fontSize='large' />,
    title: 'Financial Accounting',
    content: 'Get a real-time view of your cash flow. Full-fledged accounting module covering every aspect of bookkeeping.'
  },
  {
    icon: <ManageAccountsOutlinedIcon fontSize='large' />,
    title: 'Order Management',
    content: 'Increase productivity and lower costs by managing your sales and purchase cycles, from purchase to sales orders'
  }
  ,  {
    icon: <PieChartOutlineOutlinedIcon fontSize='large' />,
    title: 'CRM',
    content: 'Retain more customers by optimizing the sales process. Track leads, opportunities, and send the quotes on the go.'
  }
]

const Main = () => {
  const { ref, inView } = useInView({ threshold: 0 })

  return (
    <Box component='main'>
      <Container sx={{ display: 'flex', alignItems: 'center', pt: 10, pb: 15 }}>
        <Box display='flex' flexDirection='column' rowGap={2}>
          <Typography component='h1' variant='h2' sx={{ fontWeight: 500 }}>
            The best free ERP for small businesses
          </Typography>
          <Typography variant='h6' sx={{ color: '#74808B', fontWeight: 'light' }}>
            Inventix is the only platform you will ever need to help run your business
          </Typography>
          <Box display='flex' columnGap={2}>
            <Button
              component={RouterLink}
              to='login'
              variant='contained'
              sx={{ py: 1, px: 4 }}
            >
              Start Now
            </Button>
            <Button
              component={RouterLink}
              to='contact'
              variant='outlined'
              sx={{ py: 1, px: 4 }}
            >
              Contact Us
            </Button>
          </Box>
        </Box>
        <Box
          component='img'
          src={heroImage}
          sx={{ width: [0, 0, '45%', '45%', '45%'], objectFit: 'contain' }}
        >
        </Box>
      </Container>

      <Box sx={{ py: 10, bgcolor: '#f9fafa' }}>
        <Container>
          <Typography variant='h4' sx={{ fontWeight: 500 }}>
            Complete, versatile and powerful
          </Typography>
          <Typography variant='h6' sx={{ mt: 1, color: "#74808B", fontWeight: 'light' }}>
            Designed for both, simplicity and power
          </Typography>

          <Box
            component='img'
            src={dashboardImage}
            sx={{ mt: 7, objectFit: 'contain', maxWidth: '100%' }}
          />
        </Container>
      </Box>

      <Container sx={{ display: 'flex', flexDirection: 'column', py: 10 }}>
        <Typography variant='h4' sx={{ fontWeight: 500 }}>
          Almost everything you need
        </Typography>
        <Typography variant='h6' sx={{ color: '#74808B', fontWeight: 'light' }}>
          No more painful integrations.
        </Typography>
        
          <Grid ref={ref} container spacing={5} mt={1}>
            {features.map((feature, i) => (
              <Fade
                key={feature.title}
                in={inView}
                timeout={{ appear: 0, enter: 1000 + (i * 500), exit: 0 }}
              >
                <Grid
                  item
                  xs={12}
                  md={4}
                  sx={{
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'start',
                    rowGap: 1
                  }}
                >
                  <Box sx={{ color: '#4C5A67'}}>{feature.icon}</Box>
                  <Typography variant='h6' sx={{ fontWeight: 'bold' }}>
                    {feature.title}
                  </Typography>
                  <Typography sx={{ color: '#4c5a67' }}>
                    {feature.content}
                  </Typography>
                  <Button sx={{ px: 0 }}>
                    Learn More
                  </Button>
                </Grid>
              </Fade>
            ))}
          </Grid>
      </Container>
    </Box>
  )
}

export default Main