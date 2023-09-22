import { Box, Button, Container, Typography, TextField, FormControlLabel, Checkbox, Grid, Link } from "@mui/material"

const SignInForm = () => {
  return (
    <Container component="main" maxWidth="xs">
      <Box
        sx={{
          marginTop: 15,
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center'
        }}
      >
        <Typography component="h1" variant="h5">
          Sign In
        </Typography>

        <Box component="form" sx={{ mt: 1 }}>
          <TextField 
            margin="normal"
            required
            fullWidth
            id="email"
            name="email"
            label="Email Address"
            autoFocus
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

          <FormControlLabel 
            control={<Checkbox value="remember" color="primary" />}
            label="Remember me"
          />

          <Button
            sx={{ mt: 2, mb: 2 }}
            type="submit"
            fullWidth
            variant="contained"
          >
            Sign In
          </Button>

          <Grid container>
            <Grid item xs>
              <Link href="#" variant="body2">
                Forgot password?
              </Link>
            </Grid>

            <Grid item>
              <Link href="#" variant="body2">
                {"Don't have an account? Sign Up"}
              </Link>
            </Grid>
          </Grid>
        </Box>
      </Box>

    </Container>
  )
}

export default SignInForm