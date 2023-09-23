import { Box, Typography } from "@mui/material"
import { useRouteError } from "react-router-dom"

const ErrorPage = () => {
  const error = useRouteError()
  
  return (
    <Box
      sx={{
        marginTop: 50,
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        rowGap: 3,
        height: '100%'
      }}
    >
      <Typography component="h1" variant="h4" sx={{ fontWeight: 'bold' }}>Oops!</Typography>
      <Typography component="p">
        Sorry, an unexpected error has occurred.
      </Typography>
      <Typography component="p" sx={{ fontStyle: "italic", color: '#818181'  }}>
        {error.statusText || error.message}
      </Typography>
    </Box>
  )
}

export default ErrorPage