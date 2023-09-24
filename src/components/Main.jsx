import { Box, Button, Card, CardActions, CardContent, Container, Grid, Typography } from "@mui/material"
import PaymentsOutlinedIcon from '@mui/icons-material/PaymentsOutlined'
import ManageAccountsOutlinedIcon from '@mui/icons-material/ManageAccountsOutlined'
import PieChartOutlineOutlinedIcon from '@mui/icons-material/PieChartOutlineOutlined'

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
  return (
    <Box component="main">
      <Container
        sx={{
          display: 'flex',
          alignItems: 'center',
          width: '100%',
          py: 15
        }}
      >
        <Box>
          <Typography component="h1" variant="h2" sx={{ fontWeight: 500 }}>
            The best free ERP for small businesses
          </Typography>
          <Typography sx={{ mt: 1, color: "#74808B", fontWeight: 'light' }} variant="h6">
            Inventix is the only platform you will ever need to help run your business
          </Typography>
          <Box sx={{ mt: 2 }}>
            <Button variant="contained" sx={{ mr: 2, py: 1, px: 4 }}>Start Now</Button>
            <Button variant="outlined" sx={{ py: 1, px: 4 }}>Contact Us</Button>
          </Box>
        </Box>
        <Box
          component="img"
          src="https://erpnext.com/files/erpnext-hero-compressed.png"
          sx={{ width: [0, 0, '45%', '45%', '45%'], objectFit: 'cover' }}
        >
        </Box>
      </Container>

      <Box sx={{ py: 15, bgcolor: '#f9fafa' }}>
        <Container>
          <Typography variant="h3" sx={{ fontWeight: 500 }}>Complete, versatile and powerful</Typography>
          <Typography sx={{ mt: 1, color: "#74808B", fontWeight: 'light' }} variant="h6">
            Designed for both, simplicity and power
          </Typography>

          <Box
            component="img"
            src="./src/images/dashboard.png"
            sx={{ mt: 7, objectFit: 'contain', maxWidth: '100%' }}
          >
          </Box>
        </Container>
      </Box>

      <Container sx={{ py: 15, width: '100%' }}>
        <Typography variant="h3" sx={{ fontWeight: 500 }}>
          Almost everything you need
        </Typography>
        <Typography sx={{ mt: 1, color: "#74808B", fontWeight: 'light' }} variant="h6">
          No more painful integrations.
        </Typography>
        
        <Grid container spacing={6} sx={{ mt: 3 }}>
          {features.map(feature => (
            <Grid key={feature.title} item xs={12} md={4}>

              <Card sx={{ border: "none", boxShadow: "none", height: '100%' }}>
                <Box sx={{ color: '#4C5A67'}}>{feature.icon}</Box>

                <Typography sx={{ fontWeight: 'bold' }} variant="h6">{feature.title}</Typography>

                <CardContent sx={{ px: 0 }}>
                  <Typography sx={{ color: '#4c5a67' }}>{feature.content}</Typography>
                </CardContent>

                <CardActions sx={{ px: 0 }}>
                  <Button sx={{ px: 0 }}>Learn More</Button>
                </CardActions>
              </Card>

            </Grid>
          ))}
        </Grid>
      </Container>
    </Box>
  )
}

export default Main