import { Box, Button, Container, Typography, TextField, Grid, Link } from "@mui/material"

const SignUpForm = () => {
  return (
    <Container component="main" maxWidth="xs">
      <Box
        sx={{
          marginTop: 15,
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
        }}
      >
        <Typography component="h1" variant="h5">Sign Up</Typography>

        <Box component="form" sx={{ mt: 3 }}>
          <Grid container>
            <Grid item xs>
              <TextField
                required
                label="First Name"
              />
            </Grid>
            <Grid item>
              <TextField
                required
                label="Last Name"
              />
            </Grid>
          </Grid>

          <TextField
            margin="normal"
            required
            fullWidth
            id="email"
            name="email"
            type="email"
            label="Email Address"
          />
          <TextField
            margin="normal"
            required
            fullWidth
            id="password"
            name="password"
            type="password"
            label="Password"
          />
          <TextField
            margin="normal"
            required
            fullWidth
            id="confirm-password"
            name="confirm-password"
            type="password"
            label="Confirm Password"
          />

          <Button
            sx={{ mt: 2, mb: 2 }}
            fullWidth
            variant="contained"
          >
            Sign Up
          </Button>

          <Grid container justifyContent="flex-end">
            <Grid item>
              <Link href="#" variant="body2">
                Already have an account? Sign in
              </Link>
            </Grid>
          </Grid>
        </Box>
      </Box>
    </Container>
  )
}

export default SignUpForm