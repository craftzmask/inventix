import { Container, GlobalStyles } from "@mui/material"

import NavBar from "./components/NavBar"

const App = () => {
  return (
    <Container sx={{ textAlign: 'center', height: '100%' }}>
      <GlobalStyles styles={{ ul: { margin: 0, padding: 0, listStyle: 'none' } }} />
      <NavBar />
    </Container>
  )
}

export default App
